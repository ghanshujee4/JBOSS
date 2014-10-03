package com.tresfocus.ekart.hibernate.model;

import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.hibernate.entity.UserRole;

@Transactional
public interface UserRoleDAO {
	public UserRole upsert(UserRole usrRole, User loggedInUser) throws Exception;
	public UserRole save(UserRole userRole);
}
