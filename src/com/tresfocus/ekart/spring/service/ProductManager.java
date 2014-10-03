package com.tresfocus.ekart.spring.service;

import java.util.List;

import com.tresfocus.ekart.hibernate.entity.Product;
import com.tresfocus.ekart.web.ui.beans.ShoppingCart;

public interface ProductManager {
	public List<Product> getAllProducts(Integer orgaId);
	public List<Product> findByCriteria(Integer orgaName, String categoryName,ShoppingCart shoppingCart);
	public List<Product> getProducts(Integer orgaId, String categoryName,
			ShoppingCart shoppingCart);
	public List<Product> findByCriteriaByType(Integer orgaId, String categoryName,
			ShoppingCart shoppingCart);
}
