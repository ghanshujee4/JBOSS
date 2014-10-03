package com.tresfocus.ekart.hibernate.entity;

// Generated May 10, 2014 2:51:46 AM by Hibernate Tools 4.0.0

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Version;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.annotations.Entity;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamOmitField;

/**
 * Brands generated by hbm2java
 */
@XStreamAlias("brands")
@Entity
public class Brands implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private String image;
	private int createdBy;
	private int lastUpdatedBy;
	private Date creationDate;
	private Date lastUpdatedDate;
	@Version
	private int objectVersionNumber;
	@XStreamOmitField	
	@JsonIgnore
	private Set brandedProducts = new HashSet(0);
	@XStreamOmitField	
	@JsonIgnore
	private Set<RetailerSnapshot> retailerSnapshots = new HashSet<RetailerSnapshot>(0);
	
	public Brands() {
	}

	public Brands(String name, int createdBy, int lastUpdatedBy,
			Date creationDate, Date lastUpdatedDate, int objectVersionNumber) {
		this.name = name;
		this.createdBy = createdBy;
		this.lastUpdatedBy = lastUpdatedBy;
		this.creationDate = creationDate;
		this.lastUpdatedDate = lastUpdatedDate;
		this.objectVersionNumber = objectVersionNumber;
	}

	public Brands(String name, String image, int createdBy, int lastUpdatedBy,
			Date creationDate, Date lastUpdatedDate, int objectVersionNumber,
			Set<BrandedProduct> brandedProducts) {
		this.name = name;
		this.image = image;
		this.createdBy = createdBy;
		this.lastUpdatedBy = lastUpdatedBy;
		this.creationDate = creationDate;
		this.lastUpdatedDate = lastUpdatedDate;
		this.objectVersionNumber = objectVersionNumber;
		this.brandedProducts = brandedProducts;
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

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
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

	public int getObjectVersionNumber() {
		return this.objectVersionNumber;
	}

	public void setObjectVersionNumber(int objectVersionNumber) {
		this.objectVersionNumber = objectVersionNumber;
	}

	public Set getBrandedProducts() {
		return this.brandedProducts;
	}

	public void setBrandedProducts(Set<BrandedProduct> brandedProducts) {
		this.brandedProducts = brandedProducts;
	}

	public Set<RetailerSnapshot> getRetailerSnapshots() {
		return retailerSnapshots;
	}

	public void setRetailerSnapshots(Set<RetailerSnapshot> retailerSnapshots) {
		this.retailerSnapshots = retailerSnapshots;
	}
}