package com.tresfocus.ekart.spring.service;

import java.util.List;

import com.tresfocus.ekart.hibernate.entity.Cities;

public interface CitiesManager {
	public Cities getByKey(Integer id);
	public List<Cities> findByCriteria(Cities cities);
	public List<Cities> getAllCitiesOfState(Integer stateId);
}
