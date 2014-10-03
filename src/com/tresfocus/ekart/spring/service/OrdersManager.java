package com.tresfocus.ekart.spring.service;

import java.util.List;

import com.tresfocus.ekart.hibernate.entity.Orders;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.web.ui.beans.OrdersBean;
import com.tresfocus.ekart.web.ui.beans.ShoppingCart;

public interface OrdersManager {
	public Orders getByKey(Integer id);
	public Orders getByKey(Integer id, User loggedInUser);
	public void upsert(Orders orders, User loggedInUser) throws Exception;
	public void delete(Orders orders);
	public List<Orders> findByCriteria(Orders orders, User loggedInUser);
	public List<Orders> getOrderByStatus(String status, User loggedInUser);
	public Object execute(String operation, Object inputObj, User loggedInUser) throws Exception;
	public List<Object[]> findOrderHistoryByOrderId(int orderId, User loggedInUser);
	public boolean saveOrder(User user,ShoppingCart shoppingCart,String delivaryDateTime, String addressId);
	public List<OrdersBean> getCustomerOrders(Integer loggedInUser);
	public List<OrdersBean> getCustomerOrders(Integer userId,Integer organizationId);
}
