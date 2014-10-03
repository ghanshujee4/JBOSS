package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.RetailerCategory;
import com.tresfocus.ekart.hibernate.entity.User;

@Transactional
public interface RetailerCategoryDAO {
	public RetailerCategory getByKey(Integer id);
	public RetailerCategory upsert(RetailerCategory retZone, User loggedInUser) throws Exception;
	public void delete(RetailerCategory retZone);
	public List<RetailerCategory> findByCriteria(RetailerCategory retZone);
}
