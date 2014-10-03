package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.Product;
import com.tresfocus.ekart.hibernate.entity.User;

@Transactional
public interface ProductDAO {
	public Product getByKey(Integer id);
	public Product upsert(Product product, User loggedInUser) throws Exception;
	public void delete(Product product);
	public List<Product> findByCriteria(Product product);
	public List<Product> getAllProducts(Integer orgaId);
	//public List<Product> getProducts(Integer orgaId,String productName);
	public Product getProduct(String productName);
	public List<Product> getProducts();
	public List<Product> getProductsByCategory(String categoryName);
	public List<Product> findByCriteria(Integer orgaName, String categoryName);
	public List<Product> findByCriteriaByType(Integer orgaName, String categoryName);
	//public List<Product> getProducts(String orgaName, String categoryName);
}
