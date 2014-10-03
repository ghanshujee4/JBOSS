package com.tresfocus.ekart.hibernate.model;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.tresfocus.ekart.hibernate.entity.MeasuringUnit;
import com.tresfocus.ekart.hibernate.entity.User;

@Transactional
public interface MeasuringUnitDAO {
	public MeasuringUnit getByKey(Integer id);
	public MeasuringUnit upsert(MeasuringUnit measuringUnit, User loggedInUser) throws Exception;
	public void delete(MeasuringUnit measuringUnit);
	public List<MeasuringUnit> findByCriteria(MeasuringUnit measuringUnit);
}
