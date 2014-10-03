package com.tresfocus.ekart.hibernate.model;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Order;
import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.LookupType;
import com.tresfocus.ekart.hibernate.entity.User;

@Transactional
public interface LookupTypeDAO {
	public LookupType getByKey(Integer id);
	public LookupType upsert(LookupType lookupType, User loggedInUser) throws Exception;
	public void delete(LookupType lookupType);
	public List<LookupType> findByCriteria(LookupType lookupType, Order order);
	public List<LookupType> getLookupTypeByType(String type);
	public Map<String, String> getLookupsByType(String type);
}
