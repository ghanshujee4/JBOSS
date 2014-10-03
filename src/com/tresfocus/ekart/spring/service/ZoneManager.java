package com.tresfocus.ekart.spring.service;

import java.util.List;

import com.tresfocus.ekart.hibernate.entity.Zone;


public interface ZoneManager {
	public List<Zone> getZones();
	public List<String> getZoneList(String zone, List<Zone> zones);
	public List<Zone> getZonesByCity(Integer cityId);
	public Zone getByKey(Integer id);
}
