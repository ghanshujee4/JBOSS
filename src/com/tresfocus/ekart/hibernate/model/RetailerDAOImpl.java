package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tresfocus.ekart.hibernate.entity.Organization;
import com.tresfocus.ekart.hibernate.entity.Zone;

@Repository
public class RetailerDAOImpl implements RetailerDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	@Autowired
    private ZoneDAO zoneDAO;
	
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
	@Override
	public List<Organization> getCategoryRetailers(String categoryId,String zoneName) {
		List<Organization> organizations = null;
		try{
			Zone zone = zoneDAO.getZone(zoneName);
			Query query = sessionFactory.getCurrentSession().createQuery("select retailerCategory.organization from RetailerCategory retailerCategory WHERE retailerCategory.zone.id =:zone_id and retailerCategory.category.id =:category_id");
			query.setInteger("zone_id", zone.getId());
			query.setString("category_id", categoryId);
			organizations = query.list();
			
		}catch(Exception e){
			 if (sessionFactory.getCurrentSession().getTransaction() != null) sessionFactory.getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}finally{
			//sessionFactory.getCurrentSession().close();
		}
		return organizations;
	}
}
