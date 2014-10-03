package com.tresfocus.ekart.web.ui.beans;

import java.util.Date;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.tresfocus.ekart.hibernate.entity.OrderLines;
import com.tresfocus.ekart.hibernate.entity.Orders;
import com.tresfocus.ekart.hibernate.entity.Organization;
import com.tresfocus.ekart.hibernate.entity.Product;

public class OrderLinesBean {
	private int id;
	@JsonIgnore
	private Orders orders;
	private Product product;
	@JsonIgnore
	private Organization organization;
	private int quantity;
	private int packaged;
	private float price;
	private float tax;
	private float discount;
	private int createdBy;
	private int lastUpdatedBy;
	private Date creationDate;
	private Date lastUpdatedDate;
	private int objectVersionNumber;
	public OrderLinesBean(OrderLines orderLines) {
		this.id = orderLines.getId();
		this.orders = orderLines.getOrders();
		this.product = orderLines.getProduct();
		this.organization = orderLines.getOrganization();
		this.quantity = orderLines.getQuantity();
		this.packaged = orderLines.getPackaged();
		this.price = orderLines.getPrice();
		this.tax = orderLines.getTax();
		this.discount = orderLines.getDiscount();
		this.createdBy = orderLines.getCreatedBy();
		this.lastUpdatedBy = orderLines.getLastUpdatedBy();
		this.creationDate = orderLines.getCreationDate();
		this.lastUpdatedDate = orderLines.getLastUpdatedDate();
		this.objectVersionNumber = orderLines.getObjectVersionNumber();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Orders getOrders() {
		return orders;
	}
	public void setOrders(Orders orders) {
		this.orders = orders;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Organization getOrganization() {
		return organization;
	}
	public void setOrganization(Organization organization) {
		this.organization = organization;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getPackaged() {
		return packaged;
	}
	public void setPackaged(int packaged) {
		this.packaged = packaged;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public float getTax() {
		return tax;
	}
	public void setTax(float tax) {
		this.tax = tax;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
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
