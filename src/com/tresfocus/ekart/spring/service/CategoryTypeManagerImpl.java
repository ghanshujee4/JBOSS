package com.tresfocus.ekart.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.CategoryType;
import com.tresfocus.ekart.hibernate.model.CategoryDAO;
import com.tresfocus.ekart.hibernate.model.CategoryTypeDAO;

@Service
public class CategoryTypeManagerImpl implements CategoryTypeManager{
	@Autowired
	private CategoryTypeDAO catTypeDAO;
	 
	@Override
	@Transactional
	public List<CategoryType> getCategories() {
		return catTypeDAO.getCategories();
	}
	@Override
	@Transactional
	public List<CategoryType> getAllCategories(){
		return catTypeDAO.getAllCategories();
	}
	
	@Override
	@Transactional
	public CategoryType getByKey(Integer id){
		return catTypeDAO.getByKey(id);
	}
}
