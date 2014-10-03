package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.Address;
import com.tresfocus.ekart.hibernate.entity.UserAddress;
import com.tresfocus.ekart.hibernate.entity.User;

@Transactional
public interface UserAddressDAO {
	public UserAddress getByKey(Integer id);
	public UserAddress upsert(UserAddress userAddress, User loggedInUser) throws Exception;
	public void delete(UserAddress userAddress);
	public List<UserAddress> findByCriteria(UserAddress userAddress);
	public Address getAddressByUserId(Integer userId);
	public List<UserAddress> getUserAddressByUserId(Integer userId);
	public UserAddress save(UserAddress userAddress);
}
