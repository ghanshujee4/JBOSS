package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.Cities;

@Transactional
public interface CitiesDAO {
	public Cities getByKey(Integer id);
	public List<Cities> findByCriteria(Cities cities);
	public List<Cities> getAllCitiesOfState(Integer stateId);
}
