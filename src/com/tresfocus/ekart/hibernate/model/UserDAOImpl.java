package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tresfocus.ekart.IConstants;
import com.tresfocus.ekart.Utility;
import com.tresfocus.ekart.hibernate.entity.Orders;
import com.tresfocus.ekart.hibernate.entity.User;

@Repository
public class UserDAOImpl implements UserDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public User getByKey(Integer id){
		return (User) sessionFactory.getCurrentSession().get(User.class, id);		
	}

	@Override
	public User upsert(User user, User loggedInUser) throws Exception{
        Utility.populateWhoColumns(user, loggedInUser);
        return (User)sessionFactory.getCurrentSession().merge(user);
    }
	
	@Override
	public void delete(User User) {
        sessionFactory.getCurrentSession().delete(User);
    }

	@Override
	public List<User> findByCriteria(User user) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
        Example example = Example.create(user)
				.excludeZeroes()           //exclude zero valued properties
			    .ignoreCase()              //perform case insensitive string comparisons
			    .enableLike();             //use like for string comparisons
        criteria.add(example);
        
       if(user.getId() != 0)
    	   criteria.add(Restrictions.eq("id", user.getId()));
       
       return criteria.list();
    }
	
	@Override
	public User getUserByUserName(String userName) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
		criteria.add(Restrictions.eq("username", userName));
        
		List userList = criteria.list();
		if(userList != null && !userList.isEmpty())
			return (User) userList.get(0);

		
		return null; 
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public List<User> getRetailers(){
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
		criteria.add(Restrictions.eq("organization.orgType", IConstants.RETAILER));
		
		return criteria.list(); 		
	}
	
	public List<User> getRetailers(int customerId){
		Query queryObj = sessionFactory.getCurrentSession().getNamedQuery("findAllMyRetailers")
				.setInteger("customerId", customerId);
		
     	return queryObj.list();
	}

	@Override
	public User getCustomer(int customerId) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class);
		criteria.add(Restrictions.eq("organization.orgType", IConstants.CUSTOMER));
		
		List userList = criteria.list();
		if(userList != null && !userList.isEmpty())
			return (User) userList.get(0);

		
		return null; 	
	}

	@Override
	public User save(User user) {
		sessionFactory.getCurrentSession().save(user);
		return user;
	}
}
