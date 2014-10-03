package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tresfocus.ekart.Utility;
import com.tresfocus.ekart.hibernate.entity.Address;
import com.tresfocus.ekart.hibernate.entity.User;

@Repository
public class AddressDAOImpl implements AddressDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public Address getByKey(Integer id){
		return (Address) sessionFactory.getCurrentSession().get(Address.class, id);		
	}

	@Override
	public List<Address> getAddressesByUserId(int userId) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Address.class);
		criteria.add(Restrictions.eq("user.id", userId));
       
        return criteria.list();
	}
	
	@Override
	public Address upsert(Address address, User loggedInUser) throws Exception{
        Utility.populateWhoColumns(address, loggedInUser);
        return (Address)sessionFactory.getCurrentSession().merge(address);
    }
	
	@Override
	public void delete(Address address) {
        sessionFactory.getCurrentSession().delete(address);
    }

	@Override
	public List<Address> findByCriteria(Address address) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Address.class);
        Example example = Example.create(address)
				.excludeZeroes()           //exclude zero valued properties
			    .ignoreCase()              //perform case insensitive string comparisons
			    .enableLike();             //use like for string comparisons
        criteria.add(example);
        
       if(address.getId() != 0)
    	   criteria.add(Restrictions.eq("id", address.getId()));
       
       return criteria.list();
    }

	@Override
	public Address save(Address address) {
		sessionFactory.getCurrentSession().save(address);
		return address;
	}
}
