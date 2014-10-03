package com.tresfocus.ekart.spring.rest;

import java.util.List;

import org.apache.log4j.Logger;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thoughtworks.xstream.XStream;
import com.tresfocus.ekart.IConstants;
import com.tresfocus.ekart.ObjectTypeEnum;
import com.tresfocus.ekart.hibernate.entity.Address;
import com.tresfocus.ekart.hibernate.entity.Category;
import com.tresfocus.ekart.hibernate.entity.CategoryType;
import com.tresfocus.ekart.hibernate.entity.Cities;
import com.tresfocus.ekart.hibernate.entity.Country;
import com.tresfocus.ekart.hibernate.entity.Organization;
import com.tresfocus.ekart.hibernate.entity.RetailerCategory;
import com.tresfocus.ekart.hibernate.entity.RetailerZone;
import com.tresfocus.ekart.hibernate.entity.States;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.hibernate.entity.Zone;
import com.tresfocus.ekart.spring.service.AddressManager;
import com.tresfocus.ekart.spring.service.CategoryManager;
import com.tresfocus.ekart.spring.service.CategoryTypeManager;
import com.tresfocus.ekart.spring.service.CitiesManager;
import com.tresfocus.ekart.spring.service.CountryManager;
import com.tresfocus.ekart.spring.service.OrganizationManager;
import com.tresfocus.ekart.spring.service.RetailerCategoryManager;
import com.tresfocus.ekart.spring.service.RetailerZoneManager;
import com.tresfocus.ekart.spring.service.StatesManager;
import com.tresfocus.ekart.spring.service.UserManager;
import com.tresfocus.ekart.spring.service.ZoneManager;

@Controller
@Scope("request")
public class UtilRestSvc {
	private final Logger logger = Logger.getLogger(UtilRestSvc.class);
	@Autowired
	private CountryManager countryMgr;
	@Autowired
	private StatesManager statesMgr;
	@Autowired
	private CitiesManager citiesMgr;
	@Autowired
    private UserManager userMgr;
	@Autowired
	private AddressManager addressMgr;	
	@Autowired
	private OrganizationManager organizationMgr;	
	@Autowired
	private ZoneManager zoneMgr;	
	@Autowired
	private CategoryManager categoryMgr;
	@Autowired
	private CategoryTypeManager categoryTypeMgr;
	@Autowired
	private RetailerCategoryManager retCategoryMgr;
	@Autowired
	private RetailerZoneManager retZoneMgr;
	
	@RequestMapping(value = "/restUtil/countries", method = RequestMethod.GET, produces = "text/plain")
	public @ResponseBody
	String getCountries() throws Exception {
		try {
			List<Country> countries = countryMgr.getAllCountries();

			ObjectTypeEnum typeEnum = ObjectTypeEnum.getTypeByName("Country");
			XStream xstream = Utility.createXStream("json");
			Utility.initializeXStream(typeEnum, xstream);

			String jsonData = xstream.toXML(countries);
			JSONObject jObject = new JSONObject(jsonData);
			JSONArray jArray = jObject.getJSONArray("list");
			JSONArray countryArray = ((JSONObject) jArray.get(0))
					.getJSONArray("country");
			logger.debug(countryArray.toString());

			return countryArray.toString();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
	}

	@RequestMapping(value = "/restUtil/states", method = RequestMethod.GET, produces = "text/plain")
	public @ResponseBody
	String getStates() throws Exception {
		try {
			List<States> states = statesMgr
					.getAllStatesOfCountry(com.tresfocus.ekart.IConstants.COUNTRY_INIDA);

			ObjectTypeEnum typeEnum = ObjectTypeEnum.getTypeByName("State");
			XStream xstream = Utility.createXStream("json");
			Utility.initializeXStream(typeEnum, xstream);

			String jsonData = xstream.toXML(states);
			JSONObject jObject = new JSONObject(jsonData);
			JSONArray jArray = jObject.getJSONArray("list");
			JSONArray stateArray = ((JSONObject) jArray.get(0))
					.getJSONArray("state");
			logger.debug(stateArray.toString());

			return stateArray.toString();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
	}

	@RequestMapping(value = "/restUtil/cities", method = RequestMethod.GET, produces = "text/plain")
	public @ResponseBody
	String getCities(@RequestParam(value = "stateId") Integer stateId)
			throws Exception {
		try {
			List<Cities> cities = citiesMgr.getAllCitiesOfState(stateId);

			ObjectTypeEnum typeEnum = ObjectTypeEnum.getTypeByName("City");
			XStream xstream = Utility.createXStream("json");
			Utility.initializeXStream(typeEnum, xstream);

			String jsonData = xstream.toXML(cities);
			JSONObject jObject = new JSONObject(jsonData);
			JSONArray jArray = jObject.getJSONArray("list");
			JSONArray cityArray = ((JSONObject) jArray.get(0))
					.getJSONArray("city");
			logger.debug(cityArray.toString());

			return cityArray.toString();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String redirectToSignupPage(){
		return "/signup";
	}
	
	@RequestMapping(value = "/restUtil/zones", method = RequestMethod.GET, produces = "text/plain")
	public @ResponseBody
	String getZones(@RequestParam(value = "cityId") Integer cityId)
			throws Exception {
		try {
			List<Zone> zones = zoneMgr.getZonesByCity(cityId);

			ObjectTypeEnum typeEnum = ObjectTypeEnum.getTypeByName("Zone");
			XStream xstream = Utility.createXStream("json");
			Utility.initializeXStream(typeEnum, xstream);
			xstream.processAnnotations(Zone.class);
			xstream.autodetectAnnotations(true);

			//TODO: Bad workaround
			String jsonData = xstream.toXML(zones);
			jsonData = jsonData.replaceAll("object-array", "zone");
			jsonData = jsonData.replaceAll("int", "id");
			jsonData = jsonData.replaceAll("string", "name");

			System.out.println(jsonData);
			JSONObject jObject = new JSONObject(jsonData);
			JSONArray jArray = jObject.getJSONArray("list");
			JSONArray zoneArray = ((JSONObject) jArray.get(0))
					.getJSONArray("zone");
			logger.debug(zoneArray.toString());

			return zoneArray.toString();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
	}
	
	@RequestMapping(value = "/restUtil/categories", method = RequestMethod.GET, produces = "text/plain")
	public @ResponseBody
	String getCategories()
			throws Exception {
		try {
			List<Category> categories = categoryMgr.getAllCategories();

			ObjectTypeEnum typeEnum = ObjectTypeEnum.getTypeByName("Categories");
			XStream xstream = Utility.createXStream("json");
			Utility.initializeXStream(typeEnum, xstream);
			xstream.processAnnotations(Category.class);
			xstream.autodetectAnnotations(true);

			//TODO: Bad workaround
			String jsonData = xstream.toXML(categories);
			jsonData = jsonData.replaceAll("object-array", "category");
			jsonData = jsonData.replaceAll("int", "id");
			jsonData = jsonData.replaceAll("string", "name");

			System.out.println(jsonData);
			JSONObject jObject = new JSONObject(jsonData);
			JSONArray jArray = jObject.getJSONArray("list");
			JSONArray categoryArray = ((JSONObject) jArray.get(0))
					.getJSONArray("category");
			logger.debug(categoryArray.toString());

			return categoryArray.toString();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
	}	
	
	@RequestMapping(value = "/restUtil/categoryTypes", method = RequestMethod.GET, produces = "text/plain")
	public @ResponseBody
	String getCategoryTypes()
			throws Exception {
		try {
			List<CategoryType> categories = categoryTypeMgr.getAllCategories();

			ObjectTypeEnum typeEnum = ObjectTypeEnum.getTypeByName("CategoryType");
			XStream xstream = Utility.createXStream("json");
			Utility.initializeXStream(typeEnum, xstream);
			xstream.processAnnotations(CategoryType.class);
			xstream.autodetectAnnotations(true);

			//TODO: Bad workaround
			String jsonData = xstream.toXML(categories);
			jsonData = jsonData.replaceAll("object-array", "categoryType");
			jsonData = jsonData.replaceAll("int", "id");
			jsonData = jsonData.replaceAll("string", "name");

			JSONObject jObject = new JSONObject(jsonData);
			JSONArray jArray = jObject.getJSONArray("list");
			JSONArray categoryArray = ((JSONObject) jArray.get(0))
					.getJSONArray("categoryType");
			logger.debug(categoryArray.toString());

			return categoryArray.toString();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}
	}	

	@RequestMapping(value = "/CreateRetailer", method = RequestMethod.POST)
	 public String createRetailer(ModelMap map,	
			@RequestParam(value="name") String name,
			@RequestParam(value="address") String address,
			@RequestParam(value="state") Integer state,
			@RequestParam(value="city") Integer city,
			@RequestParam(value="pincode") String pincode,
			@RequestParam(value="ownerName") String ownerName,
			@RequestParam(value="enphone") String enphone,
			@RequestParam(value="enemail") String enemail,
			@RequestParam(value="zone") Integer zone,
			@RequestParam(value="category") List<Integer> category,
			@RequestParam(value="fname") String fname,
			@RequestParam(value="lname") String lname,
			@RequestParam(value="phone") String phone,
			@RequestParam(value="email") String email,
			@RequestParam(value="username") String username,
			@RequestParam(value="gender") String gender,
			@RequestParam(value="passwd") String passwd,
			@RequestParam(value="conpasswd") String conpasswd,
			@RequestParam(value="state") Integer svcAreaRange,
			@RequestParam(value="state") Integer yoe,
			@RequestParam(value="state") Integer mpa,
			@RequestParam(value="state") Integer deliveryTime
		) throws Exception{  
		try {
			
			organizationMgr.createRetailer(name, ownerName, address, state,
					city, pincode, enphone, enemail,
					zone, category, fname, lname,
					phone, email, username, gender,
					passwd, conpasswd, svcAreaRange, yoe, mpa, deliveryTime);
					
			map.put("success", "true");
			map.put("orgName", name);
			
		} catch (Exception e) {
			map.put("success", "false");
			map.put("exception", com.tresfocus.ekart.Utility.stackTraceToString(e));

			Throwable rootCause = e;
			Throwable cause = e;
			while(cause != null && cause.getMessage() != null){
				rootCause = cause;
				cause = cause.getCause();
			}
			
			String msg = rootCause.getMessage();
			if(msg.contains("username_UNIQUE")){
				msg = "Username <B>" + username + "</B> already used. Please select different Username.";
			}
			map.put("errorMsg", msg); 
			
			map.put("name", name);
			map.put("address", address);
			map.put("state", state);
			map.put("city", city);
			map.put("pincode", pincode);
			map.put("enphone", enphone);
			map.put("enemail", enemail);
			map.put("zone", zone);
			map.put("category", category);
			map.put("fname", fname);
			map.put("lname", lname);
			map.put("phone", phone);
			map.put("email", email);
			map.put("username", username);
			map.put("gender", gender);
			
			e.printStackTrace();
		}
		
		return "/signup";
	}
}
