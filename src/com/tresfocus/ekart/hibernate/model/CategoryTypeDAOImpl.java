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
import com.tresfocus.ekart.hibernate.entity.CategoryType;
import com.tresfocus.ekart.hibernate.entity.User;

@Repository
public class CategoryTypeDAOImpl implements CategoryTypeDAO{

	@Autowired
    private SessionFactory sessionFactory;
	
	@Override
	public CategoryType getByKey(Integer id){
		return (CategoryType) sessionFactory.getCurrentSession().get(CategoryType.class, id);		
	}

	@Override
	public CategoryType upsert(CategoryType category, User loggedInUser) throws Exception{
        Utility.populateWhoColumns(category, loggedInUser);
        return (CategoryType)sessionFactory.getCurrentSession().merge(category);
    }
	
	@Override
	public void delete(CategoryType CategoryType) {
        sessionFactory.getCurrentSession().delete(CategoryType);
    }

	@Override
	public List<CategoryType> findByCriteria(CategoryType category) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(CategoryType.class);
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
	public List<CategoryType> getAllCategories() {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(CategoryType.class)
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
	public CategoryType getCategory(String name) {
		Query query = sessionFactory.getCurrentSession().createQuery("from CategoryType category WHERE category.name =:category_name");
		query.setParameter("category_name",name);
		CategoryType category = (CategoryType) query.list().get(0);
		return category;
	}
	
	@Override
	public CategoryType getCategoryByType(String type) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(CategoryType.class, "category"); 
		criteria.createAlias("category.categoryType", "categoryType");
		criteria.add(Restrictions.eq("categoryType.name", type));
		CategoryType category = (CategoryType) criteria.list().get(0);
		return category;
	}

	@Override
	public List<CategoryType> getCategories() {
		Query query = sessionFactory.getCurrentSession().createQuery("from CategoryType category");
		List<CategoryType> categories = query.list();
		return categories;
	}
}
