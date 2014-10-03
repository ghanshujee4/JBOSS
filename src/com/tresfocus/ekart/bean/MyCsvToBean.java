package com.tresfocus.ekart.bean;

import java.beans.PropertyDescriptor;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import au.com.bytecode.opencsv.bean.CsvToBean;

public class MyCsvToBean<T> extends CsvToBean<T>{
	@Override
	protected Object convertValue(String value, PropertyDescriptor prop) throws InstantiationException, IllegalAccessException {
		if(value != null && !value.isEmpty()){
			if(prop.getPropertyType().isAssignableFrom(java.lang.Boolean.class)){
				if(Integer.valueOf(value) == 0)
					return Boolean.FALSE;
				else
					return Boolean.TRUE;
			}else if(prop.getPropertyType().isAssignableFrom(java.util.Date.class)){
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
				try {
					return sdf.parse(value);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				return super.convertValue(value, prop);
			}
		}
		
		return null;
	}
}
