package com.tresfocus.ekart.spring.service;

import java.util.List;

import com.tresfocus.ekart.hibernate.entity.OrderHistory;
import com.tresfocus.ekart.hibernate.entity.User;

public interface OrderHistoryManager {
	public OrderHistory getByKey(Integer id);
	public void upsert(OrderHistory orderHistory, User loggedInUser) throws Exception;
	public void delete(OrderHistory orderHistory);
	public List<OrderHistory> findByCriteria(OrderHistory orderHistory, User loggedInUser);
	public List<Object[]> findOrderHistoryByOrderId(int orderId, User loggedInUser);
	public Object execute(String operation, Object inputObj, User loggedInUser) throws Exception;
}
