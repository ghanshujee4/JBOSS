package com.tresfocus.ekart.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.Country;
import com.tresfocus.ekart.hibernate.model.CountryDAO;

@Service
public class CountryManagerImpl implements CountryManager{
	@Autowired
	private CountryDAO countryDAO;
	
	@Override
	@Transactional
	public Country getByKey(Integer id) {
		return countryDAO.getByKey(id);
	}

	@Override
	@Transactional
	public List<Country> findByCriteria(Country country) {
		return countryDAO.findByCriteria(country);
	}
	
	@Override
	@Transactional
	public List<Country> getAllCountries() {
		return countryDAO.getAllCountries();
	}
}
