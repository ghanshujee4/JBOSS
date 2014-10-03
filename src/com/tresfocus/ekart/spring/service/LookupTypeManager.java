package com.tresfocus.ekart.spring.service;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Order;

import com.tresfocus.ekart.hibernate.entity.LookupType;
import com.tresfocus.ekart.hibernate.entity.User;

public interface LookupTypeManager {
	public LookupType getByKey(Integer id);
	public void upsert(LookupType lookupType, User loggedInUser) throws Exception;
	public void delete(LookupType lookupType);
	public List<LookupType> findByCriteria(LookupType lookupType);
	public List<LookupType> findByCriteria(LookupType lookupType, Order order);
	public List<LookupType> getLookupTypeByType(String type);
	public Map<String, String> getLookupsByType(String type);
	public Object execute(String operation, Object inputObj, User loggedInUser) throws Exception;
}
