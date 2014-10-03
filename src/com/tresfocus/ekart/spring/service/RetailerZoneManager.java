package com.tresfocus.ekart.spring.service;

import com.tresfocus.ekart.hibernate.entity.RetailerZone;
import com.tresfocus.ekart.hibernate.entity.User;

public interface RetailerZoneManager {
	public void upsert(RetailerZone retZone, User loggedInUser) throws Exception;
}
