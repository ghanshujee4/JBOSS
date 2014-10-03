package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.Country;
import com.tresfocus.ekart.hibernate.entity.User;

@Transactional
public interface CountryDAO {
	public Country getByKey(Integer id);
	public List<Country> findByCriteria(Country country);
	List<Country> getAllCountries();
}
