package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tresfocus.ekart.Utility;
import com.tresfocus.ekart.hibernate.entity.Organization;
import com.tresfocus.ekart.hibernate.entity.User;

@Repository
public class OrganizationDAOImpl implements OrganizationDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public Organization getByKey(Integer id){
		return (Organization) sessionFactory.getCurrentSession().get(Organization.class, id);		
	}

	@Override
	public Organization upsert(Organization organization, User loggedInUser) throws Exception{
        Utility.populateWhoColumns(organization, loggedInUser);
        return (Organization)sessionFactory.getCurrentSession().merge(organization);
    }
	
	@Override
	public void delete(Organization Organization) {
        sessionFactory.getCurrentSession().delete(Organization);
    }

	@Override
	public List<Organization> findByCriteria(Organization organization) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Organization.class);
        Example example = Example.create(organization)
				.excludeZeroes()           //exclude zero valued properties
			    .ignoreCase()              //perform case insensitive string comparisons
			    .enableLike();             //use like for string comparisons
        criteria.add(example);
        
       if(organization.getId() != 0)
    	   criteria.add(Restrictions.eq("id", organization.getId()));
       
       return criteria.list();
    }

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Organization getByName(String name) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Organization.class);
        criteria.add(Restrictions.eq("name", name));
       return (Organization) criteria.list().get(0);
    }
	@Override
	public Organization getById(Integer id) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Organization.class);
        criteria.add(Restrictions.eq("id", id));
       return (Organization) criteria.list().get(0);
    }

	@Override
	public Organization save(Organization organization) {
		sessionFactory.getCurrentSession().save(organization);
		return organization;
	}
}
