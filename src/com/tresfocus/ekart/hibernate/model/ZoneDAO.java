package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.Zone;

@Transactional
public interface ZoneDAO {
	public List<Zone> getZones();
	public List<Zone> getZonesByCity(Integer cityId);
	public Zone getByKey(Integer id);
	public Zone getZone(String name);
}
