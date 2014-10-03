package com.tresfocus.ekart.spring.service;

import java.util.List;

import com.tresfocus.ekart.hibernate.entity.Address;
import com.tresfocus.ekart.hibernate.entity.User;

public interface AddressManager {
	public Address getByKey(Integer id);
	public List<Address> getAddressesByUserId(int userId);
	public void upsert(Address address, User loggedInUser) throws Exception;
	public void delete(Address address);
	public List<Address> findByCriteria(Address address);
	public Object execute(String operation, Object inputObj, User loggedInUser) throws Exception;
	public Address save(Address address);
}
