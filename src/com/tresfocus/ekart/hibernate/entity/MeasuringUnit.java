package com.tresfocus.ekart.hibernate.entity;

// Generated May 10, 2014 2:51:46 AM by Hibernate Tools 4.0.0

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Version;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamOmitField;

/**
 * MeasuringUnit generated by hbm2java
 */
@XStreamAlias("measuring_unit")
@Entity
public class MeasuringUnit implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private Date creationDate;
	private Date lastUpdatedDate;
	private int createdBy;
	private int lastUpdatedBy;
	@Version
	private int objectVersionNumber;

	public MeasuringUnit() {
	}

	public MeasuringUnit(String name, Date creationDate, Date lastUpdatedDate,
			int createdBy, int lastUpdatedBy, int objectVersionNumber) {
		this.name = name;
		this.creationDate = creationDate;
		this.lastUpdatedDate = lastUpdatedDate;
		this.createdBy = createdBy;
		this.lastUpdatedBy = lastUpdatedBy;
		this.objectVersionNumber = objectVersionNumber;
	}

	public MeasuringUnit(String name, Date creationDate, Date lastUpdatedDate,
			int createdBy, int lastUpdatedBy, int objectVersionNumber,
			Set retailerSnapshots) {
		this.name = name;
		this.creationDate = creationDate;
		this.lastUpdatedDate = lastUpdatedDate;
		this.createdBy = createdBy;
		this.lastUpdatedBy = lastUpdatedBy;
		this.objectVersionNumber = objectVersionNumber;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCreationDate() {
		return this.creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public Date getLastUpdatedDate() {
		return this.lastUpdatedDate;
	}

	public void setLastUpdatedDate(Date lastUpdatedDate) {
		this.lastUpdatedDate = lastUpdatedDate;
	}

	public int getCreatedBy() {
		return this.createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public int getLastUpdatedBy() {
		return this.lastUpdatedBy;
	}

	public void setLastUpdatedBy(int lastUpdatedBy) {
		this.lastUpdatedBy = lastUpdatedBy;
	}

	public int getObjectVersionNumber() {
		return this.objectVersionNumber;
	}

	public void setObjectVersionNumber(int objectVersionNumber) {
		this.objectVersionNumber = objectVersionNumber;
	}
}
