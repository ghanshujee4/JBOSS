package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.Orders;
import com.tresfocus.ekart.hibernate.entity.User;

@Transactional
public interface OrdersDAO {
	public Orders getByKey(Integer id);
	public Orders getByKey(Integer id, User loggedInUser);
	public Orders upsert(Orders orders, User loggedInUser) throws Exception;
	public void delete(Orders orders);
	public List<Orders> findByCriteria(Orders orders, User loggedInUser);
	public List<Orders> getOrderByStatus(String status, User loggedInUser);
	public List<Object[]> findOrderHistoryByOrderId(int orderId, User loggedInUser);
	public boolean save(Orders orders);
	public List<Orders> getCustomerOrders(Integer userId);
	public List<Orders> getCustomerOrders(Integer userId,Integer organizationId);
}
