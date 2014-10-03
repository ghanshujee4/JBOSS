package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tresfocus.ekart.hibernate.entity.Roles;

@Repository
public class RolesDAOImpl implements RolesDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public List<Roles> getRoles(){
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Roles.class)
		.addOrder(Order.desc("name"));
		
		return criteria.list(); 		
	}
	@Override
	public Roles getRole(String name){
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Roles.class)
				.add(Restrictions.eq("name", name));
		
		return (Roles) criteria.list().get(0); 		
	}
	
	@Override
	public Object[] getRoleByName(String name){
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Roles.class)
		.addOrder(Order.asc("name"))
    	.setProjection(Projections.projectionList()
			.add(Projections.property("id"), "id")
			.add(Projections.property("name"), "name"))
		.add(Restrictions.eq("name", name));
		
		if(criteria.list() != null && !criteria.list().isEmpty())
			return (Object[])criteria.list().get(0);
		
		return null;
	}
}
