package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tresfocus.ekart.Utility;
import com.tresfocus.ekart.hibernate.entity.Brands;
import com.tresfocus.ekart.hibernate.entity.User;

@Repository
public class BrandsDAOImpl implements BrandsDAO{

	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public Brands getByKey(Integer id){
		return (Brands) sessionFactory.getCurrentSession().get(Brands.class, id);		
	}

	@Override
	public Brands upsert(Brands category, User loggedInUser) throws Exception{
        Utility.populateWhoColumns(category, loggedInUser);
        return (Brands)sessionFactory.getCurrentSession().merge(category);
    }
	
	@Override
	public void delete(Brands Brands) {
        sessionFactory.getCurrentSession().delete(Brands);
    }

	@Override
	public List<Brands> findByCriteria(Brands category) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Brands.class);
        Example example = Example.create(category)
				.excludeZeroes()           //exclude zero valued properties
			    .ignoreCase()              //perform case insensitive string comparisons
			    .enableLike();             //use like for string comparisons
        criteria.add(example);
        
       if(category.getId() != 0)
    	   criteria.add(Restrictions.eq("id", category.getId()));
       
       return criteria.list();
    }
	
	@Override
	public List<Brands> getAllCategories() {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Brands.class)
		.setProjection(Projections.projectionList()
				.add(Projections.property("id"), "id")
				.add(Projections.property("name"), "name"))
       .addOrder(Order.asc("name"));
              
       return criteria.list();
    }

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Brands getCategory(String name) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Brands category WHERE category.name =:category_name");
		query.setParameter("category_name",name);
		Brands category = (Brands) query.list().get(0);
		return category;
	}
	
	@Override
	public Brands getCategoryByType(String type) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Brands.class, "category"); 
		criteria.createAlias("category.categoryType", "categoryType");
		criteria.add(Restrictions.eq("categoryType.name", type));
		Brands category = (Brands) criteria.list().get(0);
		return category;
	}

	@Override
	public List<Brands> getCategories() {
		Query query = sessionFactory.getCurrentSession().createQuery("from Brands category");
		List<Brands> categories = query.list();
		return categories;
	}
}
