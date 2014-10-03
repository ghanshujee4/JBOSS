package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;
import com.tresfocus.ekart.hibernate.entity.Address;
import com.tresfocus.ekart.hibernate.entity.User;

@Transactional
public interface AddressDAO {
	@Transactional(readOnly=true)
	public Address getByKey(Integer id);
	@Transactional(readOnly=true)
	public List<Address> getAddressesByUserId(int userId);
	public Address upsert(Address address, User loggedInUser) throws Exception;
	public void delete(Address address);
	@Transactional(readOnly=true)
	public List<Address> findByCriteria(Address address);
	public Address save(Address address);
}
