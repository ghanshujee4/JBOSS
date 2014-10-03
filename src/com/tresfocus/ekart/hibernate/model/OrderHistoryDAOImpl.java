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
import com.tresfocus.ekart.hibernate.entity.OrderHistory;
import com.tresfocus.ekart.hibernate.entity.Organization;
import com.tresfocus.ekart.hibernate.entity.User;

@Repository
public class OrderHistoryDAOImpl implements OrderHistoryDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public OrderHistory getByKey(Integer id){
		return (OrderHistory) sessionFactory.getCurrentSession().get(OrderHistory.class, id);		
	}

	@Override
	public OrderHistory upsert(OrderHistory orderHistory, User loggedInUser) throws Exception{
        Utility.populateWhoColumns(orderHistory, loggedInUser);
        return (OrderHistory)sessionFactory.getCurrentSession().merge(orderHistory);
    }
	
	@Override
	public void delete(OrderHistory orderHistory) {
        sessionFactory.getCurrentSession().delete(orderHistory);
    }

	@Override
	public List<OrderHistory> findByCriteria(OrderHistory orderHistory, User loggedInUser){
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(OrderHistory.class);
        Example example = Example.create(orderHistory)
				.excludeZeroes()           //exclude zero valued properties
			    .ignoreCase()              //perform case insensitive string comparisons
			    .enableLike();             //use like for string comparisons
        criteria.add(example);
        
        orderHistory.setOrganization(new Organization(loggedInUser.getOrganization().getId()));

        if(orderHistory.getId() != 0)
    	   criteria.add(Restrictions.eq("id", orderHistory.getId()));
       
       return criteria.list();
    }
	

	@Override
	public List<Object[]> findOrderHistoryByOrderId(int orderId, User loggedInUser){
		String query = " from OrderHistory orderHistory, LookupType lkup "
			     + " where orderHistory.status = lkup.code "
			     + "      and orderHistory.orders.id = :orderId "
			     + "      and lkup.type = :type "
			     + "      and orderHistory.organization.id = :orgId"
			     + " order by orderHistory.creationDate DESC "; 

		Query queryObj = sessionFactory.getCurrentSession().createQuery(query);
		queryObj.setParameter("orderId", orderId);
		queryObj.setParameter("type", "ORDER_STATUS");
		queryObj.setParameter("orgId", loggedInUser.getOrganization().getId());
		
        return queryObj.list();
	}
}
