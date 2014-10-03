package com.tresfocus.ekart.spring.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.IConstants;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.hibernate.model.UserDAO;

@Service
public class UserManagerImpl implements UserManager {
	@Autowired
	private UserDAO userDAO;

	@Override
	@Transactional
	public User getByKey(Integer id) {
		return userDAO.getByKey(id);
	}

	@Override
	@Transactional
	public void upsert(User user, User loggedInUser) throws Exception {
		userDAO.upsert(user, loggedInUser);
	}

	@Override
	@Transactional
	public void delete(User user) {
		userDAO.delete(user);
	}

	@Override
	@Transactional
	public List<User> findByCriteria(User user) {
		return userDAO.findByCriteria(user);
	}

	@Override
	@Transactional
	public User getUserByUserName(String userName) {
		return userDAO.getUserByUserName(userName);
	}

	@Override
	@Transactional
	public Object execute(String operation, Object inputObj, User loggedInUser) throws Exception {
		if(IConstants.OPERATION_UPSERT.equalsIgnoreCase(operation)){
			upsert((User)inputObj, loggedInUser);
			return inputObj;
		}else if(IConstants.OPERATION_FIND.equalsIgnoreCase(operation)){
			return findByCriteria((User)inputObj);
		}else if(IConstants.OPERATION_DELETE.equalsIgnoreCase(operation)){
			delete((User)inputObj);
			return null;
		}
		
		return null;	
	}

	@Override
	@Transactional
	public List<User> getRetailers() {
		return userDAO.getRetailers();
	}

	@Override
	@Transactional
	public List<User> getRetailers(int customerId) {
		return userDAO.getRetailers(customerId);
	}

	@Override
	@Transactional
	public User getCustomer(int customerId) {
		return userDAO.getCustomer(customerId);
	}

	@Override
	@Transactional
	public User save(User user) {
		user.setCreatedBy(0);
		user.setCreationDate(new Date());
		user.setLastUpdatedBy(0);
		user.setLastUpdatedDate(new Date());
		user.setObjectVersionNumber(0);
		user.setActive(true);
		userDAO.save(user);
		return user;
	}
}
