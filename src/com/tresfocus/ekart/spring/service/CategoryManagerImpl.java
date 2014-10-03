package com.tresfocus.ekart.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.Category;
import com.tresfocus.ekart.hibernate.model.CategoryDAO;

@Service
public class CategoryManagerImpl implements CategoryManager{
	@Autowired
	private CategoryDAO categoryDAO;
	 
	@Override
	@Transactional
	public List<Category> getCategories() {
		return categoryDAO.getCategories();
	}
	@Override
	@Transactional
	public List<Category> getAllCategories(){
		return categoryDAO.getAllCategories();
	}
	
	@Override
	@Transactional
	public Category getByKey(Integer id){
		return categoryDAO.getByKey(id);
	}
}
