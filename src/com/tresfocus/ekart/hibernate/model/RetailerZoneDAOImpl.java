package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tresfocus.ekart.Utility;
import com.tresfocus.ekart.hibernate.entity.RetailerZone;
import com.tresfocus.ekart.hibernate.entity.User;

@Repository
public class RetailerZoneDAOImpl implements RetailerZoneDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public RetailerZone getByKey(Integer id){
		return (RetailerZone) sessionFactory.getCurrentSession().get(RetailerZone.class, id);		
	}

	@Override
	public RetailerZone upsert(RetailerZone rZone, User loggedInUser) throws Exception{
        Utility.populateWhoColumns(rZone, loggedInUser);
        return (RetailerZone)sessionFactory.getCurrentSession().merge(rZone);
    }
	
	@Override
	public void delete(RetailerZone rZone) {
        sessionFactory.getCurrentSession().delete(rZone);
    }

	@Override
	public List<RetailerZone> findByCriteria(RetailerZone rZone) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(RetailerZone.class);
        Example example = Example.create(rZone)
				.excludeZeroes()           //exclude zero valued properties
			    .ignoreCase()              //perform case insensitive string comparisons
			    .enableLike();             //use like for string comparisons
        criteria.add(example);
        
       if(rZone.getId() != 0)
    	   criteria.add(Restrictions.eq("id", rZone.getId()));
       
       return criteria.list();
    }

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
