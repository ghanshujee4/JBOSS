package com.tresfocus.ekart.spring.rest;

import java.util.List;

import javax.ws.rs.QueryParam;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thoughtworks.xstream.XStream;
import com.tresfocus.ekart.ObjectTypeEnum;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.spring.service.AddressManager;
import com.tresfocus.ekart.spring.service.LookupTypeManager;
import com.tresfocus.ekart.spring.service.OrderHistoryManager;
import com.tresfocus.ekart.spring.service.OrderLinesManager;
import com.tresfocus.ekart.spring.service.OrdersManager;
import com.tresfocus.ekart.spring.service.UserManager;

@Controller
@Secured("ROLE_USER")
@Scope("request")
public class SvcProcessor {
	private final Logger logger = Logger.getLogger(SvcProcessor.class);
	@Autowired
	private UserManager userMgr;
	@Autowired
	private AddressManager addressMgr;
	@Autowired
	private LookupTypeManager lookupTypeMgr;
	@Autowired
	private OrdersManager ordersMgr;
	@Autowired
	private OrderLinesManager orderLinesMgr;
	@Autowired
	private OrderHistoryManager orderHistoryMgr;
	
	@RequestMapping(value = "/rest/svcprocess.shx", method = RequestMethod.POST,
			produces="text/plain")
	public @ResponseBody String processRequest(@QueryParam("type") String type, 
					             @QueryParam("operation") String operation, 
					             @QueryParam("ioFormat") String ioFormat,
					             @QueryParam("payload") String payload){
		try{
			UserDetails userDetails =
					 (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			User user = userMgr.getUserByUserName(userDetails.getUsername());
			
			ObjectTypeEnum typeEnum = ObjectTypeEnum.getTypeByName(type);
			XStream xstream = Utility.createXStream(ioFormat);
			Utility.initializeXStream(typeEnum, xstream);
	
			Object inputObj = xstream.fromXML(payload);
			logger.debug(inputObj.toString());
			
			Object returnObject = execute(typeEnum, operation, inputObj, user);
			if(returnObject != null){
				if(returnObject instanceof List){
					StringBuilder sBld = new StringBuilder();
					for(Object obj : (List)returnObject){
						sBld.append(xstream.toXML(obj)).append("\n");
					}
					
					return sBld.toString();
				}else{
					return xstream.toXML(returnObject);
				}
			}
		}catch(Exception e){
			String errorInfo = com.tresfocus.ekart.Utility.stackTraceToString(e);
			logger.debug(errorInfo);
			return errorInfo;
		}
				
		return null;
	}
	
	private Object execute(ObjectTypeEnum typeEnum, String operation, Object inputObj, User loggedInUser) throws Exception{
		if(typeEnum.equals(ObjectTypeEnum.OBJECT_USER)){
			return userMgr.execute(operation, inputObj, loggedInUser);
		} else if(typeEnum.equals(ObjectTypeEnum.OBJECT_ADDRESS)){
			return addressMgr.execute(operation, inputObj, loggedInUser);
		} else if(typeEnum.equals(ObjectTypeEnum.OBJECT_LOOKUP_TYPE)){
			return lookupTypeMgr.execute(operation, inputObj, loggedInUser);
		} else if(typeEnum.equals(ObjectTypeEnum.OBJECT_ORDER)){
			return ordersMgr.execute(operation, inputObj, loggedInUser);
		} else if(typeEnum.equals(ObjectTypeEnum.OBJECT_ORDER_LINE)){
			return orderLinesMgr.execute(operation, inputObj, loggedInUser);
		} else if(typeEnum.equals(ObjectTypeEnum.OBJECT_ORDER_HISTORY)){
			return orderHistoryMgr.execute(operation, inputObj, loggedInUser);
		}
		
		return null;
	}
}
