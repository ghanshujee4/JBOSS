package com.tresfocus.ekart.web.ui.beans;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.thoughtworks.xstream.annotations.XStreamOmitField;
import com.tresfocus.ekart.hibernate.entity.Category;
import com.tresfocus.ekart.hibernate.entity.OrderLines;
import com.tresfocus.ekart.hibernate.entity.Product;
import com.tresfocus.ekart.hibernate.entity.RetailerSnapshot;



public class ProductBean implements Comparable<ProductBean>, Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6764273377624962085L;
	private int id;
	@JsonIgnore
	private Category category;
	private String name;
	private String uniqueName;
	private String barcode;
	private String searchCode;
	private int active = 1;
	private String image;
	private Date creationDate;
	private Date lastUpdatedDate;
	private int createdBy;
	private int lastUpdatedBy;
	private int objectVersionNumber;
	//@JsonIgnore
	private Set<RetailerSnapshotBean> retailerSnapshots = new HashSet<RetailerSnapshotBean>(0);

	public ProductBean() {
		// TODO Auto-generated constructor stub
	}
	
	/*public ProductVO(int productId, String name,
			List<ProductAttributeVO> productAttributes, String image,
			boolean status,Manufacturer manufacturer,Category category,String searchKeyword) {
		super();
		this.productId = productId;
		this.name = name;
		this.productAttributes = productAttributes;
		this.image = image;
		this.status = status;
		this.manufacturerId = manufacturer.getManufacturerId();
		this.category = category;
		this.searchKeyword = searchKeyword;
	}*/

	public ProductBean(Product product) {
		super();
		this.id = product.getId();
		this.category = product.getCategory();
		this.name = product.getName();
		this.image = product.getImage();
		this.uniqueName = product.getUniqueName();
		this.active = product.getActive();
		this.creationDate = product.getCreationDate();
		this.lastUpdatedDate = product.getLastUpdatedDate();
		this.createdBy = product.getCreatedBy();
		this.lastUpdatedBy = product.getLastUpdatedBy();
		this.objectVersionNumber = product.getObjectVersionNumber();
		for(RetailerSnapshot rs : product.getRetailerSnapshots()){
			this.retailerSnapshots.add(new RetailerSnapshotBean(rs));
		}
		
		
	}

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUniqueName() {
		return uniqueName;
	}

	public void setUniqueName(String uniqueName) {
		this.uniqueName = uniqueName;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getSearchCode() {
		return searchCode;
	}

	public void setSearchCode(String searchCode) {
		this.searchCode = searchCode;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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

	public Set<RetailerSnapshotBean> getRetailerSnapshots() {
		return retailerSnapshots;
	}
	public void addRetailerSnapshots(RetailerSnapshotBean retailerSnapshotBean) {
		retailerSnapshots.add(retailerSnapshotBean);
	}

	public void setRetailerSnapshots(Set<RetailerSnapshotBean> retailerSnapshots) {
		this.retailerSnapshots = retailerSnapshots;
	}

	@Override
	public int compareTo(ProductBean o) {
		// TODO Auto-generated method stub
		return o.id - this.id;
	}
	
}
