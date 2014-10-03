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
import com.tresfocus.ekart.hibernate.entity.OrderLines;
import com.tresfocus.ekart.hibernate.entity.Organization;
import com.tresfocus.ekart.hibernate.entity.User;

@Repository
public class OrderLinesDAOImpl implements OrderLinesDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public OrderLines getByKey(Integer id){
		return (OrderLines) sessionFactory.getCurrentSession().get(OrderLines.class, id);		
	}
	
	@Override
	public OrderLines getByKey(Integer id, User loggedInUser){
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(OrderLines.class);
		criteria.add(Restrictions.eq("id", id));
		criteria.add(Restrictions.eq("organization.id", loggedInUser.getOrganization().getId()));
        
		if(criteria.list() != null && !criteria.list().isEmpty())
			return (OrderLines) criteria.list().get(0);
		
		return null;
	}

	@Override
	public OrderLines upsert(OrderLines orderLines, User loggedInUser) throws Exception{
        Utility.populateWhoColumns(orderLines, loggedInUser);
        return (OrderLines)sessionFactory.getCurrentSession().merge(orderLines);
    }
	
	@Override
	public void delete(OrderLines orderLines) {
        sessionFactory.getCurrentSession().delete(orderLines);
    }

	@Override
	public List<OrderLines> findByCriteria(OrderLines orderLines) {
       return findByCriteria(orderLines, null);
    }
	
	@Override
	public List<OrderLines> findByCriteria(OrderLines orderLines, User loggedInUser) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(OrderLines.class);
        Example example = Example.create(orderLines)
				.excludeZeroes()           //exclude zero valued properties
			    .ignoreCase()              //perform case insensitive string comparisons
			    .enableLike();             //use like for string comparisons
        criteria.add(example);
       
        if(loggedInUser != null)
        	orderLines.setOrganization(new Organization(loggedInUser.getOrganization().getId()));
        
        if(orderLines.getId() != 0)
    	   criteria.add(Restrictions.eq("id", orderLines.getId()));
       
        return criteria.list();
    }
	
	@Override
	public List<OrderLines> findByOrderLinesByOrderId(int orderId){
        return findByOrderLinesByOrderId(orderId, null);
	}
	
	@Override
	public List<OrderLines> findByOrderLinesByOrderId(int orderId, User loggedInUser){
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(OrderLines.class);
		criteria.add(Restrictions.eq("orders.id", orderId));
		criteria.add(Restrictions.eq("organization.id", loggedInUser.getOrganization().getId()));
       
        return criteria.list();
	}

	@Override
	public boolean save(OrderLines orderLines) {
		try{
			sessionFactory.getCurrentSession().persist(orderLines);
		}catch(Exception e){
			return false;
		}
		return true;
	}
	
	@Override
	public List<OrderLines> findOrderLinesByOrderId(int orderId){
		Query query;
		String hql = " from OrderLines orderLines left join fetch orderLines.orders left join fetch orderLines.product product left join fetch product.category left join fetch product.retailerSnapshots retailerSnapshot left join fetch retailerSnapshot.measuringUnit left join fetch orderLines.organization where orderLines.orders.id=:order_id";
		query = sessionFactory.getCurrentSession().createQuery(hql.toString());
		
		query.setParameter("order_id",orderId);
		return  query.list();
	}
}
