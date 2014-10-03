package com.tresfocus.ekart;

public class IConstants {
	public static final String ALL = "ALL";

	/*     OPERATION Types      */
	public static final String OPERATION_UPSERT = "UPSERT";
	public static final String OPERATION_DELETE = "DELETE";
	public static final String OPERATION_FIND = "FIND";
	
	/*     ORDER State      */
	public static final String ORDER_STATUS_DRAFT = "DRAFT";
	public static final String ORDER_STATUS_ORDERED = "ORDERED";
	public static final String ORDER_STATUS_CONFIRMED = "CONFIRMED";
	public static final String ORDER_STATUS_PACKAGING = "PACKAGING";
	public static final String ORDER_STATUS_READY_FOR_DELIVERY = "READY_FOR_DELIVERY";
	public static final String ORDER_STATUS_OUT_FOR_DELIVERY = "OUT_FOR_DELIVERY";
	public static final String ORDER_STATUS_DELIVERED = "DELIVERED";
	public static final String ORDER_STATUS_REJECTED = "REJECTED";
	
	/*  Lookup Types   */
	public static final String LOOKUP_TYPE_ORDER_STATUS = "ORDER_STATUS";
	
	/*  Email  */
	public static final String EMAIL_USER = "mail.user";
	public static final String EMAIL_PASSWORD = "mail.password";
	public static final String EMAIL_SMTP_HOST = "mail.smtp.host";
	public static final String EMAIL_SMTP_PORT = "mail.smtp.port";
	public static final String EMAIL_SMTP_START_TLS = "mail.smtp.starttls.enable";
	public static final String EMAIL_SMTP_AUTH = "mail.smtp.auth";
	public static final String EMAIL_REPLY_TO = "mail.reply.to";
	public static final String EMAIL_FROM = "mail.from";
	public static final String EMAIL_SMTP_SOCKETFACTORY_PORT = "mail.smtp.socketFactory.port";
	public static final String EMAIL_SMTP_SOCKETFACTORY_CLASS = "mail.smtp.socketFactory.class";
	
	public static final String ACTIVEMQ_HOST = "activemq.host";
	public static final String ACTIVEMQ_PORT = "activemq.port";

	public static final int DEFAULT_SECURITY_TOKEN_LENGTH = 15;
	public static final String SECURITY_TOKEN_LENGTH = "security.token.length";

	public static final String SERVER_ROOT = "server.root";

	public static final String SESSION_USER = "__user";
	public static final String ADMIN_USER = "admin";
	public static final String MULE_DAEMON_USER = "mule_daemon";
	public static final String SESSION_SHOPPING_CART = "shoppingCart";

	public static final String RETAILER = "RETAILER";
	public static final String CUSTOMER = "CUSTOMER";
	
	public static final int COUNTRY_INIDA = 99;
	
	public static final String ROLE_ADMIN = "ROLE_ADMIN";
	public static final String ROLE_USER = "ROLE_USER";
	public static final String ROLE_CUSTOMER = "ROLE_CUSTOMER";
	public static final String ROLE_RETAILER = "ROLE_RETAILER";
	
	public static final String GROCERY_BT = "GROCERY";
	public static final String PHARMACY_BT = "PHARMACY";
	public static final String TOYS_BT = "TOYS";
	public static final String BABYSHOP_BT = "BABYSHOP";
	
}
