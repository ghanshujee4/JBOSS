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
import com.tresfocus.ekart.hibernate.entity.Category;
import com.tresfocus.ekart.hibernate.entity.User;

@Repository
public class CategoryDAOImpl implements CategoryDAO{

	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public Category getByKey(Integer id){
		return (Category) sessionFactory.getCurrentSession().get(Category.class, id);		
	}

	@Override
	public Category upsert(Category category, User loggedInUser) throws Exception{
        Utility.populateWhoColumns(category, loggedInUser);
        return (Category)sessionFactory.getCurrentSession().merge(category);
    }
	
	@Override
	public void delete(Category Category) {
        sessionFactory.getCurrentSession().delete(Category);
    }

	@Override
	public List<Category> findByCriteria(Category category) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Category.class);
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
	public List<Category> getAllCategories() {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Category.class)
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
	public Category getCategory(String name) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Category category WHERE category.name =:category_name");
		query.setParameter("category_name",name);
		Category category = (Category) query.list().get(0);
		return category;
	}
	
	@Override
	public Category getCategoryByType(String type) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Category.class, "category"); 
		criteria.createAlias("category.categoryType", "categoryType");
		criteria.add(Restrictions.eq("categoryType.name", type));
		Category category = (Category) criteria.list().get(0);
		return category;
	}

	@Override
	public List<Category> getCategories() {
		Query query = sessionFactory.getCurrentSession().createQuery("from Category category");
		List<Category> categories = query.list();
		return categories;
	}
}
