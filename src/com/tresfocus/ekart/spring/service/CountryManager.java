package com.tresfocus.ekart.spring.service;

import java.util.List;

import com.tresfocus.ekart.hibernate.entity.Country;

public interface CountryManager {
	public Country getByKey(Integer id);
	public List<Country> findByCriteria(Country country);
	public List<Country> getAllCountries();
}
