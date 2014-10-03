package com.tresfocus.ekart.web.ui.beans;

import java.io.Serializable;


public class OrderItem implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8219211471223919283L;
	private ProductBean product;
	private int quantity;
	private double total;
	private RetailerSnapshotBean retailerSnapshotBean;
	public OrderItem() {
		// TODO Auto-generated constructor stub
	}
	
	public OrderItem(ProductBean product, int quantity,
			RetailerSnapshotBean retailerSnapshotBean) {
		super();
		this.product = product;
		this.quantity = quantity;
		this.retailerSnapshotBean = retailerSnapshotBean;
		this.total = quantity*retailerSnapshotBean.getSalePrice();
	}

	public ProductBean getProduct() {
		return product;
	}
	public void setProduct(ProductBean product) {
		this.product = product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public RetailerSnapshotBean getRetailerSnapshotBean() {
		return retailerSnapshotBean;
	}
	public void setRetailerSnapshotBean(
			RetailerSnapshotBean retailerSnapshotBean) {
		this.retailerSnapshotBean = retailerSnapshotBean;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public double getTotal() {
		return total;
	}
	
}
