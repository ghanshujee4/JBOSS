package com.tresfocus.ekart.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.Organization;
import com.tresfocus.ekart.hibernate.entity.Product;
import com.tresfocus.ekart.hibernate.model.OrganizationDAO;
import com.tresfocus.ekart.hibernate.model.ProductDAO;
import com.tresfocus.ekart.hibernate.model.RetailerDAO;
import com.tresfocus.ekart.web.ui.beans.ProductBean;
import com.tresfocus.ekart.web.ui.beans.RetailerSnapshotBean;
import com.tresfocus.ekart.web.ui.beans.ShoppingCart;

@Service
public class SearchManagerImpl implements SearchManager{
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private RetailerDAO retailerDAO;
	@Autowired
	private OrganizationDAO organizationDAO;
	 
	@Override
	@Transactional
	public List<ProductBean> getMatchedProducts(ShoppingCart shoppingCart, String productName) {
		List<ProductBean> productBeans = new ArrayList<ProductBean>();
		//List<Product> rs = productDAO.getProducts(shoppingCart.getRetailer().getId(),productName);
		List<ProductBean> rs = shoppingCart.getSearchedProductsBean();
		for(ProductBean product : rs){
			if(product.getName().startsWith(productName)){
				productBeans.add(product);
				//shoppingCart.addManufacturer(product.getManufacturer());
				shoppingCart.addPacketSizeForSecoundarSearch(product.getRetailerSnapshots());
			}
			
		}
		shoppingCart.setSearchedSecoundaryProducts(productBeans);
		//shoppingCart.setSearchedProducts(rs);
		return productBeans;
	}

	@Override
	@Transactional
	public List<String> getTagsList(String query,List<ProductBean> products) {
		String keyword = null;
        query = query.toLowerCase();
        List<String> matched = new ArrayList<String>();
        for(int i=0; i < products.size(); i++) {
        	keyword = products.get(i).getName().toLowerCase();
            if(keyword.startsWith(query)) {
                matched.add(products.get(i).getName());
            	//matched.add("<table><tr><td>"+products.get(i).getName()+"</td><td><img src='"+products.get(i).getImage()+"' alt='' border='0' /></td></tr></table>");
            }
        }
        return matched;
    }

	@Override
	@Transactional
	public ShoppingCart searchProductsByCategoryCriteria(
			ShoppingCart shoppingCart) {
		ProductBean pvo = null;
		List<ProductBean> products = new ArrayList<ProductBean>();
		shoppingCart.getSearchedSecoundaryProducts().clear();
		List<ProductBean> secoundarySearchProduct = shoppingCart.getSearchedSecoundaryProducts();
		for(ProductBean product:shoppingCart.getSearchedProductsBean()){
			
			/*if(shoppingCart.getSelectedBrands().contains(product.getManufacturer().getName())){
				shoppingCart.getSearchedSecoundaryProducts().add(product);
			}*/
			for(RetailerSnapshotBean retailerSnapshotBean : product.getRetailerSnapshots()){
				if(shoppingCart.getSelectedMeasurements().contains(retailerSnapshotBean.getMeasuringUnit().getName())){
					secoundarySearchProduct.add(product);
				}
				if(shoppingCart.getSelectedPriceRanges().contains(retailerSnapshotBean.getSalePrice())){
					secoundarySearchProduct.add(product);
				}
			}
			
			
		}
		shoppingCart.setSearchedSecoundaryProducts(secoundarySearchProduct);
		return shoppingCart;
	}

	@Override
	@Transactional
	public List<Organization> getRetailers(String categoryName,String zoneName) {
		return retailerDAO.getCategoryRetailers(categoryName, zoneName);
	}

	@Override
	@Transactional
	public Organization getRetailer(Integer orgId) {
		// TODO Auto-generated method stub
		return organizationDAO.getById(orgId);
	}
}
