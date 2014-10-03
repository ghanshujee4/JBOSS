package com.tresfocus.ekart.spring.service;

import java.util.List;

import com.tresfocus.ekart.hibernate.entity.Category;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.hibernate.entity.Zone;


public interface CategoryManager {
	public List<Category> getCategories();
	public List<Category> getAllCategories();
	public Category getByKey(Integer id);
}
