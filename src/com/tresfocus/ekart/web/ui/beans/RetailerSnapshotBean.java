package com.tresfocus.ekart.web.ui.beans;

import java.util.Date;

import com.tresfocus.ekart.hibernate.entity.MeasuringUnit;
import com.tresfocus.ekart.hibernate.entity.Organization;
import com.tresfocus.ekart.hibernate.entity.Product;
import com.tresfocus.ekart.hibernate.entity.RetailerSnapshot;

public class RetailerSnapshotBean implements java.io.Serializable {

			/**
	 * 
	 */
	private static final long serialVersionUID = -667646952100894801L;
			private int id;
			private OrganizationBean organization;
			private MeasuringUnit measuringUnit;
			private float salePrice;
			private Float purchasedPrice;
			private Float salesTax;
			private float mrp;
			private Float purchasedTaxPercent;
			private Date creationDate;
			private Date lastUpdatedDate;
			private int createdBy;
			private int lastUpdatedBy;
			private int objectVersionNumber;

			public RetailerSnapshotBean() {
			}

			public RetailerSnapshotBean(RetailerSnapshot retailerSnapshot) {
				this.id = retailerSnapshot.getId();
				this.organization = new OrganizationBean(retailerSnapshot.getOrganization());
				//this.measuringUnit = retailerSnapshot.getMeasuringUnit();
				this.salePrice = retailerSnapshot.getSalePrice();
				this.mrp = retailerSnapshot.getMrp();
				this.creationDate = retailerSnapshot.getCreationDate();
				this.lastUpdatedDate = retailerSnapshot.getLastUpdatedDate();
				this.createdBy = retailerSnapshot.getCreatedBy();
				this.lastUpdatedBy = retailerSnapshot.getLastUpdatedBy();
				this.objectVersionNumber = retailerSnapshot.getObjectVersionNumber();
			}

			public int getId() {
				return id;
			}

			public void setId(int id) {
				this.id = id;
			}

			public OrganizationBean getOrganization() {
				return organization;
			}

			public void setOrganization(OrganizationBean organization) {
				this.organization = organization;
			}

			public MeasuringUnit getMeasuringUnit() {
				return measuringUnit;
			}

			public void setMeasuringUnit(MeasuringUnit measuringUnit) {
				this.measuringUnit = measuringUnit;
			}

			public float getSalePrice() {
				return salePrice;
			}

			public void setSalePrice(float salePrice) {
				this.salePrice = salePrice;
			}

			public Float getPurchasedPrice() {
				return purchasedPrice;
			}

			public void setPurchasedPrice(Float purchasedPrice) {
				this.purchasedPrice = purchasedPrice;
			}

			public Float getSalesTax() {
				return salesTax;
			}

			public void setSalesTax(Float salesTax) {
				this.salesTax = salesTax;
			}

			public float getMrp() {
				return mrp;
			}

			public void setMrp(float mrp) {
				this.mrp = mrp;
			}

			public Float getPurchasedTaxPercent() {
				return purchasedTaxPercent;
			}

			public void setPurchasedTaxPercent(Float purchasedTaxPercent) {
				this.purchasedTaxPercent = purchasedTaxPercent;
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

			public int getObjectVersionNumber() {
				return objectVersionNumber;
			}

			public void setObjectVersionNumber(int objectVersionNumber) {
				this.objectVersionNumber = objectVersionNumber;
			}

			
}
