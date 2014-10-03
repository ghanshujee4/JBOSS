package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.Organization;
import com.tresfocus.ekart.hibernate.entity.User;

@Transactional
public interface OrganizationDAO {
	public Organization getByKey(Integer id);
	public Organization getByName(String name);
	public Organization upsert(Organization organization, User loggedInUser) throws Exception;
	public void delete(Organization organization);
	public List<Organization> findByCriteria(Organization organization);
	public Organization getById(Integer id);
	public Organization save(Organization organization);
}
