package com.tresfocus.ekart.spring.service;

import java.util.List;

import com.tresfocus.ekart.hibernate.entity.User;

public interface UserManager {
	public User getByKey(Integer id);
	public void upsert(User user, User loggedInUser) throws Exception;
	public void delete(User user);
	public List<User> findByCriteria(User user);
	public User getUserByUserName(String userName);
	public Object execute(String operation, Object inputObj, User loggedInUser) throws Exception;
	public List<User> getRetailers();
	public List<User> getRetailers(int customerId);
	public User getCustomer(int customerId);
	public User save(User user);
}
