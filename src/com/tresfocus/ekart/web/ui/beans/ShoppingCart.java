package com.tresfocus.ekart.web.ui.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeMap;
import java.util.TreeSet;

import com.tresfocus.ekart.hibernate.entity.Brands;
import com.tresfocus.ekart.hibernate.entity.Category;
import com.tresfocus.ekart.hibernate.entity.Cities;
import com.tresfocus.ekart.hibernate.entity.Country;
import com.tresfocus.ekart.hibernate.entity.Organization;
import com.tresfocus.ekart.hibernate.entity.Product;
import com.tresfocus.ekart.hibernate.entity.RetailerSnapshot;
import com.tresfocus.ekart.hibernate.entity.States;
import com.tresfocus.ekart.hibernate.entity.User;

public class ShoppingCart  implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8507221595810085782L;
	private String tag;//used
	private String zone;//used
	private String category;//used
	private String categoryType;//used
	private Organization retailer;
	private Integer retailerId;
	private User login;
	private List<Product> products;
	private List<Product> searchedProducts;
	private List<ProductBean> searchedProductsBean;
	//used to store secoundar search criteria products
	private List<ProductBean> searchedSecoundaryProducts;
	private Map<PriceRange,List<Double>> productsByPrice;
	private Set<Brands> brands;
	private SortedSet<String> packetSizes;
	private Set<String> selectedMeasurements;
	private Set<String> selectedPriceRanges;
	private Set<String> selectedBrands;
	private String selectedCategory;
	private List<OrderLinesBean> orderItemsBean;
	private Map<String,List<OrderItem>> orderItems;//used
	private OrderItem orderItem;
	//private List<User> retailers;
	private List<User> customerRetailers;
	private User customer;
	//private String searchedProductsJson;
	private List<OrdersBean> customerOrders;
	private List<Organization> retailers;//used
	//Used to show menu categories
	private List<Category> categories;//used
	
	private List<Cities> cities;
	private List<Country> countries;
	private List<States> states;
	private String status;//used
	private List<UserAddressBean> userAddressBean;//used
	private List<OrdersBean> customerOrderHistory;//used
	private List<OrderItem> orderHistoryItems;//used

	public List<OrderItem> getOrderHistoryItems() {
		return orderHistoryItems;
	}

	public void setOrderHistoryItems(List<OrderItem> orderHistoryItems) {
		this.orderHistoryItems = orderHistoryItems;
	}

	public List<OrdersBean> getCustomerOrderHistory() {
		return customerOrderHistory;
	}

	public void setCustomerOrderHistory(List<OrdersBean> customerOrderHistory) {
		this.customerOrderHistory = customerOrderHistory;
	}

	public List<UserAddressBean> getUserAddressBean() {
		return userAddressBean;
	}

	public void setUserAddressBean(List<UserAddressBean> userAddressBean) {
		this.userAddressBean = userAddressBean;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCategoryType() {
		return categoryType;
	}

	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public List<Cities> getCities() {
		return cities;
	}

	public void setCities(List<Cities> cities) {
		this.cities = cities;
	}

	public List<Country> getCountries() {
		return countries;
	}

	public void setCountries(List<Country> countries) {
		this.countries = countries;
	}

	public List<States> getStates() {
		return states;
	}

	public void setStates(List<States> states) {
		this.states = states;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public List<Organization> getRetailers() {
		return retailers;
	}

	public void setRetailers(List<Organization> retailers) {
		this.retailers = retailers;
	}

	public Integer getRetailerId() {
		return retailerId;
	}

	public void setRetailerId(Integer retailerId) {
		this.retailerId = retailerId;
	}


	/*public String getSearchedProductsJson() {
		return searchedProductsJson;
	}

	public void setSearchedProductsJson(String searchedProductsJson) {
		this.searchedProductsJson = searchedProductsJson;
	}*/

	public String getCategory() {
		return category;
	}

	public Organization getRetailer() {
		return retailer;
	}

	public List<OrdersBean> getCustomerOrders() {
		return customerOrders;
	}

	public void setCustomerOrders(List<OrdersBean> customerOrders) {
		this.customerOrders = customerOrders;
	}

	public void setRetailer(Organization retailer) {
		this.retailer = retailer;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public User getLogin() {
		return login;
	}

	public List<ProductBean> getSearchedProductsBean() {
		if(searchedProductsBean == null){
			searchedProductsBean = new ArrayList<ProductBean>();
		}
		return searchedProductsBean;
	}

	public void setSearchedProductsBean(List<ProductBean> searchedProductsBean) {
		this.searchedProductsBean = searchedProductsBean;
	}

	public List<OrderLinesBean> getOrderItemsBean() {
		if(orderItemsBean == null){
			orderItemsBean = new ArrayList<OrderLinesBean>();
		}
		return orderItemsBean;
	}

	public void setOrderItemsBean(List<OrderLinesBean> orderItemsBean) {
		this.orderItemsBean = orderItemsBean;
	}

	public void setLogin(User login) {
		this.login = login;
	}

	/*public List<User> getRetailers() {
		if(retailers==null){
			retailers = new ArrayList<User>();
		}
		return retailers;
	}

	public void setRetailers(List<User> retailers) {
		this.retailers = retailers;
	}
*/
	public List<ProductBean> getSearchedSecoundaryProducts() {
		if(searchedSecoundaryProducts == null){
			searchedSecoundaryProducts = new ArrayList<ProductBean>();
		}
		return searchedSecoundaryProducts;
	}

	public void setSearchedSecoundaryProducts(
			List<ProductBean> searchedSecoundaryProducts) {
		this.searchedSecoundaryProducts = searchedSecoundaryProducts;
	}

	public List<Product> getSearchedProducts() {
		if(searchedProducts == null){
			searchedProducts = new ArrayList<Product>();
		}
		return searchedProducts;
	}

	public void setSearchedProducts(List<Product> searchedProducts) {
		this.searchedProducts = searchedProducts;
	}
	

		
	public List<Product> getProducts() {
		if(products == null){
			products = new ArrayList<Product>();
		}
		return products;
	}

	public Set<String> getSelectedMeasurements() {
		if(selectedMeasurements==null){
			selectedMeasurements = new TreeSet<String>();
		}
		return selectedMeasurements;
	}

	public void setSelectedMeasurements(Set<String> selectedMeasurements) {
		this.selectedMeasurements = selectedMeasurements;
	}

	public Set<String> getSelectedPriceRanges() {
		if(selectedPriceRanges==null){
			selectedPriceRanges = new TreeSet<String>();
		}
		return selectedPriceRanges;
	}

	public void setSelectedPriceRanges(Set<String> selectedPriceRanges) {
		this.selectedPriceRanges = selectedPriceRanges;
	}

	public Set<String> getSelectedBrands() {
		if(selectedBrands==null){
			selectedBrands = new TreeSet<String>();
		}
		return selectedBrands;
	}

	public void setSelectedBrands(Set<String> selectedBrands) {
		this.selectedBrands = selectedBrands;
	}

	public String getSelectedCategory() {
		return selectedCategory;
	}

	public void setSelectedCategory(String selectedCategory) {
		this.selectedCategory = selectedCategory;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public Set<Brands> getManufacturers() {
		if(brands==null){
			brands = new TreeSet<Brands>();
		}
		return brands;
	}

	public void setManufacturers(Set<Brands> brands) {
		this.brands = brands;
	}

	public Set<String> getPacketSizes() {
		if(packetSizes==null){
			packetSizes = new TreeSet<String>();
		}
		return packetSizes;
	}

	public void setPacketSizes(SortedSet<String> packetSizes) {
		this.packetSizes = packetSizes;
	}

	public Map<PriceRange, List<Double>> getProductsByPrice() {
		/*if(productsByPrice==null){
			productsByPrice = new TreeSet<String>();
		}*/
		return productsByPrice;
	}
	private void initializeProductsByPrice(){
		productsByPrice = new TreeMap<PriceRange,List<Double>>();
		addPrice(1,20);
		addPrice(21,50);
		addPrice(51,100);
		addPrice(101,200);
		addPrice(201,500);
		addPrice(501,1000);
		addPrice(1001,1000000);
	}

	private void addPrice(double min,double max) {
		productsByPrice.put(new PriceRange(min,max), new ArrayList<Double>());
	}
	
	public void addManufacturer(Brands manufacturer){
		if(brands==null){
			brands = new TreeSet<Brands>();
		}
		if(manufacturer!=null){
			brands.add(manufacturer);	
		}		
	}
	public void addPacketSize(String size){
		if(packetSizes==null){
			packetSizes = new TreeSet<String>();
		}
		packetSizes.add(size);
	}
	public void addPacketSize(Set<RetailerSnapshot> retailerSnapshots){
		if(packetSizes==null){
			packetSizes = new TreeSet<String>();
		}
		for(RetailerSnapshot retailerSnapshot : retailerSnapshots){
			if(retailerSnapshot.getPackSize() !=null){
				packetSizes.add(retailerSnapshot.getPackSize());
			}
			
			addProductByPrice(retailerSnapshot.getSalePrice());
		}
		
	}
	public void addPacketSizeForSecoundarSearch(Set<RetailerSnapshotBean> retailerSnapshots){
		if(packetSizes==null){
			packetSizes = new TreeSet<String>();
		}
		for(RetailerSnapshotBean retailerSnapshot : retailerSnapshots){
			packetSizes.add(retailerSnapshot.getMeasuringUnit().getName());
			addProductByPrice(retailerSnapshot.getSalePrice());
		}
		
	}
	public void addProductByPrice(double price){
		if(productsByPrice==null){
			initializeProductsByPrice();
		}
		for(PriceRange pr : productsByPrice.keySet()){
			if(pr.isPriceRange(price)){
				productsByPrice.get(pr).add(price);
			}
		}
	}
	public void setProductsByPrice(Map<PriceRange, List<Double>> productsByPrice) {
		this.productsByPrice = productsByPrice;
	}

	
	
	public ShoppingCart() {
		initializeProductsByPrice();
	}

	public ShoppingCart(String tag) {
		this.tag = tag;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public List<User> getCustomerRetailers() {
		return customerRetailers;
	}

	public void setCustomerRetailers(List<User> customerRetailers) {
		this.customerRetailers = customerRetailers;
	}

	public User getCustomer() {
		return customer;
	}

	public void setCustomer(User customer) {
		this.customer = customer;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ShoppingCart [tag=");
		builder.append(tag);
		builder.append(", login=");
		builder.append(login);
		builder.append(", products=");
		builder.append(products);
		builder.append(", searchedProducts=");
		builder.append(searchedProducts);
		builder.append(", searchedSecoundaryProducts=");
		builder.append(searchedSecoundaryProducts);
		builder.append(", productsByPrice=");
		builder.append(productsByPrice);
		builder.append(", brands=");
		builder.append(brands);
		builder.append(", packetSizes=");
		builder.append(packetSizes);
		builder.append(", selectedMeasurements=");
		builder.append(selectedMeasurements);
		builder.append(", selectedPriceRanges=");
		builder.append(selectedPriceRanges);
		builder.append(", selectedBrands=");
		builder.append(selectedBrands);
		builder.append(", selectedCategory=");
		builder.append(selectedCategory);
		builder.append(", orderItems=");
		builder.append(orderItems);
		builder.append(", orderItem=");
		builder.append(orderItem);
		//builder.append(", retailers=");
		//builder.append(retailers);
		builder.append(", customerRetailers=");
		builder.append(customerRetailers);
		builder.append(", customer=");
		builder.append(customer);
		builder.append("]");
		return builder.toString();
	}

	public Set<Brands> getBrands() {
		return brands;
	}

	public void setBrands(Set<Brands> brands) {
		this.brands = brands;
	}

	public Map<String,List<OrderItem>> getOrderItems() {
		if(orderItems==null){
			orderItems = new HashMap<String,List<OrderItem>>();
		}
		return orderItems;
	}
	public void addOrderItems(String retailerId,OrderItem orderItem) {
		List<OrderItem> orderItemList = null;
		if(orderItems==null){
			orderItems = new HashMap<String,List<OrderItem>>();
		}
		if(orderItems.containsKey(retailerId)){
			orderItemList = orderItems.get(retailerId);
		}else{
			orderItemList = new ArrayList<OrderItem>();
		}
		orderItemList.add(orderItem);
		orderItems.put(retailerId,orderItemList);
	}

	public void setOrderItems(Map<String,List<OrderItem>> orderItems) {
		this.orderItems = orderItems;
	}

	public OrderItem getOrderItem() {
		return orderItem;
	}

	public void setOrderItem(OrderItem orderItem) {
		this.orderItem = orderItem;
	}

	public void setOrderItems(String retailerId2, List orderItems2) {
		this.orderItems.put(retailerId2, orderItems2);
	}

	
}
