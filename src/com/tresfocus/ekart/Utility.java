package com.tresfocus.ekart;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.Method;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.RandomStringUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.tresfocus.ekart.crypt.BCrypt;
import com.tresfocus.ekart.hibernate.entity.Address;
import com.tresfocus.ekart.hibernate.entity.OrderLines;
import com.tresfocus.ekart.hibernate.entity.Orders;
import com.tresfocus.ekart.hibernate.entity.Organization;
import com.tresfocus.ekart.hibernate.entity.User;
import com.tresfocus.ekart.hibernate.model.UserAddressDAOImpl;
import com.tresfocus.ekart.hibernate.model.UserDAOImpl;
import com.tresfocus.ekart.mail.Mail;
import com.tresfocus.ekart.mail.MailManager;
import com.tresfocus.ekart.spring.service.AddressManagerImpl;
import com.tresfocus.ekart.spring.service.LookupTypeManagerImpl;
import com.tresfocus.ekart.spring.service.OrderHistoryManagerImpl;
import com.tresfocus.ekart.spring.service.OrderLinesManagerImpl;
import com.tresfocus.ekart.spring.service.OrdersManagerImpl;
import com.tresfocus.ekart.spring.service.UserAddressManager;
import com.tresfocus.ekart.spring.service.UserAddressManagerImpl;
import com.tresfocus.ekart.spring.service.UserManager;
import com.tresfocus.ekart.spring.service.UserManagerImpl;

public class Utility {

	public static String getAddress(Address address){
		StringBuilder sbr = new StringBuilder();		
		sbr.append(address.getAddress1())
		   .append(", ")
		   .append(address.getAddress2());
		
		if(address.getAddress3() != null){
			sbr.append(", ")
			   .append(address.getAddress3());
		}
		
		sbr.append(", ");
		sbr.append(address.getCities().getName() + "-" + address.getPostalcode())
		   .append(", ")
		   .append(address.getStates().getName())
		   .append(", ")
		   .append(address.getCountry().getName())
		   .append(", ")
		   .append("Phone:" + address.getPhone());
		
		return sbr.toString();
	}
	
	public static String formatNumber(double value){		
		DecimalFormat myFormatter = new DecimalFormat("##,##,###.00");
		return myFormatter.format(value);
	}
	
	public static String formatDate(Date value){		
		SimpleDateFormat myFormatter = new SimpleDateFormat("dd/mm/yyyy hh:mm aaa");
		return myFormatter.format(value);
	}
	
	public static String getNameAddress(String name, Address address){
		StringBuilder sbr = new StringBuilder();
		sbr.append(name).append("<BR/>");
		
		sbr.append(address.getAddress1())
		   .append(", ")
		   .append(address.getAddress2());
		
		if(address.getAddress3() != null){
			sbr.append(", ")
			   .append(address.getAddress3());
		}
		
		sbr.append(", ");
		sbr.append(address.getCities().getName() + "-" + address.getPostalcode())
		   .append(", ")
		   .append(address.getStates().getName())
		   .append(", ")
		   .append(address.getCountry().getName())
		   .append(", ")
		   .append("Phone:" + address.getPhone());
		
		return sbr.toString();
	}
	
	public static String createOrderNumber(Integer customerId){
		Date currentDate = new Date();
		SimpleDateFormat myFormatter = new SimpleDateFormat("yyyymmddhhmsss");
		String dateVal = myFormatter.format(currentDate);
		String key = dateVal + customerId.toString(); 
		
		return key;
	}
	
	public static String createCustomerNumber(User user){
//		Date currentDate = new Date();
//		SimpleDateFormat myFormatter = new SimpleDateFormat("yyyymmddhhmsss");
//		String dateVal = myFormatter.format(currentDate);
//		String key = dateVal + customerId.toString(); 
//		user.getUserAddresses()
		
		return null;
	}
	
	public static String getUserFullName(UserAddressManager uaMgr, int userId){
		Address address = uaMgr.getAddressByUserId(userId);
		if(address != null)
			return address.getFirstName() + " " + address.getLastName();

		return null;
	}
	
	public static <T> T getParameterValue(HttpServletRequest request, String paramName, Class<T> clazz){
		String paramValue = request.getParameter(paramName);
		if(Integer.class.isAssignableFrom(clazz)){
			try{
				return (T)Integer.valueOf(paramValue);
			}catch(Exception e){
				return (T) new Integer(-1);
			}
		}else if(String.class.isAssignableFrom(clazz)){
			return (T)paramValue;
		}
		
		return null;
	}
	
	public static User getUserFromSession(HttpSession session){
		return (User) session.getAttribute(IConstants.SESSION_USER);
	}
	
	public static String getDeliverySecurityToken(){
		int tokenLength = IConstants.DEFAULT_SECURITY_TOKEN_LENGTH;
		
		try{
			String valueStr = ConfigMgr.getConfiguration().getProperty(IConstants.SECURITY_TOKEN_LENGTH);
			tokenLength = Integer.parseInt(valueStr);
		}catch(Exception e){
			tokenLength = IConstants.DEFAULT_SECURITY_TOKEN_LENGTH;
		}
						
		return RandomStringUtils.randomAlphanumeric(tokenLength);
	}

	public static void sendDeliveryTokenToCustomer(Orders order) throws Exception {
		Properties configProp = ConfigMgr.getConfiguration();
		String billingEmail = order.getAddressByBillingAddressId().getEmail();
		String shippingEmail = order.getAddressByShippingAddressId().getEmail();
		
		List<String> toAddress = new ArrayList<String>();
		toAddress.add(billingEmail);
		
		if(!toAddress.contains(shippingEmail))
			toAddress.add(shippingEmail);
				
		Mail mailObj = new Mail();
		mailObj.setFromAddress(configProp.getProperty(IConstants.EMAIL_FROM));
		mailObj.setToAddress(toAddress);
		mailObj.setReplyToAddress(Arrays.asList(configProp.getProperty(IConstants.EMAIL_REPLY_TO)));
		mailObj.setSubject("Order Status: " + order.getOrderNumber() + " has been Confirmed!");
		mailObj.setBody(MailManager.getOrderConfirmationEmailTemplate(order));
		
		MailManager.sendMessage(mailObj);
	}
	
	public static User getUserByName(String name) throws Exception{
		ApplicationContext context = new AnnotationConfigApplicationContext("com.tresfocus.ekart.hibernate.model", "com.tresfocus.ekart.spring.service");
		UserManager userMgr = (UserManager)context.getBean("UserManagerImpl");
    	return userMgr.getUserByUserName(name);
	}
	
    public static void populateWhoColumns(Object obj, User loggedInUser) throws Exception {
		try {
			Date currentTime = new Date();
			Method pkVal = obj.getClass().getMethod("getId", new Class[]{}) ;
			Integer pkId = (Integer)pkVal.invoke(obj, new Object[]{});
			
			if(loggedInUser == null)
				throw new Exception("Session not intialized");
			
			if(pkId == null || pkId == 0){				
				Method createdBy = obj.getClass().getMethod("setCreatedBy", Integer.TYPE) ;
				createdBy.invoke(obj, loggedInUser.getId());
				Method lastUpdatedBy = obj.getClass().getMethod("setLastUpdatedBy", Integer.TYPE) ;
				lastUpdatedBy.invoke(obj, loggedInUser.getId());
				Method creationDate = obj.getClass().getMethod("setCreationDate", Date.class) ;
				creationDate.invoke(obj, currentTime);
				Method lastUpdatedDate = obj.getClass().getMethod("setLastUpdatedDate", Date.class) ;
				lastUpdatedDate.invoke(obj, currentTime);
				if(obj.getClass() == Orders.class || obj.getClass() == OrderLines.class){
					Method organization = obj.getClass().getMethod("setOrganization", Organization.class) ;
					if(organization != null){
						Organization org = new Organization(loggedInUser.getOrganization().getId());
						organization.invoke(obj, org);
					}
				}
			}else{
				Method lastUpdatedDate = obj.getClass().getMethod("setLastUpdatedDate", Date.class) ;
				lastUpdatedDate.invoke(obj, currentTime);
				Method lastUpdatedBy = obj.getClass().getMethod("setLastUpdatedBy", Integer.TYPE) ;
				lastUpdatedBy.invoke(obj, loggedInUser.getId());
			}
		
		} catch (Exception e) {
			e.printStackTrace();
            throw e;
		}	
	}
    
	public static Object getServiceManager(ObjectTypeEnum objType){
		if(objType.equals(ObjectTypeEnum.OBJECT_USER)){
			return new UserManagerImpl();
		} else if(objType.equals(ObjectTypeEnum.OBJECT_ADDRESS)){
			return new AddressManagerImpl();
		} else if(objType.equals(ObjectTypeEnum.OBJECT_LOOKUP_TYPE)){
			return new LookupTypeManagerImpl();
		} else if(objType.equals(ObjectTypeEnum.OBJECT_ORDER)){
			return new OrdersManagerImpl();
		} else if(objType.equals(ObjectTypeEnum.OBJECT_ORDER_LINE)){
			return new OrderLinesManagerImpl();
		} else if(objType.equals(ObjectTypeEnum.OBJECT_ORDER_HISTORY)){
			return new OrderHistoryManagerImpl();
		}
		
		return null;
	}
	
	public static String stackTraceToString(Exception e){
		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw);
		e.printStackTrace(pw);
		
		return sw.toString();		
	}
	public static void sendOrderPlacedMail(Orders order){    

		String billingEmail = order.getAddressByBillingAddressId().getEmail();
		String shippingEmail = order.getAddressByShippingAddressId().getEmail();
		
		List<String> toAddress = new ArrayList<String>();
		toAddress.add(billingEmail);
		
		if(!toAddress.contains(shippingEmail))
			toAddress.add(shippingEmail);
		
		Properties props = new Properties();
		props.put(IConstants.EMAIL_SMTP_HOST, "node01.tmdhosting410.com");
		props.put(IConstants.EMAIL_SMTP_SOCKETFACTORY_PORT, "465");
		props.put(IConstants.EMAIL_SMTP_SOCKETFACTORY_CLASS,"javax.net.ssl.SSLSocketFactory");
		props.put(IConstants.EMAIL_SMTP_AUTH, "true");
		props.put(IConstants.EMAIL_SMTP_PORT, "465");
 		Session session = Session.getDefaultInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("info@eastfacing.in","mail@876");
				}
			});
 
		try {
			
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("closerby@closerby.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(order.getAddressByShippingAddressId().getEmail()));
			message.setSubject("Order Status: " + order.getOrderNumber() + " has been Placed!");
			message.setText(MailManager.getOrderConfirmationEmailTemplate(order));
 			Transport.send(message);
 			System.out.println("Done");
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	public static void main(String[] args) {
		System.out.println(BCrypt.checkpw("harsha123", "$2a$10$kp5xqkKRnSAlurcvqzoArOvXt2PA2GTq3weoECJyatKM0uZOoO93u"));
		System.out.println(BCrypt.hashpw("Welcome123", BCrypt.gensalt()));
		sendOrderPlacedMail(null);
	}
}
