package com.tresfocus.ekart.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.Roles;
import com.tresfocus.ekart.hibernate.model.RolesDAO;

@Service
public class RolesManagerImpl implements RolesManager{
	@Autowired
	private RolesDAO rolesDAO;
	 
	@Override
	@Transactional
	public List<Roles> getRoles() {
		return rolesDAO.getRoles();
	}
	
	@Override
	@Transactional
	public  Object[] getRoleByName(String name){
		return rolesDAO.getRoleByName(name);
	}
	
	@Override
	@Transactional
	public  Roles getRole(String name){
		return rolesDAO.getRole(name);
	}
}
