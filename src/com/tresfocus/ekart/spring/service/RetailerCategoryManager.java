package com.tresfocus.ekart.spring.service;

import com.tresfocus.ekart.hibernate.entity.RetailerCategory;
import com.tresfocus.ekart.hibernate.entity.User;

public interface RetailerCategoryManager {
	public void upsert(RetailerCategory retCat, User loggedInUser) throws Exception;
}
