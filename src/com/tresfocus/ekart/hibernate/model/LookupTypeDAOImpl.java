package com.tresfocus.ekart.hibernate.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tresfocus.ekart.Utility;
import com.tresfocus.ekart.hibernate.entity.LookupType;
import com.tresfocus.ekart.hibernate.entity.OrderLines;
import com.tresfocus.ekart.hibernate.entity.User;

@Repository
public class LookupTypeDAOImpl implements LookupTypeDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public LookupType getByKey(Integer id){
		return (LookupType) sessionFactory.getCurrentSession().get(LookupType.class, id);		
	}

	@Override
	public LookupType upsert(LookupType lookupType, User loggedInUser) throws Exception{
        Utility.populateWhoColumns(lookupType, loggedInUser);
        return (LookupType)sessionFactory.getCurrentSession().merge(lookupType);
    }
	
	@Override
	public void delete(LookupType lookupType) {
        sessionFactory.getCurrentSession().delete(lookupType);
    }

	@Override
	public List<LookupType> findByCriteria(LookupType lookupType, Order order) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(LookupType.class);
        Example example = Example.create(lookupType)
				.excludeZeroes()           //exclude zero valued properties
			    .ignoreCase()              //perform case insensitive string comparisons
			    .enableLike();             //use like for string comparisons
        criteria.add(example);
        
       if(lookupType.getId() != 0)
    	   criteria.add(Restrictions.eq("id", lookupType.getId()));
       
       if(order != null)
       	criteria.addOrder(order);

       return (List<LookupType>)criteria.list();
    }
	
	@Override
	public List<LookupType> getLookupTypeByType(String type){
		LookupType lkupType = new LookupType();
		lkupType.setType(type);
		
		return findByCriteria(lkupType, Order.asc("code"));		
	}	
	
	@Override
	public Map<String, String> getLookupsByType(String type){
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(LookupType.class);
		criteria.add(Restrictions.eq("type", type));
		criteria.addOrder(Order.desc("creationDate"));
		
		List<LookupType> lkupTypes =  criteria.list();
		
		if(lkupTypes != null){
			Map<String, String> lkupValues = new HashMap<String, String>();
			
			for(LookupType lkupTypeObj : lkupTypes){
				lkupValues.put(lkupTypeObj.getCode(), lkupTypeObj.getDescription());
			}
			return lkupValues;
		}    
		
		return null;
	}
//        Query queryObj = sessionFactory.getCurrentSession().getNamedQuery("findByTypeOrderByCodeAsc")
//											.setString("type", type);
//		
//		List<LookupType> lkupTypes =  queryObj.list();
//		if(lkupTypes != null){
//			Map<String, String> lkupValues = new HashMap<String, String>();
//			for(LookupType lkupTypeObj : lkupTypes){
//				lkupValues.put(lkupTypeObj.getCode(), lkupTypeObj.getDescription());
//			}
//			return lkupValues;
//		}
//		

}
