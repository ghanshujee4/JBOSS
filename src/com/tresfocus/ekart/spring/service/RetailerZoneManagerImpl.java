package com.tresfocus.ekart.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.RetailerZone;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.hibernate.model.RetailerZoneDAO;

@Service
public class RetailerZoneManagerImpl implements RetailerZoneManager{
	@Autowired
	private RetailerZoneDAO retZoneDAO;
	
	@Override
	@Transactional
	public void upsert(RetailerZone retZone, User loggedInUser) throws Exception {
		retZoneDAO.upsert(retZone, loggedInUser);
	}
}
