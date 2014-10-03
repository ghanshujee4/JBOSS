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
import com.tresfocus.ekart.hibernate.entity.Country;
import com.tresfocus.ekart.hibernate.entity.States;

@Repository
public class StatesDAOImpl implements StatesDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public States getByKey(Integer id){
		return (States) sessionFactory.getCurrentSession().get(States.class, id);		
	}

	@Override
	public List<States> findByCriteria(States states) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(States.class);
        Example example = Example.create(states)
				.excludeZeroes()           //exclude zero valued properties
			    .ignoreCase()              //perform case insensitive string comparisons
			    .enableLike();             //use like for string comparisons
        criteria.add(example);
        
       if(states.getId() != 0)
    	   criteria.add(Restrictions.eq("id", states.getId()));
       
       return criteria.list();
    }
	
	@Override
	public List<States> getAllStatesOfCountry(Integer countryId) {
		Country country = new Country(countryId);
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(States.class)
        	.add(Restrictions.eq("country", country))
        	.setProjection(Projections.projectionList()
				.add(Projections.property("id"), "id")
				.add(Projections.property("name"), "name"))
			.addOrder(Order.asc("name"))
			.setResultTransformer(Transformers.aliasToBean(States.class));
      
       return criteria.list();
    }
}
