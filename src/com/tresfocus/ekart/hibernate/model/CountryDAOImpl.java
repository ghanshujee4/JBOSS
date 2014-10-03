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

import com.tresfocus.ekart.hibernate.entity.Country;

@Repository
public class CountryDAOImpl implements CountryDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public Country getByKey(Integer id){
		return (Country) sessionFactory.getCurrentSession().get(Country.class, id);		
	}

	@Override
	public List<Country> findByCriteria(Country country) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Country.class);
        Example example = Example.create(country)
				.excludeZeroes()           //exclude zero valued properties
			    .ignoreCase()              //perform case insensitive string comparisons
			    .enableLike();             //use like for string comparisons
        criteria.add(example);
        
       if(country.getId() != 0)
    	   criteria.add(Restrictions.eq("id", country.getId()));
       
       return criteria.list();
    }
	
	@Override
	public List<Country> getAllCountries() {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Country.class)
        .add(Restrictions.eq("status", true))
        .setProjection(Projections.projectionList()
        						.add(Projections.property("id"), "id")
        						.add(Projections.property("name"), "name"))
		.addOrder(Order.asc("name"))
        .setResultTransformer(Transformers.aliasToBean(Country.class));
        
       return criteria.list();
    }
}
