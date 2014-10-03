package com.tresfocus.ekart.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.Product;
import com.tresfocus.ekart.hibernate.model.CategoryDAO;
import com.tresfocus.ekart.hibernate.model.MeasuringUnitDAO;
import com.tresfocus.ekart.hibernate.model.OrganizationDAO;
import com.tresfocus.ekart.hibernate.model.ProductDAO;
import com.tresfocus.ekart.hibernate.model.RetailerSnapshotDAO;
import com.tresfocus.ekart.web.ui.beans.ProductBean;
import com.tresfocus.ekart.web.ui.beans.ShoppingCart;

@Service
public class ProductManagerImpl implements ProductManager {
	private static final Logger logger = Logger.getLogger(ProductManagerImpl.class);
	
	@Autowired
	private OrganizationDAO orgDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private MeasuringUnitDAO mUnitDAO;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private RetailerSnapshotDAO snapshotDAO;
	
	@Override
	@Transactional
	public List<Product> getAllProducts(Integer orgaId){
		return productDAO.getAllProducts(orgaId);
	}

	@Override
	@Transactional
	public List<Product> findByCriteria(Integer orgaId, String categoryName,ShoppingCart shoppingCart) {
		List<ProductBean> productBeans = new ArrayList<ProductBean>();
		List<Product> rs = productDAO.findByCriteria(orgaId, categoryName);
		for(Product product : rs){
			productBeans.add(new ProductBean(product));
			//shoppingCart.addManufacturer(product.getManufacturer());
			shoppingCart.addPacketSize(product.getRetailerSnapshots());
		}
		shoppingCart.setSearchedProductsBean(productBeans);
		//shoppingCart.setSearchedProducts(rs);
		return rs;
	}
	@Override
	@Transactional
	public List<Product> findByCriteriaByType(Integer orgaId, String categoryName,ShoppingCart shoppingCart) {
		List<ProductBean> productBeans = new ArrayList<ProductBean>();
		List<Product> rs = productDAO.findByCriteriaByType(orgaId, categoryName);
		for(Product product : rs){
			productBeans.add(new ProductBean(product));
			//shoppingCart.addManufacturer(product.getManufacturer());
			shoppingCart.addPacketSize(product.getRetailerSnapshots());
		}
		shoppingCart.setSearchedProductsBean(productBeans);
		//shoppingCart.setSearchedProducts(rs);
		return rs;
	}
	@Override
	@Transactional
	public List<Product> getProducts(Integer orgId, String categoryName,ShoppingCart shoppingCart) {
		List<ProductBean> productBeans = new ArrayList<ProductBean>();
		List<Product> rs = productDAO.findByCriteria(orgId, categoryName);
		for(Product product : rs){
			//Hibernate.initialize(product.getCategory());
			productBeans.add(new ProductBean(product));
			//shoppingCart.addManufacturer(product.getManufacturer());
			shoppingCart.addPacketSize(product.getRetailerSnapshots());
		}
		shoppingCart.setSearchedProductsBean(productBeans);
		//shoppingCart.setSearchedProducts(rs);
		return rs;
	}

}
