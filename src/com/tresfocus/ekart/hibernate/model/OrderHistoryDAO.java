package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.OrderHistory;
import com.tresfocus.ekart.hibernate.entity.User;

@Transactional
public interface OrderHistoryDAO {
	public OrderHistory getByKey(Integer id);
	public OrderHistory upsert(OrderHistory orderHistory, User loggedInUser) throws Exception;
	public void delete(OrderHistory orderHistory);
	public List<OrderHistory> findByCriteria(OrderHistory orderHistory, User loggedInUser);
	public List<Object[]> findOrderHistoryByOrderId(int orderId, User loggedInUser);
}
