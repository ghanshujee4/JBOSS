package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.States;

@Transactional
public interface StatesDAO {
	public States getByKey(Integer id);
	public List<States> findByCriteria(States states);
	public List<States> getAllStatesOfCountry(Integer countryId);
}
