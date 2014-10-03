package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.Category;
import com.tresfocus.ekart.hibernate.entity.CategoryType;
import com.tresfocus.ekart.hibernate.entity.User;

@Transactional
public interface CategoryDAO {
	public Category getByKey(Integer id);
	public Category upsert(Category category, User loggedInUser) throws Exception;
	public void delete(Category category);
	public List<Category> findByCriteria(Category category);
	public Category getCategory(String name);
	public Category getCategoryByType(String name);
	public List<Category> getCategories();
	public List<Category> getAllCategories();
}
