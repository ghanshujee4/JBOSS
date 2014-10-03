package com.tresfocus.ekart.bean;

public class RetailerDataBean {
	private String productName;
	private Float mrp;
	private Float discount;
	private Float offer;
	private Float salePrice;
	private String packSize;
	private Integer quantity;
	private Float bundlePrice;
	private String image;
	private String manufacturer;
	private String category;
	private String subcategory;
	private Float newPrice;
	
	private String brandName;
	private String composition;
	private String gender;
	private Integer age;


	public static String[] getColumnListForGrocery() {
		return new String[] { "productName", "manufacturer", "brandName",
				"category", "subcategory",
				"mrp", "discount", "offer",
				"salePrice", "packSize", "quantity",
				"bundlePrice", "image", "newPrice" };
	}
	
	public static String[] getColumnListForPharmacy() {
		return new String[] { "productName", "manufacturer", "brandName",
				"composition", "mrp", "discount", "offer",
				"salePrice", "packSize", "quantity",
				"bundlePrice", "image", "newPrice" };
	}
	
	public static String[] getColumnListForBabyShop() {
		return new String[] { "productName", "manufacturer", "brandName",
				"category", "subcategory",
				"gender", "age",
				"mrp", "discount", "offer",
				"salePrice", "image", "newPrice" };
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Float getMrp() {
		return mrp;
	}

	public void setMrp(Float mrp) {
		this.mrp = mrp;
	}

	public Float getDiscount() {
		return discount;
	}

	public void setDiscount(Float discount) {
		this.discount = discount;
	}

	public Float getOffer() {
		return offer;
	}

	public void setOffer(Float offer) {
		this.offer = offer;
	}

	public Float getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(Float salePrice) {
		this.salePrice = salePrice;
	}

	public String getPackSize() {
		return packSize;
	}

	public void setPackSize(String packSize) {
		this.packSize = packSize;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Float getBundlePrice() {
		return bundlePrice;
	}

	public void setBundlePrice(Float bundlePrice) {
		this.bundlePrice = bundlePrice;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubcategory() {
		return subcategory;
	}

	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}

	public Float getNewPrice() {
		return newPrice;
	}

	public void setNewPrice(Float newPrice) {
		this.newPrice = newPrice;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getComposition() {
		return composition;
	}

	public void setComposition(String composition) {
		this.composition = composition;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}
}
