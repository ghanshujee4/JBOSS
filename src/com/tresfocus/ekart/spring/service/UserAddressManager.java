package com.tresfocus.ekart.spring.service;

import java.util.List;

import com.tresfocus.ekart.hibernate.entity.Address;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.hibernate.entity.UserAddress;
import com.tresfocus.ekart.web.ui.beans.UserAddressBean;

public interface UserAddressManager {
	public UserAddress getByKey(Integer id);
	public void upsert(UserAddress userAddress, User loggedInUser) throws Exception;
	public void delete(UserAddress userAddress);
	public List<UserAddress> findByCriteria(UserAddress userAddress);
	public Object execute(String operation, Object inputObj, User loggedInUser) throws Exception;
	public Address getAddressByUserId(Integer userId);
	public List<UserAddressBean> findByCriteria(Integer userId);
	public UserAddress save(UserAddress userAddress);
}
