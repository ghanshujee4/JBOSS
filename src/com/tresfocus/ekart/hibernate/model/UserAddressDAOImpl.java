package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tresfocus.ekart.Utility;
import com.tresfocus.ekart.hibernate.entity.Address;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.hibernate.entity.UserAddress;

@Repository
public class UserAddressDAOImpl implements UserAddressDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public UserAddress getByKey(Integer id){
		return (UserAddress) sessionFactory.getCurrentSession().get(UserAddress.class, id);		
	}

	@Override
	public UserAddress upsert(UserAddress userAddress, User loggedInUser) throws Exception{
        Utility.populateWhoColumns(userAddress, loggedInUser);
        return (UserAddress)sessionFactory.getCurrentSession().merge(userAddress);
    }
	
	@Override
	public void delete(UserAddress userAddress) {
        sessionFactory.getCurrentSession().delete(userAddress);
    }

	@Override
	public List<UserAddress> findByCriteria(UserAddress userAddress) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(UserAddress.class);
        Example example = Example.create(userAddress)
				.excludeZeroes()           //exclude zero valued properties
			    .ignoreCase()              //perform case insensitive string comparisons
			    .enableLike();             //use like for string comparisons
        criteria.add(example);
        
       if(userAddress.getId() != 0)
    	   criteria.add(Restrictions.eq("id", userAddress.getId()));
       
       return criteria.list();
    }

	@Override
	public Address getAddressByUserId(Integer userId) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(UserAddress.class);
		criteria.add(Restrictions.eq("user.id", userId));
		criteria.add(Restrictions.eq("primary", true));
        
         List addressList = criteria.list();
         if(addressList != null && !addressList.isEmpty())
        	 return ((UserAddress)addressList.get(0)).getAddress();
         
		return null;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	@Override
	public List<UserAddress> getUserAddressByUserId(Integer userId) {
		/*Criteria criteria = sessionFactory.getCurrentSession().createCriteria(UserAddress.class);
		criteria.setFetchMode("User", FetchMode.JOIN);
		criteria.setFetchMode("Address", FetchMode.JOIN);
		criteria.add(Restrictions.eq("user.id", userId));
		List<UserAddress> addressList = criteria.list();*/
		Query query = null;
		String hql = " from UserAddress userAddress left join fetch userAddress.user user " +
				" left join fetch userAddress.address address " +
				" left join fetch address.cities " +
				" left join fetch address.states " +
				" left join fetch address.country " +
				" where user.id=:user_id ";
		query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("user_id",userId);
		List<UserAddress> addressList = query.list();
        return addressList;
    }

	@Override
	public UserAddress save(UserAddress userAddress) {
		sessionFactory.getCurrentSession().save(userAddress);
		return userAddress;
	}
	
}
