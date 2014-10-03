package com.tresfocus.ekart;

import java.util.Arrays;
import java.util.List;

public enum ObjectTypeEnum {
	OBJECT_USER("USER", "User"),
	OBJECT_ADDRESS("ADDRESS", "Address"),
	OBJECT_LOOKUP_TYPE("LOOKUP_TYPE", "Lookup Type"),
	OBJECT_ORDER("ORDER", "Order"),
	OBJECT_ORDER_LINE("ORDER_LINE", "Order Line"),
	OBJECT_ORDER_HISTORY("ORDER_HISTORY", "Order History"),
	OBJECT_COUNTRY("COUNTRY", "Country"),
	OBJECT_STATE("STATE", "State"),
	OBJECT_CITY("CITY", "City"),
	OBJECT_ZONE("ZONE", "Zone"), 
	OBJECT_CATEGORY("CATEGORY", "Category"),
	OBJECT_CATEGORY_TYPE("CATEGOR_TYPE", "CategoryType");
	
	private String name;
	private String description;
	
	private ObjectTypeEnum(String name, String description) {
		this.name = name;
		this.description = description;
	}
	
	public String getName() {
		return name;
	}
	
	public String getDescription() {
		return description;
	}
	
	public static ObjectTypeEnum getTypeByName(String name){
		List<ObjectTypeEnum> enumList = Arrays.asList(ObjectTypeEnum.values());
		for(ObjectTypeEnum enumObj : enumList){
			if(enumObj.getName().equalsIgnoreCase(name)){
				return enumObj;
			}
		}
		
		return null;
	}
	
	public boolean equals(ObjectTypeEnum typeEnum){
		if(this.name.equalsIgnoreCase(typeEnum.getName()))
			return true;
		
		return false;
	}
}
