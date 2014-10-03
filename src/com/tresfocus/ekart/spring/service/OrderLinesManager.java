package com.tresfocus.ekart.spring.service;

import java.util.List;

import com.tresfocus.ekart.hibernate.entity.OrderLines;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.web.ui.beans.OrderItem;

public interface OrderLinesManager {
	public OrderLines getByKey(Integer id, User loggedInUser);
	public void upsert(OrderLines orderLines, User loggedInUser) throws Exception;
	public void delete(OrderLines orderLines);
	public List<OrderLines> findByCriteria(OrderLines orderLines);
	public List<OrderLines> findByCriteria(OrderLines orderLines, User loggedInUser);
	public List<OrderLines> findByOrderLinesByOrderId(int orderId);
	public List<OrderLines> findByOrderLinesByOrderId(int orderId, User loggedInUser);
	public Object execute(String operation, Object inputObj, User loggedInUser) throws Exception;
	public boolean save(OrderLines orderLines);
	public OrderLines getByKey(Integer id);
	public List<OrderItem> findOrderLinesByOrderId(int orderId);
}
