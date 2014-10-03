package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tresfocus.ekart.Utility;
import com.tresfocus.ekart.hibernate.entity.MeasuringUnit;
import com.tresfocus.ekart.hibernate.entity.User;

@Repository
public class MeasuringUnitDAOImpl implements MeasuringUnitDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public MeasuringUnit getByKey(Integer id){
		return (MeasuringUnit) sessionFactory.getCurrentSession().get(MeasuringUnit.class, id);		
	}

	@Override
	public MeasuringUnit upsert(MeasuringUnit MeasuringUnit, User loggedInUser) throws Exception{
        Utility.populateWhoColumns(MeasuringUnit, loggedInUser);
        return (MeasuringUnit)sessionFactory.getCurrentSession().merge(MeasuringUnit);
    }
	
	@Override
	public void delete(MeasuringUnit MeasuringUnit) {
        sessionFactory.getCurrentSession().delete(MeasuringUnit);
    }

	@Override
	public List<MeasuringUnit> findByCriteria(MeasuringUnit measuringUnit) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(MeasuringUnit.class);
        Example example = Example.create(measuringUnit)
				.excludeZeroes()           //exclude zero valued properties
			    .ignoreCase()              //perform case insensitive string comparisons
			    .enableLike();             //use like for string comparisons
        criteria.add(example);
        
       if(measuringUnit.getId() != 0)
    	   criteria.add(Restrictions.eq("id", measuringUnit.getId()));
       
       return criteria.list();
    }

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
