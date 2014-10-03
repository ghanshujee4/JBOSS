package com.tresfocus.ekart.spring.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.tresfocus.ekart.IConstants;
import com.tresfocus.ekart.crypt.BCrypt;
import com.tresfocus.ekart.hibernate.entity.Address;
import com.tresfocus.ekart.hibernate.entity.Organization;
import com.tresfocus.ekart.hibernate.entity.Product;
import com.tresfocus.ekart.hibernate.entity.Roles;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.hibernate.entity.UserAddress;
import com.tresfocus.ekart.hibernate.entity.UserRole;
import com.tresfocus.ekart.hibernate.entity.Zone;
import com.tresfocus.ekart.spring.service.AddressManager;
import com.tresfocus.ekart.spring.service.CategoryManager;
import com.tresfocus.ekart.spring.service.OrderLinesManager;
import com.tresfocus.ekart.spring.service.OrdersManager;
import com.tresfocus.ekart.spring.service.OrganizationManager;
import com.tresfocus.ekart.spring.service.ProductManager;
import com.tresfocus.ekart.spring.service.RetailSnapshotManager;
import com.tresfocus.ekart.spring.service.RolesManager;
import com.tresfocus.ekart.spring.service.SearchManager;
import com.tresfocus.ekart.spring.service.UserAddressManager;
import com.tresfocus.ekart.spring.service.UserManager;
import com.tresfocus.ekart.spring.service.UserRoleManager;
import com.tresfocus.ekart.spring.service.ZoneManager;
import com.tresfocus.ekart.util.JSONUtil;
import com.tresfocus.ekart.web.ui.beans.OrderItem;
import com.tresfocus.ekart.web.ui.beans.ProductBean;
import com.tresfocus.ekart.web.ui.beans.RetailerSnapshotBean;
import com.tresfocus.ekart.web.ui.beans.ShoppingCart;
import com.tresfocus.ekart.web.ui.beans.UserAddressBean;

@Controller
@SessionAttributes({"user","shoppingCart","zones"})
public class CustomerController {
	@Autowired
	private UserManager userManager;
	
	@Autowired
    private ProductManager productManager;
	@Autowired
    private SearchManager searchManager;
	@Autowired
	private RetailSnapshotManager retailSnapshotManager;
	@Autowired
    private ZoneManager zoneManager;
	@Autowired
    private OrdersManager ordersManager;
	@Autowired
    private AddressManager addressManager;
	@Autowired
    private RolesManager rolesManager;
	@Autowired
    private UserRoleManager userRolesManager;
	@Autowired
    private UserAddressManager userAddressManager;
	@Autowired
    private OrganizationManager organizationManager;
	@Autowired
    private CategoryManager categoryManager;
	@Autowired
    private OrderLinesManager orderLinesManager;
	
	
	private static enum SearchCriteria{
		BRAND,PRICE,MEASUREMENT;
		
	}
	public static enum CATEGORIES{
		GROCERIES("1"),PHARMA("2"),GIFTS("3"),TOYS("4");
		private String value;

        private CATEGORIES(String value) {
                this.value = value;
        }
		public static String getId(String category){
			if(GROCERIES.name().equalsIgnoreCase(category)){
				return GROCERIES.value;	
			}else if(PHARMA.name().equalsIgnoreCase(category)){
				return PHARMA.value;	
			}else if(GIFTS.name().equalsIgnoreCase(category)){
				return GIFTS.value;	
			}else if(TOYS.name().equalsIgnoreCase(category)){
				return TOYS.value;	
			}   
			return null;
		}
	}
	
	/*
	 * Redirect to customer home page
	 */
	@RequestMapping(value = "/customer/index.shx", method = RequestMethod.GET)
	public ModelAndView getRetailerProducts(Model model, HttpSession session,
			@ModelAttribute("shoppingCart") ShoppingCart shoppingCart,
			@RequestParam("retailerId") Integer retailerId) throws IOException{
		shoppingCart.setRetailer(searchManager.getRetailer(retailerId));
		shoppingCart.setCategories(categoryManager.getCategories());
		//List<Product> rs = productManager.findByCriteria(retailerId,shoppingCart.getCategory(),shoppingCart);
		model.addAttribute("shoppingCart", shoppingCart); 
		User user = (User) session.getAttribute(IConstants.SESSION_USER);
		//shoppingCart.setSearchedProductsJson(JSONUtil.createJsonString(shoppingCart.getSearchedProductsBean())); 
		return new ModelAndView("/customer/home", "shoppingCart", shoppingCart);
	}
	
//	@RequestMapping(value = "/customer/get_retailers.shx", method = RequestMethod.GET, headers = "Accept=*/*")
	/*public @ResponseBody
	List<User> getRetailers(Model model,
			@ModelAttribute("shoppingCart") ShoppingCart shoppingCart) {
		List<User> retailers = userManager.getRetailers();
		shoppingCart.setRetailers(retailers);
		return retailers;
	}*/

	@RequestMapping(value = "/customer/get_session_customer_retailers.shx", method = RequestMethod.GET, headers = "Accept=*/*")
	public @ResponseBody
	List<User> getSessionMyRetailers(Model model,
			@ModelAttribute("shoppingCart") ShoppingCart shoppingCart) {
		shoppingCart = (ShoppingCart) model.asMap().get("shoppingCart");
		return shoppingCart.getCustomerRetailers();
	}

	@ModelAttribute("shoppingCart")
	public ShoppingCart createCustomerShoppingCartSession() throws Exception {
		ShoppingCart shoppingCart = new ShoppingCart();
		//shoppingCart.setProducts(productManager.getAllProducts());
		return shoppingCart;
	}
	@RequestMapping(value = "/customer/get_tag_list.shx", 
			method = RequestMethod.GET, 
			headers="Accept=*/*")
	public @ResponseBody List<String> getProductNames(Model model,@ModelAttribute("shoppingCart") ShoppingCart shoppingCart,@RequestParam("term") String query) {
		shoppingCart.setTag(query);
		List<String> tagList = searchManager.getTagsList(query, shoppingCart.getSearchedProductsBean());
		model.addAttribute("shoppingCart", shoppingCart);
		return tagList;
	}


	@RequestMapping(value = "/customer/search.shx",method = RequestMethod.GET,	headers="Accept=*/*")
	public @ResponseBody String getSearchResults(Model model,
		@ModelAttribute("shoppingCart") ShoppingCart shoppingCart,
		@RequestParam("tag") String tag) throws Exception {
		System.out.println("Searching...");
		//List<ProductVO> products = getProducts();
		List<ProductBean> searchedProducts = searchManager.getMatchedProducts(shoppingCart, tag);
		//shoppingCart.setSearchedProducts(searchedProducts);
		model.addAttribute("shoppingCart", shoppingCart); 
		return JSONUtil.createJsonString(shoppingCart);
		
	}
	
	/*
	 * Retrieve all the default Products for selected Retailer
	 */
	@RequestMapping(value = "/customer/default_search",method = RequestMethod.GET,	headers="Accept=*/*")
	public @ResponseBody String getdefaultSearchResults(Model model,
		@ModelAttribute("shoppingCart") ShoppingCart shoppingCart) throws IOException{
		//List<ProductVO> products = getProducts();
		List<Product> rs = productManager.findByCriteriaByType(shoppingCart.getRetailer().getId(),shoppingCart.getCategoryType(),shoppingCart);
		model.addAttribute("shoppingCart", shoppingCart); 
		String json = JSONUtil.createJsonString(shoppingCart);
		System.out.println(json);
		return json;
	}
	/*
	 * Retrieve the products for the selected category from category menu.
	 */
	@RequestMapping(value = "/customer/category_search",method = RequestMethod.GET,	headers="Accept=*/*")
	public @ResponseBody String getcategorySearchResults(Model model,
		@ModelAttribute("shoppingCart") ShoppingCart shoppingCart,
		@RequestParam("category") String category) throws IOException{
		shoppingCart.setCategory(category);
		List<Product> rs = productManager.findByCriteria(shoppingCart.getRetailer().getId(),category,shoppingCart);
		model.addAttribute("shoppingCart", shoppingCart); 
		String json = JSONUtil.createJsonString(shoppingCart);
		System.out.println(json);
		return json;
	}
	
	@RequestMapping(value = "/customer/category_search_criteria.shx",method = RequestMethod.GET,	headers="Accept=*/*")
	public @ResponseBody String getcategorySearchCriteriaResults(Model model,
		@ModelAttribute("shoppingCart") ShoppingCart shoppingCart,
		@RequestParam("categorySearchCriteria") String categorySearchCriteria,
		@RequestParam("searchCriteriaType") String searchCriteriaType,
		@RequestParam("checked") boolean checked) throws IOException {
		if(SearchCriteria.BRAND.name().equals(searchCriteriaType)){
			shoppingCart.setSelectedBrands(updateSearchCriteria(shoppingCart.getSelectedBrands(), categorySearchCriteria, checked));
		}else if(SearchCriteria.PRICE.name().equals(searchCriteriaType)){
			shoppingCart.setSelectedPriceRanges(updateSearchCriteria(shoppingCart.getSelectedPriceRanges(), categorySearchCriteria, checked));
		}else if(SearchCriteria.MEASUREMENT.name().equals(searchCriteriaType)){
			shoppingCart.setSelectedMeasurements(updateSearchCriteria(shoppingCart.getSelectedMeasurements(), categorySearchCriteria, checked));
		}
		System.out.println("Searching..."+searchCriteriaType);
		System.out.println("Searching..."+categorySearchCriteria);
		System.out.println("Searching..."+checked);
		//List<ProductVO> products = getProducts();
		searchManager.searchProductsByCategoryCriteria(shoppingCart);
		model.addAttribute("shoppingCart", shoppingCart); 
		String json = JSONUtil.createJsonString(shoppingCart);
		System.out.println(json);
		return json;
		//return JSONUtil.createJsonString(shoppingCart);
	}


	private Set<String> updateSearchCriteria(Set<String> searchCriterias,
		String categorySearchCriteria, boolean checked) {
		if(checked){
			searchCriterias.add(categorySearchCriteria);
		}else{
			searchCriterias.remove(categorySearchCriteria);
		}
		return searchCriterias;
	}

	
	@RequestMapping(value = "/customer/addItemToCart",method = RequestMethod.GET,	headers="Accept=*/*")
	public @ResponseBody String addItemToCart(Model model,
		@ModelAttribute("shoppingCart") ShoppingCart shoppingCart,
		@RequestParam(value="productId") String productId,
		@RequestParam(value="quantity") Integer quantity,
		@RequestParam(value="price") String price,
		@RequestParam(value="prodAttrId") String prodAttrId,
		@RequestParam(value="retailerId") String retailerId
		) throws IOException {
		getOrderItem( shoppingCart,retailerId, productId, quantity, price,prodAttrId);
		model.addAttribute("shoppingCart", shoppingCart);
		return JSONUtil.createJsonString(shoppingCart);
	}

	private RetailerSnapshotBean getProductdAttribute(ProductBean product,String prodAttrId){
		Set<RetailerSnapshotBean> prodAttrs = product.getRetailerSnapshots();
		for(RetailerSnapshotBean pa : prodAttrs){
			if(pa.getId()==Integer.parseInt(prodAttrId)){
				return pa;
			}
		}
		return null;
	}
	private ProductBean getProduct(List<ProductBean> products,String productId){
		for(ProductBean prod : products){
			if(prod.getId()==Integer.parseInt(productId)){
				return prod;
			}
		}
	return null;
	}
	
	private RetailerSnapshotBean getOrderItem(ShoppingCart shoppingCart,String retailerId,String productId,Integer quantity,String price,String prodAttrId){
		ProductBean product = getProduct(shoppingCart.getSearchedProductsBean(),productId);
		RetailerSnapshotBean rsb = getProductdAttribute(product, prodAttrId);
		shoppingCart.setOrderItem(new OrderItem(product,quantity,rsb));
		shoppingCart.addOrderItems(retailerId,shoppingCart.getOrderItem());
		return rsb;
	}
	
	/*
	 * Initial Customer call is served by this method and returns zone page. 
	 */
	@RequestMapping(value = "/zone.shx", method = RequestMethod.GET)
	public ModelAndView zone(ModelMap map,@ModelAttribute("zones") List<Zone> zones){
		ShoppingCart shoppingCart = new ShoppingCart();
		return new ModelAndView("/zone", "shoppingCart", shoppingCart);
	}
	
	/*
	 * Provides the list of zone need to be shown on zone dropdown suggestion box
	 */
	@RequestMapping(value = "/get_zone_list.shx", 
			method = RequestMethod.GET, 
			headers="Accept=*/*")
	public @ResponseBody List<String> getZoneNames(Model model,@ModelAttribute("zones") List<Zone> zones,
			@ModelAttribute("shoppingCart") ShoppingCart shoppingCart,
			@RequestParam("term") String zone) {
		shoppingCart.setZone(zone);
		List<String> zoneList = zoneManager.getZoneList(zone, zones);
		model.addAttribute("shoppingCart", shoppingCart);
		return zoneList;
	}
	@RequestMapping(value = "/get_categories.shx",method = RequestMethod.GET,	headers="Accept=*/*")
	public @ResponseBody ModelAndView getCategories(Model model,HttpSession session,
		@ModelAttribute("shoppingCart") ShoppingCart shoppingCart,
		@RequestParam("zone") String zone) {
		System.out.println("Searching...");
		User user = (User) session.getAttribute(IConstants.SESSION_USER);
		shoppingCart.setZone(zone);
		if(user!=null){
			shoppingCart.setCustomerOrders(ordersManager.getCustomerOrders(user.getId()));
		}
		
		model.addAttribute("shoppingCart", shoppingCart);
		return new ModelAndView("category","shoppingCart",shoppingCart);
	}
	
	/*
	 * Populate the retailer select on bases of zone and category selected.
	 */
	@RequestMapping(value = "/search_zone_retailers.shx",method = RequestMethod.GET,	headers="Accept=*/*")
	public @ResponseBody String getSearchZoneRetailers(Model model,
		@ModelAttribute("shoppingCart") ShoppingCart shoppingCart,
		@RequestParam("categoryType") String categoryType) throws IOException {
		shoppingCart.setCategoryType(categoryType);
		shoppingCart.setRetailers(searchManager.getRetailers(CATEGORIES.getId(categoryType),shoppingCart.getZone()));
		model.addAttribute("shoppingCart", shoppingCart); 
		return JSONUtil.createJsonString(shoppingCart.getRetailers());
	}
	@RequestMapping(value = "/customer/selectAddress.shx", method = RequestMethod.GET, headers = "Accept=*/*")
	public @ResponseBody
	String selectAddress(Model model, HttpSession session,
			@ModelAttribute("shoppingCart") ShoppingCart shoppingCart) {
		String page ="j_spring_security_check";
		User user = (User) session.getAttribute(IConstants.SESSION_USER);
		
		if(user!=null){
			//ordersManager.saveOrder(user, shoppingCart);
			try {
				//return JSONUtil.createJsonString(userAddressManager.getAddressByUserId(user.getId()));
				List<UserAddressBean> userAddressBean = userAddressManager.findByCriteria(user.getId()); 
				model.addAttribute("shoppingCart", shoppingCart);
				return JSONUtil.createJsonString(userAddressBean);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		model.addAttribute("shoppingCart", shoppingCart);
		return page;
	}
	
	@RequestMapping(value = "/customer/checkOut.shx", method = RequestMethod.GET, headers = "Accept=*/*")
	public @ResponseBody
	String checkOut(Model model, HttpSession session,
			@ModelAttribute("shoppingCart") ShoppingCart shoppingCart,
			@RequestParam("addressId") String addressId,
			@RequestParam("delivaryDateTime") String delivaryDateTime) {
		String page ="j_spring_security_check";
		User user = (User) session.getAttribute(IConstants.SESSION_USER);
		if(user!=null){
			if(ordersManager.saveOrder(user, shoppingCart,delivaryDateTime,addressId)){
				shoppingCart.getOrderItemsBean().clear();
			}
		}
		model.addAttribute("shoppingCart", shoppingCart);
		return page;
	}
	@RequestMapping(value = "/customer/login.shx", method = RequestMethod.POST, headers = "Accept=*/*")
	public @ResponseBody
	String login(Model model, HttpSession session,
			@ModelAttribute("shoppingCart") ShoppingCart shoppingCart,
			@RequestParam("username") String username,
			@RequestParam("password") String password) throws IOException {
		User currentUser = userManager.getUserByUserName(username);
		List<UserAddressBean> userAddressBean = null;
		session.setAttribute(IConstants.SESSION_USER, currentUser);
		if(currentUser.getPassword() != null &&
				   BCrypt.checkpw(new String(password), currentUser.getPassword())){
			userAddressBean = userAddressManager.findByCriteria(currentUser.getId());
			if(shoppingCart.getOrderItems()!=null && shoppingCart.getOrderItems().size()>0){
				shoppingCart.setCustomerOrderHistory(ordersManager.getCustomerOrders(currentUser.getId(), shoppingCart.getRetailer().getId()));	
			}
			shoppingCart.setStatus("TRUE");
		}else{
			shoppingCart.setStatus("FALSE");
		}
		shoppingCart.setUserAddressBean(userAddressBean);
		model.addAttribute("shoppingCart", shoppingCart);
		return JSONUtil.createJsonString(shoppingCart);
	}
	@RequestMapping(value = "/customer/signout.shx", method = RequestMethod.GET, headers = "Accept=*/*")
	public @ResponseBody
	String signout(Model model, HttpSession session,
			@ModelAttribute("shoppingCart") ShoppingCart shoppingCart) {
		session.invalidate();
		return "TRUE";
	}
	@RequestMapping(value = "/customer/deleteProductFromOrderList.shx", method = RequestMethod.POST, headers = "Accept=*/*")
	public @ResponseBody
	String deleteProductFromOrderList(Model model, HttpSession session,
			@ModelAttribute("shoppingCart") ShoppingCart shoppingCart,
			@RequestParam("productId") String productId,
			@RequestParam("retailerId") String retailerId
			) throws IOException {
		String status = "TRUE";
		List<OrderItem> allOrderItemsAfterDelete = new ArrayList<OrderItem>();
		try{
			List orderItems = new ArrayList<OrderItem>();
			List<OrderItem> retailerOrderItems=shoppingCart.getOrderItems().get(retailerId);
			for(OrderItem orderItem : retailerOrderItems){
				if(orderItem.getProduct().getId()==Integer.parseInt(productId)){
					//shoppingCart.getOrderItems().remove(orderItem);
					shoppingCart.getOrderItem();
				}else{
					orderItems.add(orderItem);
				}
			}
			shoppingCart.setOrderItems(retailerId,orderItems);
		}catch(Exception e){
			status = "FALSE";
		}
		model.addAttribute("shoppingCart", shoppingCart);
		for(String retId : shoppingCart.getOrderItems().keySet()){
			allOrderItemsAfterDelete.addAll(shoppingCart.getOrderItems().get(retId));
		}
		return JSONUtil.createJsonString(allOrderItemsAfterDelete);
	}
	@RequestMapping(value = "/customer/signup.shx", method = RequestMethod.POST, headers = "Accept=*/*")
	public @ResponseBody
	String signup(Model model, HttpSession session,
			@ModelAttribute("shoppingCart") ShoppingCart shoppingCart,
			@RequestParam("username") String username,
			@RequestParam("password") String password,
			@RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName,
			@RequestParam("address1") String address1,
			@RequestParam("address2") String address2,
			@RequestParam("address3") String address3,
			@RequestParam("city") String city,
			@RequestParam("postalcode") String postalcode,
			@RequestParam("email") String email,
			@RequestParam("phone") String phone) {
		String status = "FALSE";
		System.out.println("SignUp...");
		
		
		try{
		Roles roles = rolesManager.getRole(IConstants.ROLE_CUSTOMER);
		Address address = new Address(firstName, lastName,
				address1,address2,address3, city, postalcode,
				phone, email);
		addressManager.save(address);
		User user = new User(username,BCrypt.hashpw(password,BCrypt.gensalt()));
		Organization organization = new Organization(address,user.getUsername(),roles.getName());
		organizationManager.save(organization);
		user.setOrganization(organization);
		userManager.save(user);
		UserRole userRole = new UserRole(user,roles);
		userRolesManager.save(userRole);
		UserAddress userAddress = new UserAddress(user,address);
		userAddressManager.save(userAddress);
	  status = "TRUE";
		}catch(Exception e){
			status ="FALSE";
		}
		return status;
	}
	@RequestMapping(value = "/customer/selected_retailer_products.shx", method = RequestMethod.POST, headers = "Accept=*/*")
	public @ResponseBody String getSelectedRetailerProducts(Model model, HttpSession session,
			@ModelAttribute("shoppingCart") ShoppingCart shoppingCart,
			@RequestParam("retailerId") Integer retailerId) throws IOException{
		System.out.println("Searching..."+retailerId);
		List<Product> rs = null;
		if(CATEGORIES.getId(shoppingCart.getCategory())==null){
			rs = productManager.findByCriteria(retailerId,shoppingCart.getCategory(),shoppingCart);
		}else{
			rs = productManager.findByCriteriaByType(retailerId,shoppingCart.getCategoryType(),shoppingCart);
		}
		shoppingCart.setRetailer(searchManager.getRetailer(retailerId));
		
		//List<Product> rs = productManager.getProducts(retailer,shoppingCart.getCategory(),shoppingCart);
		model.addAttribute("shoppingCart", shoppingCart); 
		//shoppingCart.setSearchedProductsJson(JSONUtil.createJsonString(shoppingCart.getSearchedProductsBean())); 
		//return "/customer/home";
		return JSONUtil.createJsonString(shoppingCart);
	}
	
	@RequestMapping(value = "/customer/order_history.shx", method = RequestMethod.POST, headers = "Accept=*/*")
	public @ResponseBody
	String getOrderHistory(Model model, HttpSession session,
			@ModelAttribute("shoppingCart") ShoppingCart shoppingCart,
			@RequestParam("orderId") Integer orderId) throws IOException{
		List<OrderItem> orderLines = orderLinesManager.findOrderLinesByOrderId(orderId);
		shoppingCart.setOrderHistoryItems(orderLines);
		model.addAttribute("shoppingCart", shoppingCart);
		return JSONUtil.createJsonString(orderLines);
	}
	
	
	@ModelAttribute("zones")
	public List<Zone> createZoneSession() throws Exception {
		return zoneManager.getZones();
	}

}
