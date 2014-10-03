package com.tresfocus.ekart.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.IConstants;
import com.tresfocus.ekart.crypt.BCrypt;
import com.tresfocus.ekart.hibernate.entity.Address;
import com.tresfocus.ekart.hibernate.entity.Category;
import com.tresfocus.ekart.hibernate.entity.Cities;
import com.tresfocus.ekart.hibernate.entity.Country;
import com.tresfocus.ekart.hibernate.entity.Organization;
import com.tresfocus.ekart.hibernate.entity.RetailerCategory;
import com.tresfocus.ekart.hibernate.entity.RetailerZone;
import com.tresfocus.ekart.hibernate.entity.Roles;
import com.tresfocus.ekart.hibernate.entity.States;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.hibernate.entity.UserAddress;
import com.tresfocus.ekart.hibernate.entity.UserRole;
import com.tresfocus.ekart.hibernate.entity.Zone;
import com.tresfocus.ekart.hibernate.model.AddressDAO;
import com.tresfocus.ekart.hibernate.model.CategoryDAO;
import com.tresfocus.ekart.hibernate.model.CitiesDAO;
import com.tresfocus.ekart.hibernate.model.CountryDAO;
import com.tresfocus.ekart.hibernate.model.OrganizationDAO;
import com.tresfocus.ekart.hibernate.model.RetailerCategoryDAO;
import com.tresfocus.ekart.hibernate.model.RetailerZoneDAO;
import com.tresfocus.ekart.hibernate.model.RolesDAO;
import com.tresfocus.ekart.hibernate.model.StatesDAO;
import com.tresfocus.ekart.hibernate.model.UserAddressDAO;
import com.tresfocus.ekart.hibernate.model.UserDAO;
import com.tresfocus.ekart.hibernate.model.UserRoleDAO;
import com.tresfocus.ekart.hibernate.model.ZoneDAO;

@Service
public class OrganizationManagerImpl implements OrganizationManager{
	@Autowired
	private OrganizationDAO organizationDAO;
	@Autowired
	private AddressDAO addressDAO;
	@Autowired
	private CountryDAO countryDAO;
	@Autowired
	private StatesDAO statesDAO;
	@Autowired
	private CitiesDAO citiesDAO;
	@Autowired
	private ZoneDAO zoneDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private RetailerZoneDAO retZoneDAO;
	@Autowired
	private RetailerCategoryDAO retCategoryDAO;
	@Autowired
	private CategoryDAO categoryDAO;
	@Autowired
	private RolesDAO rolesDAO;
	@Autowired
	private UserRoleDAO usrRolesDAO;
	@Autowired
	private UserAddressDAO usrAddressDAO;
	
	@Override
	@Transactional
	public Organization getByKey(Integer id) {
		return organizationDAO.getByKey(id);
	}

	@Override
	@Transactional
	public List<Organization> findByCriteria(Organization organization) {
		return organizationDAO.findByCriteria(organization);
	}
	
	@Override
	@Transactional
	public void upsert(Organization organization, User loggedInUser) throws Exception{
		organizationDAO.upsert(organization, loggedInUser); 
	}
	
	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW)
	 public void createRetailer(String name, String ownerName,
				String address, Integer state,
				Integer city, String pincode,
				String enphone, String enemail,
				Integer zone, List<Integer> category,
				String fname, String lname,
				String phone, String email,
				String username, String gender,
				String passwd, String conpasswd, Integer svcAreaRange,
				Integer yoe, Integer mpa, Integer delTime
				) throws Exception{  
		User adminUser = userDAO.getUserByUserName(IConstants.ADMIN_USER);
		Country countryObj = countryDAO.getByKey(IConstants.COUNTRY_INIDA);
		Cities cityObj = citiesDAO.getByKey(city);
		States stateObj = statesDAO.getByKey(state);
		Zone zoneObj = zoneDAO.getByKey(zone);
		Object[] rolesData = rolesDAO.getRoleByName(IConstants.ROLE_RETAILER);
		Roles roleObj = new Roles((Integer)rolesData[0]);
		
		Organization org = new Organization();
		Address addressObj = new Address();
		addressObj.setActive(true);
		addressObj.setAddress1(address);
		addressObj.setFirstName(name);
		addressObj.setLastName(name);
		addressObj.setPhone(enphone);
		addressObj.setEmail(enemail);
		addressObj.setCities(cityObj);
		addressObj.setStates(stateObj);		
		addressObj.setCountry(countryObj);		
		addressObj.setPostalcode(pincode);
		addressObj = addressDAO.upsert(addressObj, adminUser);
		
		org.setAddress(addressObj);
		org.setName(name);
		org.setOwnerName(ownerName);
		org.setYearOfEstablishment(yoe);
		org.setMinPurchaseAmount(mpa);
		org.setDefaultDeliveryTime(delTime);
		org.setOrgType(IConstants.RETAILER);	
		org.setServiceArea(svcAreaRange);		
		org = organizationDAO.upsert(org, adminUser);
		
		User newUser = new User();
		newUser.setActive(true);
		newUser.setEmail(email);
		newUser.setFname(fname);
		newUser.setGender(gender);
		newUser.setLname(lname);
		newUser.setPhone(phone);
		newUser.setUsername(username);
		newUser.setOrganization(org);
		newUser.setPassword(BCrypt.hashpw(passwd, BCrypt.gensalt()));
		newUser = userDAO.upsert(newUser, adminUser);
		
		UserRole usrRoleObj = new UserRole();
		usrRoleObj.setUser(newUser);
		usrRoleObj.setRoles(roleObj);
		usrRoleObj = usrRolesDAO.upsert(usrRoleObj, adminUser);
		
		UserAddress usrAddressObj = new UserAddress();
		usrAddressObj.setAddress(addressObj);
		usrAddressObj.setPrimary(true);
		usrAddressObj.setUser(newUser);
		usrAddressObj = usrAddressDAO.upsert(usrAddressObj, adminUser);

		RetailerZone retZone = new RetailerZone();
		retZone.setOrganization(org);
		retZone.setZone(zoneObj);
		retZone = retZoneDAO.upsert(retZone, adminUser);
		
		for(Integer cat : category){
			Category catObj = categoryDAO.getByKey(cat);
			RetailerCategory retCategory = new RetailerCategory();
			retCategory.setOrganization(org);
			retCategory.setZone(zoneObj);
			retCategory.setCategory(catObj);
			
			retCategory = retCategoryDAO.upsert(retCategory, adminUser);
		}

	}
	@Override
	@Transactional
	public Organization save(Organization organization) {
		// TODO Auto-generated method stub
		return organizationDAO.save(organization);
	}

}
