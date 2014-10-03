package com.tresfocus.ekart.spring.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.IConstants;
import com.tresfocus.ekart.hibernate.entity.Address;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.hibernate.model.AddressDAO;
import com.tresfocus.ekart.hibernate.model.CountryDAO;
import com.tresfocus.ekart.hibernate.model.StatesDAO;

@Service
public class AddressManagerImpl implements AddressManager{
	@Autowired
	private AddressDAO addressDAO;
	@Autowired
	private CountryDAO countryDAO;
	@Autowired
	private StatesDAO statesDAO;
	
	@Override
	@Transactional
	public Address getByKey(Integer id) {
		return addressDAO.getByKey(id);
	}

	@Override
	@Transactional
	public List<Address> getAddressesByUserId(int userId) {
		return addressDAO.getAddressesByUserId(userId);
	}

	@Override
	@Transactional
	public void upsert(Address address, User loggedInUser) throws Exception{
		addressDAO.upsert(address, loggedInUser);
	}

	@Override
	@Transactional
	public void delete(Address address) {		
		addressDAO.delete(address);
	}

	@Override
	@Transactional
	public List<Address> findByCriteria(Address address) {
		return addressDAO.findByCriteria(address);
	}

	@Override
	@Transactional
	public Object execute(String operation, Object inputObj, User loggedInUser) throws Exception {
		if(IConstants.OPERATION_UPSERT.equalsIgnoreCase(operation)){
			upsert((Address)inputObj, loggedInUser);
			return inputObj;
		}else if(IConstants.OPERATION_FIND.equalsIgnoreCase(operation)){
			return findByCriteria((Address)inputObj);
		}else if(IConstants.OPERATION_DELETE.equalsIgnoreCase(operation)){
			delete((Address)inputObj);
			return null;
		}
		
		return null;	
	}

	@Override
	@Transactional
	public Address save(Address address) {
		address.setCountry(countryDAO.getByKey(99));
		address.setActive(true);
		address.setStates(statesDAO.getByKey(1));
		address.setObjectVersionNumber(1);
		address.setCreationDate(new Date());
		address.setLastUpdatedDate(new Date());
		address.setLastUpdatedBy(0);
		address.setCreatedBy(0);
		addressDAO.save(address);
		return address;
	}
}
