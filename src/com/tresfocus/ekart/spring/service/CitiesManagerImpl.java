package com.tresfocus.ekart.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.Cities;
import com.tresfocus.ekart.hibernate.model.CitiesDAO;

@Service
public class CitiesManagerImpl implements CitiesManager{
	@Autowired
	private CitiesDAO citiesDAO;
	
	@Override
	@Transactional
	public Cities getByKey(Integer id) {
		return citiesDAO.getByKey(id);
	}

	@Override
	@Transactional
	public List<Cities> findByCriteria(Cities country) {
		return citiesDAO.findByCriteria(country);
	}
	
	@Override
	@Transactional
	public List<Cities> getAllCitiesOfState(Integer stateId){
		return citiesDAO.getAllCitiesOfState(stateId);
	}

}
