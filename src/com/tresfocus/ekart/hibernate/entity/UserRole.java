package com.tresfocus.ekart.hibernate.entity;

// Generated May 10, 2014 2:51:46 AM by Hibernate Tools 4.0.0

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Version;

// Generated Apr 15, 2014 9:47:41 PM by Hibernate Tools 3.4.0.CR1

/**
 * UserRole generated by hbm2java
 */
@Entity
public class UserRole implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private User user;
	private Roles roles;
	private int createdBy;
	private int lastUpdatedBy;
	private Date creationDate;
	private Date lastUpdatedDate;
	@Version
	private int objectVersionNumber;

	public UserRole() {
	}

	public UserRole(User user, Roles roles, int createdBy, int lastUpdatedBy,
			Date creationDate, Date lastUpdatedDate, int objectVersionNumber) {
		this.user = user;
		this.roles = roles;
		this.createdBy = createdBy;
		this.lastUpdatedBy = lastUpdatedBy;
		this.creationDate = creationDate;
		this.lastUpdatedDate = lastUpdatedDate;
		this.objectVersionNumber = objectVersionNumber;
	}
	public UserRole(User user, Roles roles) {
		this.user = user;
		this.roles = roles;
		this.createdBy = 0;
		this.lastUpdatedBy = 0;
		this.creationDate = new Date();
		this.lastUpdatedDate = new Date();
		this.objectVersionNumber = 0;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Roles getRoles() {
		return this.roles;
	}

	public void setRoles(Roles roles) {
		this.roles = roles;
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UserRole [id=");
		builder.append(id);
		builder.append(", user=");
		builder.append(user);
		builder.append(", roles=");
		builder.append(roles);
		builder.append("]");
		return builder.toString();
	}
}
