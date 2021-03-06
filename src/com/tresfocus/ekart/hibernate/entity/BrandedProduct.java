package com.tresfocus.ekart.hibernate.entity;

import java.util.Date;

import javax.persistence.Version;

import org.hibernate.annotations.Entity;

import com.thoughtworks.xstream.annotations.XStreamAlias;

// Generated May 3, 2014 1:17:00 PM by Hibernate Tools 3.4.0.CR1

/**
 * BrandedProducts generated by hbm2java
 */
@XStreamAlias("branded_product")
@Entity
public class BrandedProduct implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private Brands brands;
	private Product product;
	private int createdBy;
	private int lastUpdatedBy;
	private Date creationDate;
	private Date lastUpdatedDate;
	@Version
	private int objectVersionNumber;

	public BrandedProduct() {
	}

	public BrandedProduct(Brands brands, Product product, int createdBy,
			int lastUpdatedBy, Date creationDate, Date lastUpdatedDate,
			int objectVersionNumber) {
		this.brands = brands;
		this.product = product;
		this.createdBy = createdBy;
		this.lastUpdatedBy = lastUpdatedBy;
		this.creationDate = creationDate;
		this.lastUpdatedDate = lastUpdatedDate;
		this.objectVersionNumber = objectVersionNumber;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Brands getBrands() {
		return this.brands;
	}

	public void setBrands(Brands brands) {
		this.brands = brands;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
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

}
