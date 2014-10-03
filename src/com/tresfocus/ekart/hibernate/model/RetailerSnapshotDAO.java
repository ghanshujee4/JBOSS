package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.Organization;
import com.tresfocus.ekart.hibernate.entity.RetailerSnapshot;
import com.tresfocus.ekart.hibernate.entity.User;

@Transactional
public interface RetailerSnapshotDAO {
	public RetailerSnapshot getByKey(Integer id);
	public RetailerSnapshot upsert(RetailerSnapshot retailerSnapshot, User loggedInUser) throws Exception;
	public void delete(RetailerSnapshot retailerSnapshot);
	public List<RetailerSnapshot> findByCriteria(RetailerSnapshot retailerSnapshot, User loggedInUser);
	public void upsert(RetailerSnapshot snapshot, User loggedInUser, Organization owningOrg) throws Exception;
	public List<RetailerSnapshot> findByCriteria(Integer orgaId, Integer categoryName);
}
