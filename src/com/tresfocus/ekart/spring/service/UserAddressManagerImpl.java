package com.tresfocus.ekart.spring.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.IConstants;
import com.tresfocus.ekart.hibernate.entity.Address;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.hibernate.entity.UserAddress;
import com.tresfocus.ekart.hibernate.model.UserAddressDAO;
import com.tresfocus.ekart.web.ui.beans.UserAddressBean;

@Service
public class UserAddressManagerImpl implements UserAddressManager {
	@Autowired
	private UserAddressDAO userAddressDAO;

	@Override
	@Transactional
	public UserAddress getByKey(Integer id) {
		return userAddressDAO.getByKey(id);
	}

	@Override
	@Transactional
	public void upsert(UserAddress userAddress, User loggedInUser) throws Exception {
		userAddressDAO.upsert(userAddress, loggedInUser);
	}

	@Override
	@Transactional
	public void delete(UserAddress userAddress) {
		userAddressDAO.delete(userAddress);
	}

	@Override
	@Transactional
	public List<UserAddress> findByCriteria(UserAddress userAddress) {
		return userAddressDAO.findByCriteria(userAddress);
	}

	@Override
	@Transactional
	public Address getAddressByUserId(Integer userId) { 
		return userAddressDAO.getAddressByUserId(userId);
	}

	@Override
	@Transactional
	public Object execute(String operation, Object inputObj, User loggedInUser) throws Exception {
		if(IConstants.OPERATION_UPSERT.equalsIgnoreCase(operation)){
			upsert((UserAddress)inputObj, loggedInUser);
			return inputObj;
		}else if(IConstants.OPERATION_FIND.equalsIgnoreCase(operation)){
			return findByCriteria((UserAddress)inputObj);
		}else if(IConstants.OPERATION_DELETE.equalsIgnoreCase(operation)){
			delete((UserAddress)inputObj);
			return null;
		}
		
		return null;	
	}

	@Override
	@Transactional
	public List<UserAddressBean> findByCriteria(Integer userId) {
		List<UserAddressBean> userAddressBeans = new ArrayList<UserAddressBean>();
		List<UserAddress> userAddresses = userAddressDAO.getUserAddressByUserId(userId);
		for(UserAddress UserAddress:userAddresses){
			userAddressBeans.add(new UserAddressBean(UserAddress));
		}
		return userAddressBeans;
	}

	@Override
	@Transactional
	public UserAddress save(UserAddress userAddress) {
		/*userAddress.setCreatedBy(0);
		userAddress.setCreationDate(new Date());
		userAddress.setLastUpdatedBy(0);
		userAddress.setLastUpdatedDate(new Date());
		userAddress.setPrimary(true);
		userAddress.setObjectVersionNumber(0);*/
		userAddressDAO.save(userAddress);
		return userAddress;
	}
}
