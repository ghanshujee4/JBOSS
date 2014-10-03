package com.tresfocus.ekart.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.Zone;
import com.tresfocus.ekart.hibernate.model.ZoneDAO;

@Service
public class ZoneManagerImpl implements ZoneManager{
	@Autowired
	private ZoneDAO zoneDAO;
	 
	@Override
	@Transactional
	public List<Zone> getZones() {
		return zoneDAO.getZones();
	}
	
	@Override
	@Transactional
	public List<String> getZoneList(String zone,List<Zone> zones) {
		String keyword = null;
        zone = zone.toLowerCase();
        List<String> matched = new ArrayList<String>();
        for(int i=0; i < zones.size(); i++) {
        	keyword = zones.get(i).getName().toLowerCase();
            if(keyword.startsWith(zone)) {
               matched.add(zones.get(i).getName());
            }
        }
        return matched;
    }
	
	@Override
	@Transactional
	public List<Zone> getZonesByCity(Integer cityId){
		return zoneDAO.getZonesByCity(cityId);
	}
	
	@Override
	@Transactional
	public Zone getByKey(Integer id){
		return zoneDAO.getByKey(id);
	}

}
