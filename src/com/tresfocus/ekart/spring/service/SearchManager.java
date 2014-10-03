package com.tresfocus.ekart.spring.service;

import java.util.List;

import com.tresfocus.ekart.hibernate.entity.Organization;
import com.tresfocus.ekart.hibernate.entity.Product;
import com.tresfocus.ekart.web.ui.beans.ProductBean;
import com.tresfocus.ekart.web.ui.beans.ShoppingCart;


public interface SearchManager {
	public List<ProductBean> getMatchedProducts(ShoppingCart shoppingCart,String productName);
	//public Product getProduct(String productName);
	//public List<Product> getProducts();
	public List<String> getTagsList(String query, List<ProductBean> products);
	public ShoppingCart searchProductsByCategoryCriteria(ShoppingCart shoppingCart);
	public List<Organization> getRetailers(String categoryName,String zoneName);
	public Organization getRetailer(Integer orgId);
}
