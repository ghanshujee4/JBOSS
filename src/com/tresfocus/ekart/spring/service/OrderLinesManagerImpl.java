package com.tresfocus.ekart.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.IConstants;
import com.tresfocus.ekart.hibernate.entity.OrderLines;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.hibernate.model.OrderLinesDAO;
import com.tresfocus.ekart.web.ui.beans.OrderItem;
import com.tresfocus.ekart.web.ui.beans.ProductBean;
import com.tresfocus.ekart.web.ui.beans.RetailerSnapshotBean;

@Service
public class OrderLinesManagerImpl implements OrderLinesManager {
	@Autowired
	private OrderLinesDAO orderLinesDAO;

	@Override
	@Transactional
	public OrderLines getByKey(Integer id, User loggedInUser) {	
		return orderLinesDAO.getByKey(id, loggedInUser);
	}

	@Override
	@Transactional
	public void upsert(OrderLines orderLines, User loggedInUser)
			throws Exception {
		orderLinesDAO.upsert(orderLines, loggedInUser);
	}

	@Override
	@Transactional
	public void delete(OrderLines orderLines) {
		orderLinesDAO.delete(orderLines);
	}

	@Override
	@Transactional
	public List<OrderLines> findByCriteria(OrderLines orderLines) {	
		return orderLinesDAO.findByCriteria(orderLines);
	}

	@Override
	@Transactional
	public List<OrderLines> findByCriteria(OrderLines orderLines,
			User loggedInUser) {	
		return orderLinesDAO.findByCriteria(orderLines, loggedInUser);
	}

	@Override
	@Transactional
	public List<OrderLines> findByOrderLinesByOrderId(int orderId,
			User loggedInUser) {
		return orderLinesDAO.findByOrderLinesByOrderId(orderId, loggedInUser);
	}
	
	@Override
	@Transactional
	public List<OrderLines> findByOrderLinesByOrderId(int orderId) {
		return orderLinesDAO.findByOrderLinesByOrderId(orderId);
	}
	
	@Override
	@Transactional
	public Object execute(String operation, Object inputObj, User loggedInUser) throws Exception {
		if(IConstants.OPERATION_UPSERT.equalsIgnoreCase(operation)){
			upsert((OrderLines)inputObj, loggedInUser);
			return inputObj;
		}else if(IConstants.OPERATION_FIND.equalsIgnoreCase(operation)){
			return findByCriteria((OrderLines)inputObj, loggedInUser);
		}else if(IConstants.OPERATION_DELETE.equalsIgnoreCase(operation)){
			delete((OrderLines)inputObj);
			return null;
		}
		
		return null;	
	}

	@Override
	@Transactional
	public boolean save(OrderLines orderLines) {
		return orderLinesDAO.save(orderLines);
	}
	
	@Override
	@Transactional
	public OrderLines getByKey(Integer id) {	
		return orderLinesDAO.getByKey(id);
	}

	@Override
	public List<OrderItem> findOrderLinesByOrderId(int orderId) {
		//List<OrderLinesBean> orderLinesBean = new ArrayList<OrderLinesBean>();
		List<OrderLines> orderLines = orderLinesDAO.findOrderLinesByOrderId(orderId);
		/*for(OrderLines orderLine : orderLines){
			orderLinesBean.add(new OrderLinesBean(orderLine));
		}*/
		List<OrderItem> orderItemBean = new ArrayList<OrderItem>();
		for(OrderLines orderLine : orderLines){
			ProductBean productBean = new ProductBean(orderLine.getProduct());
			RetailerSnapshotBean retailerSnapshotBean = new RetailerSnapshotBean(orderLine.getProduct().getRetailerSnapshots().iterator().next());
			orderItemBean.add(new OrderItem(productBean,orderLine.getQuantity(),retailerSnapshotBean ));
		}
		return orderItemBean;
	}
}
