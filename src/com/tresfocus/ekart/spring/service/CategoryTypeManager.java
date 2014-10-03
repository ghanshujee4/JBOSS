package com.tresfocus.ekart.spring.service;

import java.util.List;

import com.tresfocus.ekart.hibernate.entity.CategoryType;


public interface CategoryTypeManager {
	public List<CategoryType> getCategories();
	public List<CategoryType> getAllCategories();
	public CategoryType getByKey(Integer id);
}
