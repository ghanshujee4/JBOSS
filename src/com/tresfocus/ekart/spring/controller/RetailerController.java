package com.tresfocus.ekart.spring.controller;

import java.util.List;
import java.util.Map;

import javax.jms.JMSException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tresfocus.ekart.IConstants;
import com.tresfocus.ekart.Utility;
import com.tresfocus.ekart.hibernate.entity.LookupType;
import com.tresfocus.ekart.hibernate.entity.OrderHistory;
import com.tresfocus.ekart.hibernate.entity.OrderLines;
import com.tresfocus.ekart.hibernate.entity.Orders;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.jms.EmailMessageSender;
import com.tresfocus.ekart.spring.service.LookupTypeManager;
import com.tresfocus.ekart.spring.service.OrderHistoryManager;
import com.tresfocus.ekart.spring.service.OrderLinesManager;
import com.tresfocus.ekart.spring.service.OrdersManager;
import com.tresfocus.ekart.spring.service.UserAddressManager;
import com.tresfocus.ekart.spring.service.UserManager;

@Controller
@SessionAttributes({"user"})
public class RetailerController {
	@Autowired
    private UserManager userManager;
	@Autowired
    private LookupTypeManager lkupManager;
	@Autowired
    private OrdersManager orderManager;
	@Autowired
	private OrderHistoryManager orderHistoryManager;
	@Autowired
	private OrderLinesManager orderLinesManager;		
	@Autowired
	private UserAddressManager userAddressManager;		
	@Autowired
	private EmailMessageSender emailMsgSender;		

	@RequestMapping(value = "/retailer/index.shx", method = RequestMethod.GET)
	public String showOrders(ModelMap map, HttpSession session) throws JMSException{
		User user = (User) session.getAttribute(IConstants.SESSION_USER);
		if(user == null)
			return "redirect:/retailer/home";
		
		Map<String, String> lookupTypes = lkupManager.getLookupsByType(IConstants.LOOKUP_TYPE_ORDER_STATUS);
		map.addAttribute("lookupTypes", lookupTypes);
		map.addAttribute("userFullName", Utility.getUserFullName(userAddressManager, user.getId()));
		map.addAttribute("orderedStatus", IConstants.ORDER_STATUS_ORDERED);
		map.addAttribute(user);
		return "/retailer/home";
	}
	
	@RequestMapping(value = "/retailer/orderDetail.shx", method = RequestMethod.GET)
	public String getOrderById(ModelMap map, @RequestParam(value="orderId") Integer orderId, @ModelAttribute User user) throws Exception{
		Orders orderObj = orderManager.getByKey(orderId, user);
		Map<String, String> lookupTypes = lkupManager.getLookupsByType(IConstants.LOOKUP_TYPE_ORDER_STATUS);
		
		if(orderObj == null)
			return "redirect:/noPermission";
		
		String currentStatus = lookupTypes.get(orderObj.getStatus());
		String nextPositiveStatus = null;
		String nextPositiveStatusCode = null;
		boolean displayActionButtons = true;
		boolean isPackagingStatus = IConstants.ORDER_STATUS_PACKAGING.equalsIgnoreCase(orderObj.getStatus());
		
		if(IConstants.ORDER_STATUS_ORDERED.equalsIgnoreCase(orderObj.getStatus())){ 
			nextPositiveStatus = lookupTypes.get(IConstants.ORDER_STATUS_CONFIRMED);
			nextPositiveStatusCode = IConstants.ORDER_STATUS_CONFIRMED;
		 } else if(IConstants.ORDER_STATUS_CONFIRMED.equalsIgnoreCase(orderObj.getStatus())){ 
			nextPositiveStatus=lookupTypes.get(IConstants.ORDER_STATUS_PACKAGING);
			nextPositiveStatusCode = IConstants.ORDER_STATUS_PACKAGING;
		 }else if(IConstants.ORDER_STATUS_PACKAGING.equalsIgnoreCase(orderObj.getStatus())){ 
			nextPositiveStatus=lookupTypes.get(IConstants.ORDER_STATUS_READY_FOR_DELIVERY);					
			nextPositiveStatusCode = IConstants.ORDER_STATUS_READY_FOR_DELIVERY;
		 }else if(IConstants.ORDER_STATUS_READY_FOR_DELIVERY.equalsIgnoreCase(orderObj.getStatus())){ 
			nextPositiveStatus=lookupTypes.get(IConstants.ORDER_STATUS_OUT_FOR_DELIVERY);						
			nextPositiveStatusCode = IConstants.ORDER_STATUS_OUT_FOR_DELIVERY;
		 }else if(IConstants.ORDER_STATUS_OUT_FOR_DELIVERY.equalsIgnoreCase(orderObj.getStatus())){ 
			nextPositiveStatus=lookupTypes.get(IConstants.ORDER_STATUS_DELIVERED);						
			nextPositiveStatusCode = IConstants.ORDER_STATUS_DELIVERED;
		 } else if(IConstants.ORDER_STATUS_REJECTED.equalsIgnoreCase(orderObj.getStatus()) ||
				   IConstants.ORDER_STATUS_DELIVERED.equalsIgnoreCase(orderObj.getStatus())){ 
			 displayActionButtons = false;
		 }
		
		map.addAttribute("currentStatus", currentStatus);
		map.addAttribute("nextPositiveStatus", nextPositiveStatus);
		map.addAttribute("nextPositiveStatusCode", nextPositiveStatusCode);
		map.addAttribute("displayActionButtons", displayActionButtons);
		map.addAttribute("order", orderObj);
		map.addAttribute("rejectedLabel", lookupTypes.get(IConstants.ORDER_STATUS_REJECTED));
		map.addAttribute("rejectedStatus", IConstants.ORDER_STATUS_REJECTED);
		map.addAttribute("orderedStatus", IConstants.ORDER_STATUS_ORDERED);
		map.addAttribute("isPackagingStatus", isPackagingStatus);
		map.addAttribute("userFullName", Utility.getUserFullName(userAddressManager, user.getId()));
		
		if(orderObj.getIsNew())
			updateOrderNewStatus(orderObj, user);
		return "/retailer/orderDetail";
	}
	
	@RequestMapping(value = "/retailer/myOrdersByStatus", method = RequestMethod.GET, headers="Accept=*/*",
			produces = "application/json; charset=utf-8")
	 public @ResponseBody String getMyOrders(@RequestParam(value="osb") String osb, @ModelAttribute User user) throws Exception{  
		JSONObject aaJsonObject = new JSONObject();

		try {
			List<Orders> ordList = orderManager.getOrderByStatus(osb, user);
			JSONArray jArray = new JSONArray();
			
			for (Object obj : ordList) {
				Object[] objArray = (Object[])obj;
				Orders ordr = (Orders)objArray[0];
				LookupType lkupType = (LookupType)objArray[1];

				String name = ordr.getAddressByBillingAddressId().getFirstName()
						+ " "
						+ ordr.getAddressByBillingAddressId().getLastName();
				
				
				JSONObject jObject = new JSONObject();
				jObject.put("id", ordr.getId());
				jObject.put("isNew", ordr.getIsNew());
				jObject.put("priority", ordr.getPriority());
				jObject.put("orderNum", ordr.getOrderNumber());
				jObject.put("address", Utility.getNameAddress(name, ordr.getAddressByBillingAddressId()));
				jObject.put("deliverytime", Utility.formatDate(ordr.getExpectedDeliveryTime()));
				jObject.put("amount", user.getOperatingCurrency() + " " +  Utility.formatNumber(ordr.getItemValue()));
				jObject.put("status", lkupType.getDescription());

				jArray.put(jObject);
			}

			aaJsonObject.put("aaData", jArray);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		
		return aaJsonObject.toString();
	 }
	
	
	
	@RequestMapping(value = "/retailer/OrderLinesDataByOrderId", method = RequestMethod.POST, headers="Accept=*/*",
	produces = "application/json; charset=utf-8")
	public @ResponseBody String getOrderLinesByOrderId(@RequestParam(value="orderId") Integer orderId, 
			                                           @ModelAttribute User user) throws Exception{  
		JSONObject aaJsonObject = new JSONObject();

		try {
			List<OrderLines> orderLinesList = orderLinesManager.findByOrderLinesByOrderId(orderId, user);	
			JSONArray jArray = new JSONArray();
			for (OrderLines ordLine : orderLinesList) {
				JSONObject jObject = new JSONObject();
				
				jObject.put("id", ordLine.getId());
				jObject.put("version", ordLine.getObjectVersionNumber());
				jObject.put("orderId", ordLine.getOrders().getId());
				jObject.put("productId", ordLine.getProduct().getId());
				jObject.put("category", ordLine.getProduct().getCategory().getName());
				jObject.put("productName", ordLine.getProduct().getName());
				jObject.put("quantity", ordLine.getQuantity());
				jObject.put("packaged", ordLine.getPackaged());
				jObject.put("price", ordLine.getPrice());
				jObject.put("discount", ordLine.getDiscount());
				jObject.put("total", (ordLine.getQuantity() * ordLine.getPrice()));

				jArray.put(jObject);
			}

			aaJsonObject.put("aaData", jArray);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
		
		return aaJsonObject.toString();
	}

	@RequestMapping(value = "/retailer/OrderHistoryByOrderId", method = RequestMethod.GET, headers="Accept=*/*",
			produces = "application/json; charset=utf-8")
	 public @ResponseBody String getOrderHistoryByOrderId(@RequestParam(value="orderId") Integer orderId,
			                                              @ModelAttribute User user) throws Exception{  
		JSONObject aaJsonObject = new JSONObject();

		try {
			List<Object[]> objList = orderHistoryManager.findOrderHistoryByOrderId(orderId, user);
			JSONArray jArray = new JSONArray();
			
			for (Object[] objArray : objList) {
				OrderHistory orderHistory = null;
				LookupType lkupType = null;
				
				if(objArray.length == 2){
					if(objArray[0] instanceof OrderHistory)
						orderHistory = (OrderHistory)objArray[0];
					else
						lkupType = (LookupType)objArray[0];

					if(objArray[1] instanceof OrderHistory)
						orderHistory = (OrderHistory)objArray[1];
					else
						lkupType = (LookupType)objArray[1];
				}
				
				if(orderHistory == null || lkupType == null){
					return "Error retrieving data";
				}
				
				JSONObject jObject = new JSONObject();
				jObject.put("id", orderHistory.getId());
				jObject.put("from", Utility.getUserFullName(userAddressManager, orderHistory.getCreatedBy()));
				jObject.put("comments", orderHistory.getComments());
				jObject.put("status", lkupType.getDescription());
				jObject.put("creationDate", orderHistory.getCreationDate());

				jArray.put(jObject);
			}

			aaJsonObject.put("aaData", jArray);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		
		return aaJsonObject.toString();
	 }
	
	 public void updateOrderNewStatus(Orders order, User user) throws Exception{  
		order.setIsNew(false);
		orderManager.upsert(order, user);
	 }
	 
	@RequestMapping(value = "/retailer/UpdateOrderStatus", method = RequestMethod.POST)
	 public @ResponseBody String updateOrderStatus(@RequestParam(value="orderId") Integer orderId,
			 @RequestParam(value="objectVersionNumber") Integer objectVersionNumber,
			 @RequestParam(value="status") String status,
			 @RequestParam(value="comments") String comments,
             @ModelAttribute User user) throws Exception{  
		boolean isConfirmed = false;
		
		Orders order = orderManager.getByKey(orderId, user);
		order.setObjectVersionNumber(objectVersionNumber);
		order.setComments(comments);
		order.setOrganization(order.getOrganization());
		order.setStatus(status);
		if(IConstants.ORDER_STATUS_CONFIRMED.equalsIgnoreCase(status)){
			order.setDeliveryCode(Utility.getDeliverySecurityToken());
			isConfirmed = true;
		}
		
		orderManager.upsert(order, user);
		
		OrderHistory ordHistory = new OrderHistory(); 		
		ordHistory.setComments(comments);
		ordHistory.setOrders(new Orders(orderId));
		ordHistory.setStatus(status);
		orderHistoryManager.upsert(ordHistory, user);		
		
		if(isConfirmed)
			emailMsgSender.sendMessage(order);
		
		return "redirect:/orderDetail.shx?orderId=" + orderId;
	 }
	
	@RequestMapping(value = "/retailer/UpdateOrderPriority", method = RequestMethod.POST)
	 public @ResponseBody String updateOrderPriority(@RequestParam(value="orderId") Integer orderId,
			 @RequestParam(value="priority") Integer priority,
             @ModelAttribute User user) throws Exception{  
		Orders order = orderManager.getByKey(orderId, user);
		order.setObjectVersionNumber(order.getObjectVersionNumber());
		order.setPriority(priority);
		order.setOrganization(order.getOrganization());
		
		orderManager.upsert(order, user);
		JSONObject jObject = new JSONObject();
		jObject.put("success", true);
		
		return jObject.toString();
	 }
	
	@RequestMapping(value = "/retailer/EditOrderLinesData", method = RequestMethod.POST)
	 public @ResponseBody Integer updateOrderLines(	@RequestParam(value="orderLineId") Integer orderLineId,
													 @RequestParam(value="version") Integer version,
													 @RequestParam(value="value") Integer value,
													 @ModelAttribute User user) throws Exception{  
		try {
			OrderLines ordLine = orderLinesManager.getByKey(orderLineId, user );			
			ordLine.setObjectVersionNumber(version);
			ordLine.setPackaged(value);
			orderLinesManager.upsert(ordLine, user);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
		
		return value;
	 }	
}
