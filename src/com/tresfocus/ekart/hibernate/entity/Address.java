package com.tresfocus.ekart.hibernate.entity;

// Generated May 10, 2014 2:51:46 AM by Hibernate Tools 4.0.0

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Version;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamImplicit;
import com.thoughtworks.xstream.annotations.XStreamOmitField;

/**
 * Address generated by hbm2java
 */
@XStreamAlias("address")
@Entity
public class Address implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private Cities cities;
	private States states;
	private Country country;
	private String firstName;
	private String middleName;
	private String lastName;
	private String address1;
	private String address2;
	private String address3;
	private String postalcode;
	private String phone;
	private String email;
	private boolean active = true;
	private int createdBy;
	private int lastUpdatedBy;
	private Date creationDate;
	private Date lastUpdatedDate;
	@Version
	private int objectVersionNumber;
	@XStreamOmitField
	@JsonIgnore
	private Set userAddresses = new HashSet(0);
	@XStreamOmitField	
	@JsonIgnore
	private Set ordersesForBillingAddressId = new HashSet(0);
	@XStreamOmitField	
	@JsonIgnore
	private Set ordersesForShippingAddressId = new HashSet(0);
	@XStreamOmitField	
	@JsonIgnore
	private Set organizations = new HashSet(0);

	public Address() {
	}
	
	public Address(String firstName, String lastName,
			String address1,String address2,String address3, String city, String postalcode,
			String phone,String email) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		//this.city = city;
		this.postalcode = postalcode;
		this.phone = phone;
		this.email = email;
	}


	public Address(Cities cities, States states, Country country,
			String firstName, String lastName, String address1,
			String postalcode, String phone, boolean active, int createdBy,
			int lastUpdatedBy, Date creationDate, Date lastUpdatedDate,
			int objectVersionNumber, String email) {
		this.cities = cities;
		this.states = states;
		this.country = country;
		this.firstName = firstName;
		this.lastName = lastName;
		this.address1 = address1;
		this.postalcode = postalcode;
		this.phone = phone;
		this.active = active;
		this.createdBy = createdBy;
		this.lastUpdatedBy = lastUpdatedBy;
		this.creationDate = creationDate;
		this.lastUpdatedDate = lastUpdatedDate;
		this.objectVersionNumber = objectVersionNumber;
		this.email = email;
	}

	public Address(Cities cities, States states, Country country,
			String firstName, String middleName, String lastName,
			String address1, String address2, String address3,
			String postalcode, String phone, boolean active, int createdBy,
			int lastUpdatedBy, Date creationDate, Date lastUpdatedDate,
			int objectVersionNumber, String email, Set userAddresses,
			Set ordersesForBillingAddressId, Set ordersesForShippingAddressId,
			Set organizations) {
		this.cities = cities;
		this.states = states;
		this.country = country;
		this.firstName = firstName;
		this.middleName = middleName;
		this.lastName = lastName;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.postalcode = postalcode;
		this.phone = phone;
		this.active = active;
		this.createdBy = createdBy;
		this.lastUpdatedBy = lastUpdatedBy;
		this.creationDate = creationDate;
		this.lastUpdatedDate = lastUpdatedDate;
		this.objectVersionNumber = objectVersionNumber;
		this.email = email;
		this.userAddresses = userAddresses;
		this.ordersesForBillingAddressId = ordersesForBillingAddressId;
		this.ordersesForShippingAddressId = ordersesForShippingAddressId;
		this.organizations = organizations;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Cities getCities() {
		return this.cities;
	}

	public void setCities(Cities cities) {
		this.cities = cities;
	}

	public States getStates() {
		return this.states;
	}

	public void setStates(States states) {
		this.states = states;
	}

	public Country getCountry() {
		return this.country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return this.middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getAddress1() {
		return this.address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return this.address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddress3() {
		return this.address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public String getPostalcode() {
		return this.postalcode;
	}

	public void setPostalcode(String postalcode) {
		this.postalcode = postalcode;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public boolean isActive() {
		return this.active;
	}

	public void setActive(boolean active) {
		this.active = active;
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

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Set getUserAddresses() {
		return this.userAddresses;
	}

	public void setUserAddresses(Set<UserAddress> userAddresses) {
		this.userAddresses = userAddresses;
	}

	public Set<Orders> getOrdersesForBillingAddressId() {
		return this.ordersesForBillingAddressId;
	}

	public void setOrdersesForBillingAddressId(
			Set<Orders> ordersesForBillingAddressId) {
		this.ordersesForBillingAddressId = ordersesForBillingAddressId;
	}

	public Set<Orders> getOrdersesForShippingAddressId() {
		return this.ordersesForShippingAddressId;
	}

	public void setOrdersesForShippingAddressId(
			Set<Orders> ordersesForShippingAddressId) {
		this.ordersesForShippingAddressId = ordersesForShippingAddressId;
	}

	public Set<Organization> getOrganizations() {
		return this.organizations;
	}

	public void setOrganizations(Set<Organization> organizations) {
		this.organizations = organizations;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Address [id=");
		builder.append(id);
		builder.append(", country=");
		builder.append(country);
		builder.append(", firstName=");
		builder.append(firstName);
		builder.append(", middleName=");
		builder.append(middleName);
		builder.append(", lastName=");
		builder.append(lastName);
		builder.append(", address1=");
		builder.append(address1);
		builder.append(", address2=");
		builder.append(address2);
		builder.append(", address3=");
		builder.append(address3);
		builder.append(", postalcode=");
		builder.append(postalcode);
		builder.append(", phone=");
		builder.append(phone);
		builder.append(", active=");
		builder.append(active);
		builder.append(", createdBy=");
		builder.append(createdBy);
		builder.append(", lastUpdatedBy=");
		builder.append(lastUpdatedBy);
		builder.append(", creationDate=");
		builder.append(creationDate);
		builder.append(", lastUpdatedDate=");
		builder.append(lastUpdatedDate);
		builder.append(", objectVersionNumber=");
		builder.append(objectVersionNumber);
		builder.append("]");
		return builder.toString();
	}

	public static void initializeXStream(XStream xstreamObj) {
		xstreamObj.alias("country", Country.class);
		xstreamObj.alias("state", States.class);
		xstreamObj.alias("city", Cities.class);
		xstreamObj.alias("", java.sql.Timestamp.class, java.util.Date.class);		
	}

}
