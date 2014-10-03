package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.Brands;
import com.tresfocus.ekart.hibernate.entity.User;

@Transactional
public interface BrandsDAO {
	public Brands getByKey(Integer id);
	public Brands upsert(Brands brand, User loggedInUser) throws Exception;
	public void delete(Brands brand);
	public List<Brands> findByCriteria(Brands brand);
	public Brands getCategory(String name);
	public Brands getCategoryByType(String name);
	public List<Brands> getCategories();
	public List<Brands> getAllCategories();
}
