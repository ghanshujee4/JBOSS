package com.tresfocus.ekart.hibernate.model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tresfocus.ekart.Utility;
import com.tresfocus.ekart.hibernate.entity.Category;
import com.tresfocus.ekart.hibernate.entity.Product;
import com.tresfocus.ekart.hibernate.entity.User;

@Repository
public class ProductDAOImpl implements ProductDAO{
	@Autowired
    private SessionFactory sessionFactory;
	
	@Autowired
    private CategoryDAO categoryDAO;
	
	@Override
	public Product getByKey(Integer id){
		return (Product) sessionFactory.getCurrentSession().get(Product.class, id);		
	}

	@Override
	public Product upsert(Product product, User loggedInUser) throws Exception{
        Utility.populateWhoColumns(product, loggedInUser);
        return (Product)sessionFactory.getCurrentSession().merge(product);
    }
	
	@Override
	public void delete(Product product) {
        sessionFactory.getCurrentSession().delete(product);
    }

	@Override
	public List<Product> findByCriteria(Product product) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Product.class);
        Example example = Example.create(product)
				.excludeZeroes()           //exclude zero valued properties
			    .ignoreCase()              //perform case insensitive string comparisons
			    .enableLike();             //use like for string comparisons
        criteria.add(example);
        
       if(product.getId() != 0)
    	   criteria.add(Restrictions.eq("id", product.getId()));
       
       return criteria.list();
    }

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public List<Product> getAllProducts(Integer orgaId) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Product.class);
        return criteria.list();
	}
	/*@Override
	public List<Product> getProducts(Integer orgaId,String productName) {
		List<Product> rs = null;
		Query query = null;
		try{
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Product.class, "product"); 
			criteria.add(Restrictions.like("product.name",productName));
			criteria.createCriteria("product.retailerSnapshots", "retailerSnapshot");
			criteria.createAlias("retailerSnapshot.organization", "organization");
			criteria.add(Restrictions.eq("organization.id",orgaId));
	    	rs =  criteria.list();
	    	
	    	//String sql = "SELECT * FROM product p,category c,retailerSnapshot rs,organization o WHERE p.category.id=c.id AND c.name='GROCERIES' AND p.id=rs.product_id AND rs.org_id=o.id AND o.name=''";
		}catch(Exception e){
			 if (sessionFactory.getCurrentSession().getTransaction() != null) sessionFactory.getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}finally{
			//sessionFactory.getCurrentSession().close();
		}
		return rs;
	}*/
	@Override
	public Product getProduct(String productName) {
		Criteria cr = this.sessionFactory.getCurrentSession().createCriteria(Product.class);
		cr.add(Restrictions.eq("name", productName));
		Product product = null;
		if(cr.list().size()>0){
			System.out.println("Search Successfull....");
			for (Iterator iterator = cr.list().iterator(); iterator.hasNext();){
				product = (Product) iterator.next(); 
				System.out.println(product.getId());
			}
		}else{
			System.out.println("Search Failed....");
		}
		return product;
	}

	@Override
	public List<Product> getProducts() {
		List<Product> products = new ArrayList<Product>();
		try{
			Criteria cr = this.sessionFactory.getCurrentSession().createCriteria(Product.class);
			return cr.list();
		}catch(Exception e){
			e.printStackTrace();
		}
			return null;
	}
	
	@Override
	public List<Product> getProductsByCategory(String categoryName) {
		List<Product> products = new ArrayList<Product>();
		try{
			Criteria cr = this.sessionFactory.getCurrentSession().createCriteria(Product.class);
			cr.add(Restrictions.eq("category.name", categoryName));
			return cr.list();
		}catch(Exception e){
			e.printStackTrace();
		}
			return products;
	}

	/*
	 * The hibernate criteria is taking time to execute so getProducts method is used instead
	 * 
	 * */
	@Override
	public List<Product> findByCriteria(Integer orgaId, String categoryName) {
		List<Product> rs = null;
		Query query = null;
		Category category = null;
		StringBuilder hql = new StringBuilder();
		try{
			String categoryHql=(categoryName!=null)?" and category.name=:category_id ":" ";
			hql.append(" from Product product ");
			hql.append(" left join fetch product.category category ");
			hql.append(" left join fetch product.retailerSnapshots retailerSnapshot ");
			hql.append(" left join fetch retailerSnapshot.measuringUnit ");
			hql.append(" where retailerSnapshot.organization.id=:org_id");
			hql.append(categoryHql);
			rs = getProducts("category_id",orgaId, categoryName, hql);
			
			/*Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Product.class, "product"); 
			if(categoryName!=null){
				category = categoryDAO.getCategory(categoryName);
				criteria.createAlias("product.category", "category");
				criteria.add(Restrictions.eq("category.id", category.getId()));
				//criteria.add(Restrictions.eq("product.category.id",category.getId()));
			}
			
			criteria.createAlias("product.retailerSnapshots", "retailerSnapshot");
			criteria.createAlias("retailerSnapshot.organization", "organization");
			criteria.add(Restrictions.eq("organization.id",orgaId));
	    	rs =  criteria.list();*/
	    	
	    	//String sql = "SELECT * FROM product p,category c,retailerSnapshot rs,organization o WHERE p.category.id=c.id AND c.name='GROCERIES' AND p.id=rs.product_id AND rs.org_id=o.id AND o.name=''";
		}catch(Exception e){
			 if (sessionFactory.getCurrentSession().getTransaction() != null) sessionFactory.getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}finally{
			//sessionFactory.getCurrentSession().close();
		}
		return rs;
	}

	private List<Product> getProducts(String parameter,Integer orgaId, String categoryName,StringBuilder hql) {
		Query query;
		query = sessionFactory.getCurrentSession().createQuery(hql.toString());
		if(categoryName!=null){
			query.setParameter(parameter,categoryName);
		}
		query.setParameter("org_id",orgaId);
		return  query.list();
	}
	
	/*
	 * The hibernate criteria is taking time to execute so getProducts method is used instead
	 * 
	 * */
	@Override
	public List<Product> findByCriteriaByType(Integer orgaId, String categoryName) {
		List<Product> products = null;
		StringBuilder hql = new StringBuilder();
		try{
			String categoryHql=(categoryName!=null)?" and categoryType.name=:category_type_name":" ";
			hql.append(" from Product product ");
			hql.append(" left join fetch product.category category ");
			hql.append(" left join fetch category.categoryType categoryType ");
			hql.append(" left join fetch product.retailerSnapshots retailerSnapshot ");
			hql.append(" left join fetch retailerSnapshot.measuringUnit ");
			hql.append(" where retailerSnapshot.organization.id=:org_id");
			hql.append(categoryHql);
			products = getProducts("category_type_name",orgaId, categoryName, hql);
		}catch(Exception e){
			 if (sessionFactory.getCurrentSession().getTransaction() != null) sessionFactory.getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
		}finally{
			//sessionFactory.getCurrentSession().close();
		}
		return products;
	}
}
