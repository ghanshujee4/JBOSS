package com.tresfocus.ekart.web.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import com.tresfocus.ekart.IConstants;
import com.tresfocus.ekart.Utility;
import com.tresfocus.ekart.hibernate.entity.LookupType;
import com.tresfocus.ekart.hibernate.entity.OrderHistory;
import com.tresfocus.ekart.hibernate.entity.Orders;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.spring.service.OrderHistoryManager;
import com.tresfocus.ekart.spring.service.OrderHistoryManagerImpl;
import com.tresfocus.ekart.spring.service.OrdersManager;
import com.tresfocus.ekart.spring.service.OrdersManagerImpl;

/**
 * Servlet implementation class OrderHistoryDataServlet
 */
@WebServlet("/retailer/OrderHistoryDataServlet")
public class OrderHistoryDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderHistoryDataServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Integer action = Utility.getParameterValue(request, "action", Integer.class);
		Integer orderId = Utility.getParameterValue(request, "orderId", Integer.class);
		Integer version = Utility.getParameterValue(request, "version", Integer.class);
		String status = Utility.getParameterValue(request, "status", String.class);
		String comment = Utility.getParameterValue(request, "comment", String.class);
		
		switch(action){
			case 1: 
				try{
					updateStatus(request.getSession(), orderId, version, status);
					createOrderHistory(request.getSession(), orderId, comment, status);
				}catch(Exception e){
					throw new ServletException(e);
				}
				break;

			default: printOrderHistoryData(request.getSession(), response, orderId);break;		
		}
		response.flushBuffer();
	}

	private void createOrderHistory(HttpSession session, Integer orderId, String comment, String status) throws Exception {
		OrderHistoryManager ordHistoryMgr = new OrderHistoryManagerImpl();
		User loggedInUser = Utility.getUserFromSession(session);
		OrderHistory ordHistory = new OrderHistory();
		
		ordHistory.setComments(comment);
		ordHistory.setOrders(new Orders(orderId));
		ordHistory.setStatus(status);
		ordHistoryMgr.upsert(ordHistory, loggedInUser);
	}

	private void updateStatus(HttpSession session, int orderId, int version, String status) throws Exception {
		OrdersManager ordCtrl = new OrdersManagerImpl();
		User loggedInUser = Utility.getUserFromSession(session);
		
		Orders order = ordCtrl.getByKey(orderId);
		if(version == order.getObjectVersionNumber())
			throw new Exception("Record has beend updated. Please refresh the page.");
		
		order.setStatus(status);
		boolean isConfirmed = false;
		
		if(IConstants.ORDER_STATUS_CONFIRMED.equalsIgnoreCase(status)){
			order.setDeliveryCode(Utility.getDeliverySecurityToken());
			isConfirmed = true;
		}
		ordCtrl.upsert(order, loggedInUser);
		
		if(isConfirmed)
			Utility.sendDeliveryTokenToCustomer(order);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void printOrderHistoryData(HttpSession session, HttpServletResponse response, int orderId) throws IOException, ServletException{
		JSONObject aaJsonObject = new JSONObject();

		OrderHistoryManager ordHistoryMgr = new OrderHistoryManagerImpl();
		User loggedInUser = Utility.getUserFromSession(session);
			
		try {
			List<Object[]> objList = ordHistoryMgr.findOrderHistoryByOrderId(orderId, loggedInUser);
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
					response.getOutputStream().print("Error retrieving data");
					return;
				}
				
				JSONObject jObject = new JSONObject();
				jObject.put("id", orderHistory.getId());
				jObject.put("comments", orderHistory.getComments());
				jObject.put("status", lkupType.getDescription());
				jObject.put("from", Utility.getUserFullName(null, orderHistory.getCreatedBy()));
				jObject.put("creationDate", orderHistory.getCreationDate());

				jArray.put(jObject);
			}

			response.setContentType("application/json");
			aaJsonObject.put("aaData", jArray);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
		
		response.getOutputStream().print(aaJsonObject.toString());
	}

}
