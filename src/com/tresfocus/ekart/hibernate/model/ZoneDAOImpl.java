package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tresfocus.ekart.hibernate.entity.Cities;
import com.tresfocus.ekart.hibernate.entity.Zone;

@Repository
public class ZoneDAOImpl implements ZoneDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public Zone getByKey(Integer id){
		return (Zone) sessionFactory.getCurrentSession().get(Zone.class, id);		
	}
	
	@Override
	public List<Zone> getZones(){
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Zone.class)
		.addOrder(Order.desc("name"));
		
		return criteria.list(); 		
	}
	
	@Override
	public List<Zone> getZonesByCity(Integer cityId){
		Cities city = new Cities(cityId);
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Zone.class)
		.addOrder(Order.asc("name"))
    	.setProjection(Projections.projectionList()
			.add(Projections.property("id"), "id")
			.add(Projections.property("name"), "name"))
		.add(Restrictions.eq("cities", city));
		
		return criteria.list(); 		
	}
	
	public Zone getZone(String name){
		Query query = sessionFactory.getCurrentSession().createQuery("from Zone zone WHERE zone.name =:zone_name");
		query.setParameter("zone_name",name);
		Zone zone = (Zone) query.list().get(0);
		return zone;
	}
	
}
