package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.User;

@Transactional
public interface UserDAO {
	@Transactional(readOnly=true)
	public User getByKey(Integer id);
	public User upsert(User user, User loggedInUser) throws Exception;
	public void delete(User user);
	@Transactional(readOnly=true)
	public List<User> findByCriteria(User user);
	public User getUserByUserName(String userName);
	public List<User> getRetailers();
	public List<User> getRetailers(int customerId);
	public User getCustomer(int customerId);
	public User save(User user);
}
