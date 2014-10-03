package com.tresfocus.ekart.hibernate.model;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tresfocus.ekart.Utility;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.hibernate.entity.UserRole;

@Repository
public class UserRoleDAOImpl implements UserRoleDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public UserRole upsert(UserRole usrRole, User loggedInUser) throws Exception{
        Utility.populateWhoColumns(usrRole, loggedInUser);
        return (UserRole)sessionFactory.getCurrentSession().merge(usrRole);
    }

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public UserRole save(UserRole userRole){
		sessionFactory.getCurrentSession().save(userRole);
		return userRole;
	}
}
