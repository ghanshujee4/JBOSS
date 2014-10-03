package com.tresfocus.ekart.spring.service;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.IConstants;
import com.tresfocus.ekart.hibernate.entity.LookupType;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.hibernate.model.LookupTypeDAO;

@Service
public class LookupTypeManagerImpl implements LookupTypeManager {
	@Autowired
	private LookupTypeDAO lookupTypeDAO;

	@Override
	@Transactional
	public LookupType getByKey(Integer id) {		
		return lookupTypeDAO.getByKey(id);
	}

	@Override
	@Transactional
	public void upsert(LookupType lookupType, User loggedInUser)
			throws Exception {
		lookupTypeDAO.upsert(lookupType, loggedInUser);
	}

	@Override
	@Transactional
	public void delete(LookupType lookupType) {
		lookupTypeDAO.delete(lookupType);
	}

	@Override
	@Transactional
	public List<LookupType> findByCriteria(LookupType lookupType) {		
		return lookupTypeDAO.findByCriteria(lookupType, Order.asc("description"));
	}
	@Override
	@Transactional
	public List<LookupType> findByCriteria(LookupType lookupType, Order order) {		
		return lookupTypeDAO.findByCriteria(lookupType, order);
	}

	@Override
	@Transactional
	public List<LookupType> getLookupTypeByType(String type) {	
		return lookupTypeDAO.getLookupTypeByType(type);
	}

	@Override
	@Transactional
	public Map<String, String> getLookupsByType(String type) {
		return lookupTypeDAO.getLookupsByType(type);
	}

	@Override
	@Transactional
	public Object execute(String operation, Object inputObj, User loggedInUser) throws Exception {
		if(IConstants.OPERATION_UPSERT.equalsIgnoreCase(operation)){
			upsert((LookupType)inputObj, loggedInUser);
			return inputObj;
		}else if(IConstants.OPERATION_FIND.equalsIgnoreCase(operation)){
			return findByCriteria((LookupType)inputObj);
		}else if(IConstants.OPERATION_DELETE.equalsIgnoreCase(operation)){
			delete((LookupType)inputObj);
			return null;
		}
		
		return null;	
	}
}
