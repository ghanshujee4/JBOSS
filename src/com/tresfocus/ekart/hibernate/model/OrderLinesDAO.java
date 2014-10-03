package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.OrderLines;
import com.tresfocus.ekart.hibernate.entity.User;

@Transactional
public interface OrderLinesDAO {
	public OrderLines getByKey(Integer id);
	public OrderLines getByKey(Integer id, User loggedInUser);
	public OrderLines upsert(OrderLines orderLines, User loggedInUser) throws Exception;
	public void delete(OrderLines orderLines);
	public List<OrderLines> findByCriteria(OrderLines orderLines);
	public List<OrderLines> findByCriteria(OrderLines orderLines, User loggedInUser);
	public List<OrderLines> findByOrderLinesByOrderId(int orderId);
	public List<OrderLines> findByOrderLinesByOrderId(int orderId, User loggedInUser);
	public boolean save(OrderLines orderLines);
	public List<OrderLines> findOrderLinesByOrderId(int orderId);
}
