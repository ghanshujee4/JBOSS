package com.tresfocus.ekart.web.ui.beans;

import java.util.Date;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.tresfocus.ekart.hibernate.entity.Orders;

public class OrdersBean {
	private int id;
	@JsonIgnore
	private OrganizationBean organization;
	@JsonIgnore
	private UserAddressBean addressByShippingAddressId;
	private String status;
	private String comments;
	private float itemValue;
	private float tax;
	private float commission;
	private Date expectedDeliveryTime;
	private int createdBy;
	private int lastUpdatedBy;
	private Date creationDate;
	private Date lastUpdatedDate;
	private String type;
	private String deliveryCode;
	private String orderNumber;
	
	public OrdersBean(Orders orders) {
		this.id=orders.getId();
		this.addressByShippingAddressId = new UserAddressBean(orders.getAddressByShippingAddressId());
		this.organization = new OrganizationBean(orders.getOrganization());
		this.status = orders.getStatus();
		this.itemValue = orders.getItemValue();
		this.tax = orders.getTax();
		this.commission = orders.getCommission();
		this.createdBy = orders.getCreatedBy();
		this.lastUpdatedBy = orders.getLastUpdatedBy();
		this.creationDate = orders.getCreationDate();
		this.lastUpdatedDate = orders.getLastUpdatedDate();
		this.type = orders.getType();
		this.deliveryCode =orders.getDeliveryCode();
		this.orderNumber=orders.getOrderNumber();
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
	public String getStatus() {
		return status;
	}
	public UserAddressBean getAddressByShippingAddressId() {
		return addressByShippingAddressId;
	}

	public void setAddressByShippingAddressId(
			UserAddressBean addressByShippingAddressId) {
		this.addressByShippingAddressId = addressByShippingAddressId;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public float getItemValue() {
		return itemValue;
	}
	public void setItemValue(float itemValue) {
		this.itemValue = itemValue;
	}
	public float getTax() {
		return tax;
	}
	public void setTax(float tax) {
		this.tax = tax;
	}
	public float getCommission() {
		return commission;
	}
	public void setCommission(float commission) {
		this.commission = commission;
	}
	public Date getExpectedDeliveryTime() {
		return expectedDeliveryTime;
	}
	public void setExpectedDeliveryTime(Date expectedDeliveryTime) {
		this.expectedDeliveryTime = expectedDeliveryTime;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDeliveryCode() {
		return deliveryCode;
	}
	public void setDeliveryCode(String deliveryCode) {
		this.deliveryCode = deliveryCode;
	}
	public String getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}
	
	
}
