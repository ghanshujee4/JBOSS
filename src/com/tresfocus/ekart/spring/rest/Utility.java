package com.tresfocus.ekart.spring.rest;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.converters.basic.DateConverter;
import com.thoughtworks.xstream.hibernate.mapper.HibernateMapper;
import com.thoughtworks.xstream.io.json.JettisonMappedXmlDriver;
import com.thoughtworks.xstream.mapper.MapperWrapper;
import com.tresfocus.ekart.ObjectTypeEnum;
import com.tresfocus.ekart.hibernate.entity.Address;
import com.tresfocus.ekart.hibernate.entity.Category;
import com.tresfocus.ekart.hibernate.entity.Cities;
import com.tresfocus.ekart.hibernate.entity.Country;
import com.tresfocus.ekart.hibernate.entity.LookupType;
import com.tresfocus.ekart.hibernate.entity.OrderHistory;
import com.tresfocus.ekart.hibernate.entity.OrderLines;
import com.tresfocus.ekart.hibernate.entity.Orders;
import com.tresfocus.ekart.hibernate.entity.States;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.hibernate.entity.Zone;

public class Utility {
	public static void initializeXStream(ObjectTypeEnum typeEnum, XStream xstreamObj){
		if(typeEnum == null)
			return;
		
		
		if(typeEnum.equals(ObjectTypeEnum.OBJECT_USER)){
			User.initializeXStream(xstreamObj);
		} else if(typeEnum.equals(ObjectTypeEnum.OBJECT_ADDRESS)){
			Address.initializeXStream(xstreamObj);
		} else if(typeEnum.equals(ObjectTypeEnum.OBJECT_LOOKUP_TYPE)){
			LookupType.initializeXStream(xstreamObj);
		} else if(typeEnum.equals(ObjectTypeEnum.OBJECT_ORDER)){
			Orders.initializeXStream(xstreamObj);
		} else if(typeEnum.equals(ObjectTypeEnum.OBJECT_ORDER_LINE)){
			OrderLines.initializeXStream(xstreamObj);
		} else if(typeEnum.equals(ObjectTypeEnum.OBJECT_ORDER_HISTORY)){
			OrderHistory.initializeXStream(xstreamObj);
		} else if(typeEnum.equals(ObjectTypeEnum.OBJECT_COUNTRY)){
			Country.initializeXStream(xstreamObj);
		} else if(typeEnum.equals(ObjectTypeEnum.OBJECT_STATE)){
			States.initializeXStream(xstreamObj);
		} else if(typeEnum.equals(ObjectTypeEnum.OBJECT_CITY)){
			Cities.initializeXStream(xstreamObj);
		} else if(typeEnum.equals(ObjectTypeEnum.OBJECT_ZONE)){
			Zone.initializeXStream(xstreamObj);
		} else if(typeEnum.equals(ObjectTypeEnum.OBJECT_CATEGORY)){
			Category.initializeXStream(xstreamObj);
		}
	}
	
	public static XStream createXStream(String type) {
        XStream xstream = null;
        
        if(type != null && type.equalsIgnoreCase("json")){
        	xstream = new XStream(new JettisonMappedXmlDriver()) { 
	            protected MapperWrapper wrapMapper(final MapperWrapper next) {
	                return new HibernateMapper(next);	            	
	            } 
        	};
        	xstream.setMode(XStream.NO_REFERENCES);
		}else{
        	xstream = new XStream() { 
	            protected MapperWrapper wrapMapper(final MapperWrapper next) {
	                return new HibernateMapper(next);
	            } 
        	};			
		}
        
		xstream.autodetectAnnotations(true);		
		
        xstream.registerConverter(new DateConverter("yyyy-MM-dd HH:mm:ss.S", new String[] {}));
        return xstream;
    }
}
