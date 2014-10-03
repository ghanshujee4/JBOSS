package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.Organization;
import com.tresfocus.ekart.hibernate.entity.Product;
import com.tresfocus.ekart.hibernate.entity.RetailerCategory;
import com.tresfocus.ekart.hibernate.entity.RetailerZone;
import com.tresfocus.ekart.hibernate.entity.User;

@Transactional
public interface RetailerZoneDAO {
	public RetailerZone getByKey(Integer id);
	public RetailerZone upsert(RetailerZone retZone, User loggedInUser) throws Exception;
	public void delete(RetailerZone retZone);
	public List<RetailerZone> findByCriteria(RetailerZone retZone);
}
