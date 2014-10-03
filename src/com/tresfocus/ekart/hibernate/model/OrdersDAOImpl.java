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
import com.tresfocus.ekart.hibernate.entity.OrderLines;
import com.tresfocus.ekart.hibernate.entity.Orders;
import com.tresfocus.ekart.hibernate.entity.Organization;
import com.tresfocus.ekart.hibernate.entity.User;

@Repository
public class OrdersDAOImpl implements OrdersDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public Orders getByKey(Integer id){
		return (Orders) sessionFactory.getCurrentSession().get(Orders.class, id);
	}
	
	@Override
	public Orders getByKey(Integer id, User loggedInUser){
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Orders.class);
		criteria.add(Restrictions.eq("id", id));
		criteria.add(Restrictions.eq("organization.id", loggedInUser.getOrganization().getId()));
        
		List orderList = criteria.list();
		if(orderList != null && !orderList.isEmpty())
			return (Orders) orderList.get(0);
		
		return null;
	}

	@Override
	public Orders upsert(Orders orders, User loggedInUser) throws Exception{
        Utility.populateWhoColumns(orders, loggedInUser);
        return (Orders)sessionFactory.getCurrentSession().merge(orders);
    }
	
	@Override
	public void delete(Orders orders) {
        sessionFactory.getCurrentSession().delete(orders);
    }

	@Override
	public List<Orders> findByCriteria(Orders orders, User loggedInUser) {	
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(OrderLines.class);
        Example example = Example.create(orders)
				.excludeZeroes()           //exclude zero valued properties
			    .ignoreCase()              //perform case insensitive string comparisons
			    .enableLike();             //use like for string comparisons
        criteria.add(example);
       
        if(loggedInUser != null)
        	orders.setOrganization(new Organization(loggedInUser.getOrganization().getId()));
        
        if(orders.getId() != 0)
    	   criteria.add(Restrictions.eq("id", orders.getId()));
       
        return criteria.list();    }
	
	@Override
	public List<Orders> getOrderByStatus(String status, User loggedInUser){
		String query = "findOrdersByStatus";
		if(status.equalsIgnoreCase(IConstants.ALL))
			query = "findAllOrders";
		
		Query queryObj = sessionFactory.getCurrentSession().getNamedQuery(query)
				.setString("type", IConstants.LOOKUP_TYPE_ORDER_STATUS)
				.setInteger("orgId", loggedInUser.getOrganization().getId());
		
		if(!status.equalsIgnoreCase(IConstants.ALL))
			queryObj.setString("status", status);

     	return queryObj.list();
	}

	@Override
	public List<Object[]> findOrderHistoryByOrderId(int orderId, User loggedInUser){
		String query = " from OrderHistory order, LookupType lkup "
			     + " where order.status = lkup.code "
			     + "      and order.orders.id = :orderId "
			     + "      and lkup.type = :type "
			     + "      and order.organization.id = :orgId "
			     + " order by order.creationDate DESC ";
		
		Query queryObj = sessionFactory.getCurrentSession().createQuery(query);
		queryObj.setParameter("orderId", orderId);
		queryObj.setParameter("type", "ORDER_STATUS");
		queryObj.setParameter("orgId", loggedInUser.getOrganization().getId());
		
        return queryObj.list();
	}

	@Override
	public List<Orders> getCustomerOrders(Integer userId){
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Orders.class);
		criteria.add(Restrictions.eq("user.id", userId));
     	return criteria.list();
	}

	
	@Override
	public List<Orders> getCustomerOrders(Integer userId,Integer organizationId){
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Orders.class);
		criteria.add(Restrictions.eq("user.id", userId));
		criteria.add(Restrictions.eq("organization.id", organizationId));
     	return criteria.list();
	}

	
	@Override
	public boolean save(Orders orders) {
		try{
			sessionFactory.getCurrentSession().persist(orders);
		}catch(Exception e){
			return false;
		}
		return true;
	}
}
