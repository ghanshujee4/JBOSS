package com.tresfocus.ekart.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.States;
import com.tresfocus.ekart.hibernate.model.StatesDAO;

@Service
public class StatesManagerImpl implements StatesManager{
	@Autowired
	private StatesDAO statesDAO;
	
	@Override
	@Transactional
	public States getByKey(Integer id) {
		return statesDAO.getByKey(id);
	}

	@Override
	@Transactional
	public List<States> findByCriteria(States states) {
		return statesDAO.findByCriteria(states);
	}
	
	@Override
	@Transactional
	public List<States> getAllStatesOfCountry(Integer countryId){
		return statesDAO.getAllStatesOfCountry(countryId);
	}

}
