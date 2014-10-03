package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tresfocus.ekart.Utility;
import com.tresfocus.ekart.hibernate.entity.RetailerCategory;
import com.tresfocus.ekart.hibernate.entity.User;

@Repository
public class RetailerCategoryDAOImpl implements RetailerCategoryDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public RetailerCategory getByKey(Integer id){
		return (RetailerCategory) sessionFactory.getCurrentSession().get(RetailerCategory.class, id);		
	}

	@Override
	public RetailerCategory upsert(RetailerCategory rCategory, User loggedInUser) throws Exception{
        Utility.populateWhoColumns(rCategory, loggedInUser);
        return (RetailerCategory)sessionFactory.getCurrentSession().merge(rCategory);
    }
	
	@Override
	public void delete(RetailerCategory rCategory) {
        sessionFactory.getCurrentSession().delete(rCategory);
    }

	@Override
	public List<RetailerCategory> findByCriteria(RetailerCategory rCategory) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(RetailerCategory.class);
        Example example = Example.create(rCategory)
				.excludeZeroes()           //exclude zero valued properties
			    .ignoreCase()              //perform case insensitive string comparisons
			    .enableLike();             //use like for string comparisons
        criteria.add(example);
        
       if(rCategory.getId() != 0)
    	   criteria.add(Restrictions.eq("id", rCategory.getId()));
       
       return criteria.list();
    }

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
}
