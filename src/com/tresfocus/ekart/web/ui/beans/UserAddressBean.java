package com.tresfocus.ekart.web.ui.beans;

import com.tresfocus.ekart.hibernate.entity.Address;
import com.tresfocus.ekart.hibernate.entity.Cities;
import com.tresfocus.ekart.hibernate.entity.Country;
import com.tresfocus.ekart.hibernate.entity.States;
import com.tresfocus.ekart.hibernate.entity.UserAddress;
import com.tresfocus.ekart.hibernate.entity.Zone;

public class UserAddressBean {
	private int userId;
	private boolean primary;
	private int id;
	private Zone zone;
	private Country country;
	private String firstName;
	private String middleName;
	private String lastName;
	private String address1;
	private String address2;
	private String address3;
	private Cities city;
	private States state;
	private String postalcode;
	private String phone;
	private String email;
	private boolean active = true;
	public UserAddressBean(UserAddress userAddress) {
		this.id = userAddress.getAddress().getId();
		this.userId = userAddress.getUser().getId();
		this.country = userAddress.getAddress().getCountry();
		this.firstName = userAddress.getAddress().getFirstName();
		this.lastName = userAddress.getAddress().getLastName();
		this.address1 = userAddress.getAddress().getAddress1();
		this.city = userAddress.getAddress().getCities();
		this.state = userAddress.getAddress().getStates();
		this.postalcode = userAddress.getAddress().getPostalcode();
		this.phone = userAddress.getAddress().getPhone();
		this.active = userAddress.getAddress().isActive();
		this.email = userAddress.getAddress().getEmail();
	}
	public UserAddressBean(Address userAddress) {
		this.firstName = userAddress.getFirstName();
		this.lastName = userAddress.getLastName();
		this.address1 = userAddress.getAddress1();
		this.city = userAddress.getCities();
		this.state = userAddress.getStates();
		this.postalcode = userAddress.getPostalcode();
		this.phone = userAddress.getPhone();
		this.active = userAddress.isActive();
		this.email = userAddress.getEmail();
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public boolean isPrimary() {
		return primary;
	}
	public void setPrimary(boolean primary) {
		this.primary = primary;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Zone getZone() {
		return zone;
	}
	public void setZone(Zone zone) {
		this.zone = zone;
	}
	/*public Country getCountry() {
		return country;
	}
	public void setCountry(Country country) {
		this.country = country;
	}*/
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	public Cities getCity() {
		return city;
	}
	public void setCity(Cities city) {
		this.city = city;
	}
	public States getState() {
		return state;
	}
	public void setState(States state) {
		this.state = state;
	}
	public String getPostalcode() {
		return postalcode;
	}
	public void setPostalcode(String postalcode) {
		this.postalcode = postalcode;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	/*public int getCreatedBy() {
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
	}*/
	
}
