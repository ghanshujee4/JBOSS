package com.tresfocus.ekart.jms;

import javax.jms.JMSException;
import javax.jms.Queue;

import org.apache.log4j.Logger;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Service;

import com.tresfocus.ekart.hibernate.entity.Orders;

@Service
public class EmailMessageSender {
	private JmsTemplate jmsTemplate;
	private Queue emailQueue;
	private static final Logger logger = Logger
			.getLogger(EmailMessageSender.class);

	/**
	 * Sends message using JMS Template.
	 * 
	 * @param message
	 *            the message
	 * @throws JMSException
	 *             the jMS exception
	 */
	public void sendMessage(Orders orderObj) throws JMSException {
		logger.debug("About to put message on queue. Queue["
				+ emailQueue.toString() + "] Message[" + orderObj + "]");
		jmsTemplate.convertAndSend(emailQueue, orderObj);
	}

	/**
	 * Sets the jms template.
	 * 
	 * @param template
	 *            the jms template
	 */
	public void setJmsTemplate(JmsTemplate jmsTemplate) {
		this.jmsTemplate = jmsTemplate;
	}

	/**
	 * Sets the test queue.
	 * 
	 * @param queue
	 *            the email queue
	 */
	public void setEmailQueue(Queue emailQueue) {
		this.emailQueue = emailQueue;
	}
}
