package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.Organization;

@Transactional
public interface RetailerDAO {
	public List<Organization> getCategoryRetailers(String categoryName,String zoneName);
}
