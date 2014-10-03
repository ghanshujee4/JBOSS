package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tresfocus.ekart.hibernate.entity.Cities;
import com.tresfocus.ekart.hibernate.entity.States;

@Repository
public class CitiesDAOImpl implements CitiesDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public Cities getByKey(Integer id){
		return (Cities) sessionFactory.getCurrentSession().get(Cities.class, id);		
	}

	@Override
	public List<Cities> findByCriteria(Cities cities) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Cities.class);
        Example example = Example.create(cities)
				.excludeZeroes()           //exclude zero valued properties
			    .ignoreCase()              //perform case insensitive string comparisons
			    .enableLike();             //use like for string comparisons
        criteria.add(example);
        
       if(cities.getId() != 0)
    	   criteria.add(Restrictions.eq("id", cities.getId()));
       
       return criteria.list();
    }
	
	@Override
	public List<Cities> getAllCitiesOfState(Integer stateId) {
		States state = new States(stateId);
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Cities.class)
        	.add(Restrictions.eq("states", state))
        	.setProjection(Projections.projectionList()
				.add(Projections.property("id"), "id")
				.add(Projections.property("name"), "name"))
			.addOrder(Order.asc("name"))
			.setResultTransformer(Transformers.aliasToBean(Cities.class));
       
       return criteria.list();
    }
}
