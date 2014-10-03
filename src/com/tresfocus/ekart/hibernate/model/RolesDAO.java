package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.Roles;

@Transactional
public interface RolesDAO {
	public List<Roles> getRoles();
	public Object[] getRoleByName(String name);
	Roles getRole(String name);
}
