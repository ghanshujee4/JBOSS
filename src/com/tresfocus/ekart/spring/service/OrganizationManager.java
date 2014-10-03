package com.tresfocus.ekart.spring.service;

import java.util.List;

import com.tresfocus.ekart.hibernate.entity.Organization;
import com.tresfocus.ekart.hibernate.entity.User;

public interface OrganizationManager {
	public Organization getByKey(Integer id);
	public List<Organization> findByCriteria(Organization organization);
	public void upsert(Organization organization, User loggedInUser) throws Exception;
	public void createRetailer(String name, String ownerName, String address, Integer state,
			Integer city, String pincode, String enphone, String enemail,
			Integer zone, List<Integer> category, String fname, String lname,
			String phone, String email, String username, String gender,
			String passwd, String conpasswd, Integer svcAreaRange, Integer yoe, Integer mpa, Integer delTime) throws Exception;
	public Organization save(Organization organization);
}
