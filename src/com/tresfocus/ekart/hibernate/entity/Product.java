package com.tresfocus.ekart.hibernate.entity;

// Generated May 10, 2014 2:51:46 AM by Hibernate Tools 4.0.0

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Version;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamOmitField;

/**
 * Product generated by hbm2java
 */
@XStreamAlias("product")
@Entity
public class Product implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1399060577555793322L;
	private int id;
	@XStreamOmitField	
	@JsonIgnore
	private Category category;
	private String name;
	private String uniqueName;
	private String barcode;
	private String searchCode;
	private int active = 1;
	private String manufacturer;
	private String gender;
	private int age;
	private String image;
	private Date creationDate;
	private Date lastUpdatedDate;
	private int createdBy;
	private int lastUpdatedBy;
	@Version
	private int objectVersionNumber;
	@XStreamOmitField	
	@JsonIgnore
	private Set<OrderLines> orderLineses = new HashSet<OrderLines>(0);
	@XStreamOmitField	
	//@JsonIgnore	
	private Set<RetailerSnapshot> retailerSnapshots = new HashSet<RetailerSnapshot>(0);
	@XStreamOmitField	
	@JsonIgnore
	private Set brandedProducts = new HashSet(0);

	public Product() {
	}

	public Product(Category category, String name, String uniqueName,
			int active, Date creationDate, Date lastUpdatedDate, int createdBy,
			int lastUpdatedBy,int objectVersionNumber) {
		this.category = category;
		this.name = name;
		this.uniqueName = uniqueName;
		this.active = active;
		this.creationDate = creationDate;
		this.lastUpdatedDate = lastUpdatedDate;
		this.createdBy = createdBy;
		this.lastUpdatedBy = lastUpdatedBy;
		this.objectVersionNumber = objectVersionNumber;
	}

	public Product(Category category, String name, String uniqueName,
			String barcode, String searchCode, int active, String image,
			Date creationDate, Date lastUpdatedDate, int createdBy,
			int lastUpdatedBy, int objectVersionNumber, Set<OrderLines> orderLineses,
			Set<RetailerSnapshot> retailerSnapshots) {
		this.category = category;
		this.name = name;
		this.uniqueName = uniqueName;
		this.barcode = barcode;
		this.searchCode = searchCode;
		this.active = active;
		this.image = image;
		this.creationDate = creationDate;
		this.lastUpdatedDate = lastUpdatedDate;
		this.createdBy = createdBy;
		this.lastUpdatedBy = lastUpdatedBy;
		this.objectVersionNumber = objectVersionNumber;
		this.orderLineses = orderLineses;
		this.retailerSnapshots = retailerSnapshots;
	}

	public Product( Category category, String name,
			       String uniqueName, String barcode, String searchCode, int active) {
		this.category = category;
		this.name = name;
		this.uniqueName = uniqueName;
		this.barcode = barcode;
		this.searchCode = searchCode;
		this.active = active;
	}

	public Product(String name, String manufacturer, Category category, String gender, Integer age) {
		this.name = name;
		this.manufacturer = manufacturer;
		this.category = category;
		this.gender = gender;
		
		if(age != null)
			this.age = age;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getObjectVersionNumber() {
		return this.objectVersionNumber;
	}

	public void setObjectVersionNumber(int objectVersionNumber) {
		this.objectVersionNumber = objectVersionNumber;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUniqueName() {
		return this.uniqueName;
	}

	public void setUniqueName(String uniqueName) {
		this.uniqueName = uniqueName;
	}

	public String getBarcode() {
		return this.barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getSearchCode() {
		return this.searchCode;
	}

	public void setSearchCode(String searchCode) {
		this.searchCode = searchCode;
	}

	public int getActive() {
		return this.active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
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

	public Set<OrderLines> getOrderLineses() {
		return this.orderLineses;
	}

	public void setOrderLineses(Set<OrderLines> orderLineses) {
		this.orderLineses = orderLineses;
	}

	public Set getBrandedProducts() {
		return this.brandedProducts;
	}

	public void setBrandedProducts(Set brandedProducts) {
		this.brandedProducts = brandedProducts;
	}

	public Set<RetailerSnapshot> getRetailerSnapshots() {
		return this.retailerSnapshots;
	}

	public void setRetailerSnapshots(Set<RetailerSnapshot> retailerSnapshots) {
		this.retailerSnapshots = retailerSnapshots;
	}
	
	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Product [id=");
		builder.append(id);
		builder.append(", category=");
		builder.append(category);
		builder.append(", name=");
		builder.append(name);
		builder.append(", uniqueName=");
		builder.append(uniqueName);
		builder.append(", barcode=");
		builder.append(barcode);
		builder.append(", searchCode=");
		builder.append(searchCode);
		builder.append(", active=");
		builder.append(active);
		builder.append(", creationDate=");
		builder.append(creationDate);
		builder.append(", lastUpdatedDate=");
		builder.append(lastUpdatedDate);
		builder.append(", createdBy=");
		builder.append(createdBy);
		builder.append(", lastUpdatedBy=");
		builder.append(lastUpdatedBy);
		builder.append(", objectVersionNumber=");
		builder.append(objectVersionNumber);
		builder.append("]");
		return builder.toString();
	}

}
