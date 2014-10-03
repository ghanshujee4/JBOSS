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
import com.tresfocus.ekart.hibernate.entity.RetailerSnapshot;
import com.tresfocus.ekart.hibernate.entity.User;

@Repository
public class RetailerSnapshotDAOImpl implements RetailerSnapshotDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public RetailerSnapshot getByKey(Integer id){
		return (RetailerSnapshot) sessionFactory.getCurrentSession().get(RetailerSnapshot.class, id);		
	}

	@Override
	public RetailerSnapshot upsert(RetailerSnapshot RetailerSnapshot, User loggedInUser) throws Exception{
        Utility.populateWhoColumns(RetailerSnapshot, loggedInUser);
        return (RetailerSnapshot)sessionFactory.getCurrentSession().merge(RetailerSnapshot);
    }
	
	@Override
	public void upsert(RetailerSnapshot snapshot, User loggedInUser, Organization owningOrg) throws Exception {
        Utility.populateWhoColumns(snapshot, loggedInUser);
        snapshot.setOrganization(owningOrg);
        sessionFactory.getCurrentSession().merge(snapshot);
	}
	
	@Override
	public void delete(RetailerSnapshot RetailerSnapshot) {
        sessionFactory.getCurrentSession().delete(RetailerSnapshot);
    }

	@Override
	public List<RetailerSnapshot> findByCriteria(RetailerSnapshot retailerSnapshot, User loggedInUser) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(RetailerSnapshot.class);
        Example example = Example.create(retailerSnapshot)
				.excludeZeroes()           //exclude zero valued properties
			    .ignoreCase()              //perform case insensitive string comparisons
			    .enableLike();             //use like for string comparisons
        criteria.add(example);
        
        retailerSnapshot.getOrganization().setId(loggedInUser.getOrganization().getId());
        if(retailerSnapshot.getId() != 0)
    	   criteria.add(Restrictions.eq("id", retailerSnapshot.getId()));
       
        return criteria.list();
    }

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<RetailerSnapshot> findByCriteria(Integer orgaId,
			Integer categoryName) {
		List<RetailerSnapshot> rs = null;
		//Criteria criteria = sessionFactory.getCurrentSession().createCriteria(RetailerSnapshot.class);
		//criteria.add(Restrictions.eq("organization.id", orgaId));
		//criteria.add(Restrictions.eq("product.category.id", categoryName));
		try{
			//sessionFactory.getCurrentSession().getTransaction().begin();
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(RetailerSnapshot.class, "retailerSnapshot");
			criteria.createAlias("retailerSnapshot.product", "product"); // inner join by default
			criteria.createAlias("product.category", "category");
			criteria.add(Restrictions.eq("category.id", categoryName));
			rs =  criteria.list();
			//sessionFactory.getCurrentSession().getTransaction().commit();
		}catch(Exception e){
			 if (sessionFactory.getCurrentSession().getTransaction() != null) sessionFactory.getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}finally{
			//sessionFactory.getCurrentSession().close();
		}
		return rs;
	}
}
