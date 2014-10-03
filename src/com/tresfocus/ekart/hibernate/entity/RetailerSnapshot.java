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
 * RetailerSnapshot generated by hbm2java
 */
@XStreamAlias("retailer_snapshot")
@Entity
public class RetailerSnapshot implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	@JsonIgnore
	private Product product;
	@XStreamAlias("retailer")
	@JsonIgnore
	private Organization organization;
	private Brands brand;
	private float salePrice;
	private float mrp;
	private float bundlePrice;
	private int quantity;
	private float newPrice;
	private String packSize;
	private String composition;
	private Date creationDate;
	private Date lastUpdatedDate;
	private int createdBy;
	private int lastUpdatedBy;
	private float discount;
	private float offer;

	@Version
	private int objectVersionNumber;
	
	public RetailerSnapshot() {
	}

	public RetailerSnapshot(Product product, Organization organization, Brands brand,
			float salePrice, float mrp,
			Date creationDate, Date lastUpdatedDate, int createdBy,
			int lastUpdatedBy,int objectVersionNumber) {
		this.product = product;
		this.brand = brand;
		this.organization = organization;
		this.salePrice = salePrice;
		this.mrp = mrp;
		this.creationDate = creationDate;
		this.lastUpdatedDate = lastUpdatedDate;
		this.createdBy = createdBy;
		this.lastUpdatedBy = lastUpdatedBy;
		this.objectVersionNumber = objectVersionNumber;
	}

	public RetailerSnapshot(Product product, Organization organization,
			float salePrice, Float purchasedPrice,
			Float salesTax, float mrp, Float purchasedTaxPercent,
			Date creationDate, Date lastUpdatedDate, int createdBy,
			int lastUpdatedBy, int objectVersionNumber) {
		this.product = product;
		this.organization = organization;
		this.salePrice = salePrice;
		this.mrp = mrp;
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

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Organization getOrganization() {
		return this.organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}
	
	public float getSalePrice() {
		return this.salePrice;
	}

	public void setSalePrice(float salePrice) {
		this.salePrice = salePrice;
	}

	public float getMrp() {
		return this.mrp;
	}

	public void setMrp(float mrp) {
		this.mrp = mrp;
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

	public float getBundlePrice() {
		return bundlePrice;
	}

	public void setBundlePrice(float bundlePrice) {
		this.bundlePrice = bundlePrice;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getNewPrice() {
		return newPrice;
	}

	public void setNewPrice(float newPrice) {
		this.newPrice = newPrice;
	}

	public String getComposition() {
		return composition;
	}

	public void setComposition(String composition) {
		this.composition = composition;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public float getOffer() {
		return offer;
	}

	public void setOffer(float offer) {
		this.offer = offer;
	}

	public String getPackSize() {
		return packSize;
	}

	public void setPackSize(String packSize) {
		this.packSize = packSize;
	}

	public Brands getBrand() {
		return brand;
	}

	public void setBrand(Brands brand) {
		this.brand = brand;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("RetailerSnapshot [id=");
		builder.append(id);
		builder.append(", product=");
		builder.append(product);
		builder.append(", salePrice=");
		builder.append(salePrice);
		builder.append(", mrp=");
		builder.append(mrp);
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