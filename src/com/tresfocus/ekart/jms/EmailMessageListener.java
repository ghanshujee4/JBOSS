package com.tresfocus.ekart.jms;

import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.ObjectMessage;
import org.apache.log4j.Logger;

import com.tresfocus.ekart.Utility;
import com.tresfocus.ekart.hibernate.entity.Orders;

public class EmailMessageListener implements MessageListener {
	private static final Logger logger = Logger
			.getLogger(EmailMessageListener.class);

	/**
	 * Method implements JMS onMessage and acts as the entry point for messages
	 * consumed by Springs DefaultMessageListenerContainer. When
	 * DefaultMessageListenerContainer picks a message from the queue it invokes
	 * this method with the message payload.
	 */
	public void onMessage(Message message) {
		logger.debug("Received message from queue [" + message + "]");

		/* The message must be of type TextMessage */
		if (message instanceof ObjectMessage) {
			try {
				Orders orderObj = (Orders) ((ObjectMessage) message).getObject();
				logger.debug("Order obj received:" + orderObj);
				Utility.sendDeliveryTokenToCustomer(orderObj);
			} catch (Exception e) {
				String errMsg = "An error occurred extracting message";
				logger.error(errMsg, e);
			}
		} else {
			String errMsg = "Message is not of expected type ObjectMessage";
			logger.error(errMsg);
			throw new RuntimeException(errMsg);
		}
	}
}
