package com.tresfocus.ekart.spring.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.IConstants;
import com.tresfocus.ekart.Utility;
import com.tresfocus.ekart.hibernate.entity.Address;
import com.tresfocus.ekart.hibernate.entity.OrderLines;
import com.tresfocus.ekart.hibernate.entity.Orders;
import com.tresfocus.ekart.hibernate.entity.Organization;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.hibernate.model.AddressDAO;
import com.tresfocus.ekart.hibernate.model.OrderLinesDAO;
import com.tresfocus.ekart.hibernate.model.OrdersDAO;
import com.tresfocus.ekart.hibernate.model.OrganizationDAO;
import com.tresfocus.ekart.hibernate.model.ProductDAO;
import com.tresfocus.ekart.hibernate.model.UserDAO;
import com.tresfocus.ekart.web.ui.beans.OrderItem;
import com.tresfocus.ekart.web.ui.beans.OrdersBean;
import com.tresfocus.ekart.web.ui.beans.ShoppingCart;

@Service
public class OrdersManagerImpl implements OrdersManager {
	@Autowired
	private OrdersDAO ordersDAO;
	
	@Autowired
	private OrganizationDAO organizationDAO;
	
	@Autowired
	private AddressDAO addressDAO;
	
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private OrderLinesDAO orderLinesDAO;

	@Override
	@Transactional
	public Orders getByKey(Integer id) {
		return ordersDAO.getByKey(id);
	}
	
	@Override
	@Transactional
	public Orders getByKey(Integer id, User loggedInUser) {
		return ordersDAO.getByKey(id, loggedInUser);
	}

	@Override
	@Transactional
	public void upsert(Orders orders, User loggedInUser) throws Exception {
		ordersDAO.upsert(orders, loggedInUser);
	}

	@Override
	@Transactional
	public void delete(Orders orders) {
		ordersDAO.delete(orders);
	}

	@Override
	@Transactional
	public List<Orders> findByCriteria(Orders orders, User loggedInUser) {
		return ordersDAO.findByCriteria(orders, loggedInUser);
	}

	@Override
	@Transactional
	public List<Orders> getOrderByStatus(String status, User loggedInUser) {
		return ordersDAO.getOrderByStatus(status, loggedInUser);
	}
	
	@Override
	@Transactional
	public List<Object[]> findOrderHistoryByOrderId(int orderId, User loggedInUser){
		return ordersDAO.findOrderHistoryByOrderId(orderId, loggedInUser);
	}
	
	@Override
	@Transactional
	public Object execute(String operation, Object inputObj, User loggedInUser) throws Exception {
		if(IConstants.OPERATION_UPSERT.equalsIgnoreCase(operation)){
			upsert((Orders)inputObj, loggedInUser);
			return inputObj;
		}else if(IConstants.OPERATION_FIND.equalsIgnoreCase(operation)){
			return findByCriteria((Orders)inputObj, loggedInUser);
		}else if(IConstants.OPERATION_DELETE.equalsIgnoreCase(operation)){
			delete((Orders)inputObj);
			return null;
		}
		
		return null;	
	}

	@Override
	@Transactional
	public boolean saveOrder(User user, ShoppingCart shoppingCart,String delivaryDateTime,String addressId) {
		boolean status = false;
		Orders order = null;
		String orderNumber = RandomStringUtils.randomAlphanumeric(7);
		for(String retailerId : shoppingCart.getOrderItems().keySet()){
			List<OrderItem> orderItems = shoppingCart.getOrderItems().get(retailerId);
			order =  buildOrder(orderItems,user, shoppingCart,delivaryDateTime,addressId,orderNumber);
			status = ordersDAO.save(order);
			
			for(OrderItem orderItem : orderItems){
				status = orderLinesDAO.save(new OrderLines(order, productDAO.getByKey(orderItem.getProduct().getId()), order.getOrganization(), orderItem.getQuantity(), orderItem.getRetailerSnapshotBean().getMeasuringUnit().getId(), Float.valueOf(Double.toString(orderItem.getTotal())), order.getTax(), 0, order.getCreatedBy(), order.getLastUpdatedBy(), order.getCreationDate(), order.getLastUpdatedDate(), order.getObjectVersionNumber()));
				//orderLineses.add(new OrderLines(orders, productDAO.getByKey(orderItem.getProduct().getId()), organization, orderItem.getQuantity(), orderItem.getRetailerSnapshotBean().getMeasuringUnit().getId(), Float.valueOf(Double.toString(orderItem.getTotal())), tax, discount, createdBy, lastUpdatedBy, creationDate, lastUpdatedDate, objectVersionNumber));
			}
		}
		
		if(status){
			try {
				Utility.sendOrderPlacedMail(order);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return status;
	}
	
	public double getTotalPrice(List<OrderItem> orderItems){
		double totalPrice = 0.0;
		for(OrderItem orderItem : orderItems){
			totalPrice = totalPrice+orderItem.getTotal();
		}
		return totalPrice;
	}
	
	private Orders buildOrder(List<OrderItem> orderItems,User user, ShoppingCart shoppingCart,String delivaryDateTime,String addressId,String orderNumber) {
		String deliveryCode = RandomStringUtils.randomAlphanumeric(7);
		Address addressByShippingAddressId = addressDAO.getByKey(Integer.parseInt(addressId));
		Address addressByBillingAddressId = addressDAO.getByKey(Integer.parseInt(addressId));
		Organization organization = shoppingCart.getRetailer();
		String status = "ORDERED";
		float itemValue = Float.parseFloat(getTotalPrice(orderItems)+"");
		float tax = 0;
		float commission = 0;
		float discount = 0;
		String ip = "127.0.0.1";
		String comments = status;
		//String orderNumber = RandomStringUtils.randomAlphanumeric(7);
		String type = status;
		Date expectedDeliveryTime = null;
		try {
			expectedDeliveryTime = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").parse(delivaryDateTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Date creationDate = new Date();
		Date lastUpdatedDate = new Date();
		int createdBy = user.getId();
		int lastUpdatedBy = 	user.getId();
		int objectVersionNumber =0;
		Set<OrderLines> orderLineses = null;//new HashSet<OrderLines>();
		Orders orders = new Orders(user, addressByShippingAddressId, organization, addressByBillingAddressId, status, comments, itemValue, tax, commission, ip, createdBy, lastUpdatedBy, creationDate, lastUpdatedDate, objectVersionNumber, type, expectedDeliveryTime, deliveryCode, orderNumber, orderLineses,null);
		
		return orders; 
	}

	@Override
	@Transactional
	public List<OrdersBean> getCustomerOrders(Integer userId) {
		List<OrdersBean> orderBeans = new ArrayList<OrdersBean>();
		List<Orders> orders = ordersDAO.getCustomerOrders(userId);
		for(Orders order : orders){
			orderBeans.add(new OrdersBean(order));
		}
		return orderBeans;
	}
	
	@Override
	@Transactional
	public List<OrdersBean> getCustomerOrders(Integer userId,Integer organizationId){
		List<OrdersBean> orderBeans = new ArrayList<OrdersBean>();
		List<Orders> orders = ordersDAO.getCustomerOrders(userId,organizationId);
		for(Orders order : orders){
			orderBeans.add(new OrdersBean(order));
		}
		return orderBeans;
	}
}
