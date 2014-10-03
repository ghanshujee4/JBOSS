package com.tresfocus.ekart.mail;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.xml.bind.DatatypeConverter;

import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;

import com.tresfocus.ekart.ConfigMgr;
import com.tresfocus.ekart.IConstants;
import com.tresfocus.ekart.Utility;
import com.tresfocus.ekart.hibernate.entity.OrderLines;
import com.tresfocus.ekart.hibernate.entity.Orders;
import com.tresfocus.ekart.spring.service.OrderLinesManager;
import com.tresfocus.ekart.spring.service.OrderLinesManagerImpl;
import com.tresfocus.ekart.spring.service.OrdersManager;
import com.tresfocus.ekart.spring.service.OrdersManagerImpl;

/**
 * @author SRSH
 * 
 *         <code>EmailManager</code> handles Email operations
 *         <p/>
 */

public class MailManager {

	private static Session getMailSession() throws Exception {
		Properties configProp = ConfigMgr.getConfiguration();
		
		//eMail properties
		Properties eProp = new Properties();
		eProp.setProperty(IConstants.EMAIL_SMTP_HOST, configProp.getProperty(IConstants.EMAIL_SMTP_HOST));
		eProp.setProperty(IConstants.EMAIL_SMTP_PORT, configProp.getProperty(IConstants.EMAIL_SMTP_PORT));
		eProp.setProperty(IConstants.EMAIL_SMTP_START_TLS, configProp.getProperty(IConstants.EMAIL_SMTP_START_TLS));
		eProp.setProperty(IConstants.EMAIL_SMTP_AUTH, configProp.getProperty(IConstants.EMAIL_SMTP_AUTH));
		
		final String userName = configProp.getProperty(IConstants.EMAIL_USER);
		byte[] decodedPasswd = DatatypeConverter.parseBase64Binary(configProp.getProperty(IConstants.EMAIL_PASSWORD));
		final String password = new String(decodedPasswd, "UTF-8");
		
		// Get the Session object.
		return Session.getInstance(eProp,
				  new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(userName, password);
					}
				  });
	}

	public static void sendMessage(Mail mail) throws Exception {
		Session session = getMailSession();
//		session.setDebug(true);
		MimeMessage message = new MimeMessage(session);
		prepareMessage(message, mail);

		// Send message
		Transport.send(message);
	}

	private static void prepareMessage(MimeMessage message, Mail mail) throws Exception {
		message.setFrom(new InternetAddress(mail.getFromAddress()));
				
		if(mail.getToAddress() != null && !mail.getToAddress().isEmpty())
			message.addRecipients(Message.RecipientType.TO, addressToInetAddress(mail.getToAddress()));
		
		if(mail.getCcAddress() != null && !mail.getCcAddress().isEmpty())
			message.addRecipients(Message.RecipientType.CC, addressToInetAddress(mail.getCcAddress()));

		if(mail.getBccAddress() != null && !mail.getBccAddress().isEmpty())
			message.addRecipients(Message.RecipientType.BCC, addressToInetAddress(mail.getBccAddress()));
		
		if(mail.getReplyToAddress() != null && !mail.getReplyToAddress().isEmpty())
			message.setReplyTo(addressToInetAddress(mail.getReplyToAddress()));

		message.setSubject(mail.getSubject());
		
		if(mail.isHasAttachements()){
			MimeBodyPart messageBodyPart = new MimeBodyPart();
			messageBodyPart .setText(mail.getBody());	
			
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);
	
			for (String file : mail.getAttachments()) {
				File fileObj = new File(file);
				messageBodyPart = new MimeBodyPart();
				DataSource source = new FileDataSource(fileObj);
				messageBodyPart.setDataHandler(new DataHandler(source));
				messageBodyPart.setFileName(fileObj.getName());
				multipart.addBodyPart(messageBodyPart);
			} 
			
			message.setContent(multipart);
		}else{
			message.setContent(mail.getBody(), "text/html");
		}
	}
	
	private static Address[] addressToInetAddress(List<String> addressList) throws AddressException{
		List<Address> adresses = new ArrayList<Address>();
		for(String address : addressList)
			adresses.add(new InternetAddress(address));
		
		if(adresses.size() > 0){
			Address[] addressArr = new Address[adresses.size()];
			return adresses.toArray(addressArr);
		}
		
		return null;
	}
	
	public static String getOrderReceivedEmailTemplate() throws Exception{
		int orderId = 1;
		OrdersManager ordMgr = new OrdersManagerImpl();
		Orders order = ordMgr.getByKey(orderId);

		OrderLinesManager ordLineMgr = new OrderLinesManagerImpl();
		List<OrderLines> orderLines = ordLineMgr.findByOrderLinesByOrderId(orderId);

		ClassLoaderTemplateResolver resolver = new ClassLoaderTemplateResolver();
		resolver.setTemplateMode("HTML5");
		resolver.setSuffix(".html");
		resolver.setPrefix("templates/");
		TemplateEngine templateEngine = new TemplateEngine();
		templateEngine.setTemplateResolver(resolver);
		final Context context = new Context(Locale.US);
		
		String name =  order.getAddressByBillingAddressId().getFirstName() +
		               " " +
		               order.getAddressByBillingAddressId().getLastName();
		   
		context.setVariable("orderNumber", order.getOrderNumber()); 
		context.setVariable("customer", name); 
		context.setVariable("billingAddress", Utility.getAddress(order.getAddressByBillingAddressId())); 
		context.setVariable("shippingAddress", Utility.getAddress(order.getAddressByShippingAddressId())); 
		context.setVariable("deliveryTime", "NA"); 
		context.setVariable("amount", order.getItemValue()); 
		context.setVariable("comments", order.getComments()); 
		context.setVariable("orderLines", orderLines); 
		// add more objects from your ResultSet
		final String returnHtml = templateEngine.process("orderReceived", context);

		return returnHtml;
	}
	
	public static String getOrderConfirmationEmailTemplate(Orders order) throws Exception{
		ClassLoaderTemplateResolver resolver = new ClassLoaderTemplateResolver();
		resolver.setTemplateMode("HTML5");
		resolver.setSuffix(".html");
		resolver.setPrefix("templates/");
		TemplateEngine templateEngine = new TemplateEngine();
		templateEngine.setTemplateResolver(resolver);
		final Context context = new Context(Locale.US);
		
		context.setVariable("serverAddress", ConfigMgr.getConfiguration().getProperty(IConstants.SERVER_ROOT)); 
		context.setVariable("orderNumber", order.getOrderNumber()); 
		context.setVariable("deliveryCode", order.getDeliveryCode()); 
		final String returnHtml = templateEngine.process("orderConfirmation", context);

		return returnHtml;
	}
}
