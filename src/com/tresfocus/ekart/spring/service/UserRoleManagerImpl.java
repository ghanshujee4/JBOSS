package com.tresfocus.ekart.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.UserRole;
import com.tresfocus.ekart.hibernate.model.UserRoleDAO;

@Service
public class UserRoleManagerImpl implements UserRoleManager {
	@Autowired
	private UserRoleDAO userRoleDAO;
	

	@Override
	@Transactional
	public UserRole save(UserRole userRole) {
		return userRoleDAO.save(userRole);
	}
}
