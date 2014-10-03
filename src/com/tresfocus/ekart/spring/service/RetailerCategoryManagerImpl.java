package com.tresfocus.ekart.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.RetailerCategory;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.hibernate.model.RetailerCategoryDAO;

@Service
public class RetailerCategoryManagerImpl implements RetailerCategoryManager{
	@Autowired
	private RetailerCategoryDAO retCategoryDAO;
	
	@Override
	@Transactional
	public void upsert(RetailerCategory retCat, User loggedInUser) throws Exception {
		retCategoryDAO.upsert(retCat, loggedInUser);
	}
}
