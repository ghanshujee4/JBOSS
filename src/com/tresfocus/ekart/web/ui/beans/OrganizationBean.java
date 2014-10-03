package com.tresfocus.ekart.web.ui.beans;

import java.util.Date;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.tresfocus.ekart.hibernate.entity.Address;
import com.tresfocus.ekart.hibernate.entity.Organization;

public class OrganizationBean {
	private int id;
	@JsonIgnore
	private Address address;
	private String name;
	private String orgType;
	private int createdBy;
	private int lastUpdatedBy;
	private Date creationDate;
	private Date lastUpdatedDate;
	private int objectVersionNumber;
	public OrganizationBean(Organization organization) {
		//this.address = organization.getAddress();
		this.id = organization.getId();
		this.name = organization.getName();
		this.orgType = organization.getOrgType();
		this.createdBy = organization.getCreatedBy();
		this.lastUpdatedBy = organization.getLastUpdatedBy();
		this.creationDate = organization.getCreationDate();
		this.lastUpdatedDate = organization.getLastUpdatedDate();
		this.objectVersionNumber = organization.getObjectVersionNumber();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOrgType() {
		return orgType;
	}
	public void setOrgType(String orgType) {
		this.orgType = orgType;
	}
	public int getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}
	public int getLastUpdatedBy() {
		return lastUpdatedBy;
	}
	public void setLastUpdatedBy(int lastUpdatedBy) {
		this.lastUpdatedBy = lastUpdatedBy;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	public Date getLastUpdatedDate() {
		return lastUpdatedDate;
	}
	public void setLastUpdatedDate(Date lastUpdatedDate) {
		this.lastUpdatedDate = lastUpdatedDate;
	}
	public int getObjectVersionNumber() {
		return objectVersionNumber;
	}
	public void setObjectVersionNumber(int objectVersionNumber) {
		this.objectVersionNumber = objectVersionNumber;
	}
	
}
