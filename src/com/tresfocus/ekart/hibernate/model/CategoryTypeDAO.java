package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.CategoryType;
import com.tresfocus.ekart.hibernate.entity.User;

@Transactional
public interface CategoryTypeDAO {
	public CategoryType getByKey(Integer id);
	public CategoryType upsert(CategoryType category, User loggedInUser) throws Exception;
	public void delete(CategoryType category);
	public List<CategoryType> findByCriteria(CategoryType category);
	public CategoryType getCategory(String name);
	public CategoryType getCategoryByType(String name);
	public List<CategoryType> getCategories();
	public List<CategoryType> getAllCategories();
}
