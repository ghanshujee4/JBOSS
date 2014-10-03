package com.tresfocus.ekart.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.IConstants;
import com.tresfocus.ekart.hibernate.entity.OrderHistory;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.hibernate.model.OrderHistoryDAO;

@Service
public class OrderHistoryManagerImpl implements OrderHistoryManager {
	@Autowired
	private OrderHistoryDAO orderHistoryDAO;

	@Override
	public OrderHistory getByKey(Integer id) {
		return orderHistoryDAO.getByKey(id);
	}

	@Override
	@Transactional
	public void upsert(OrderHistory orderHistory, User loggedInUser)
			throws Exception {		
		orderHistoryDAO.upsert(orderHistory, loggedInUser);
	}

	@Override
	@Transactional
	public void delete(OrderHistory orderHistory) {
		orderHistoryDAO.delete(orderHistory);
	}

	@Override
	public List<OrderHistory> findByCriteria(OrderHistory orderHistory,
			User loggedInUser) {	
		return orderHistoryDAO.findByCriteria(orderHistory, loggedInUser);
	}

	@Override
	public List<Object[]> findOrderHistoryByOrderId(int orderId,
			User loggedInUser) {
		return orderHistoryDAO.findOrderHistoryByOrderId(orderId, loggedInUser);
	}
	
	@Override
	public Object execute(String operation, Object inputObj, User loggedInUser) throws Exception {
		if(IConstants.OPERATION_UPSERT.equalsIgnoreCase(operation)){
			upsert((OrderHistory)inputObj, loggedInUser);
			return inputObj;
		}else if(IConstants.OPERATION_FIND.equalsIgnoreCase(operation)){
			return findByCriteria((OrderHistory)inputObj, loggedInUser);
		}else if(IConstants.OPERATION_DELETE.equalsIgnoreCase(operation)){
			delete((OrderHistory)inputObj);
			return null;
		}
		
		return null;	
	}
}
