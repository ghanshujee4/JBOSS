package com.tresfocus.ekart.spring.service;

import java.util.List;

import com.tresfocus.ekart.hibernate.entity.States;

public interface StatesManager {
	public States getByKey(Integer id);
	public List<States> findByCriteria(States states);
	public List<States> getAllStatesOfCountry(Integer countryId);
}
