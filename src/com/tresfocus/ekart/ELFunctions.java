package com.tresfocus.ekart;

import com.tresfocus.ekart.hibernate.entity.Address;

public class ELFunctions {
    public static String getUserName(String firstName, String lastName){
        return firstName + " " + lastName;
    }
    
	public static String getAddress(Address address){
		StringBuilder sbr = new StringBuilder();
		sbr.append(address.getAddress1())
		   .append(", ")
		   .append(address.getAddress2());
		
		if(address.getAddress3() != null){
			sbr.append(", <BR/> ")
			   .append(address.getAddress3());
		}
		
		sbr.append(", <BR/>");
		sbr.append(address.getCities().getName() + "-" + address.getPostalcode())
		   .append(", <BR/>")
		   .append(address.getStates().getName())
		   .append(", ")
		   .append(address.getCountry().getName());
		
		return sbr.toString();
	}
}