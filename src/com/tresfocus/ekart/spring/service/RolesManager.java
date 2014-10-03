package com.tresfocus.ekart.spring.service;

import java.util.List;

import com.tresfocus.ekart.hibernate.entity.Roles;


public interface RolesManager {
	public List<Roles> getRoles();
	public Object[] getRoleByName(String name);
	public Roles getRole(String name);
}
