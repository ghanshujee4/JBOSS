package com.tresfocus.ekart.web.listener;

import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.annotation.WebListener;

import org.apache.activemq.broker.BrokerService;
import org.apache.log4j.Logger;

import com.tresfocus.ekart.ConfigMgr;
import com.tresfocus.ekart.IConstants;

@WebListener
public class ContextListener implements javax.servlet.ServletContextListener {
	private static final Logger logger = Logger
			.getLogger(ContextListener.class);
	@Override
	public void contextInitialized(ServletContextEvent contextEvent) {
		
		BrokerService broker = new BrokerService();  
//		 configure the broker  
		try {
			Properties configProp = ConfigMgr.getConfiguration();
			String host = configProp.getProperty(IConstants.ACTIVEMQ_HOST);
			String port = configProp.getProperty(IConstants.ACTIVEMQ_PORT);

			broker.addConnector("tcp://" + host + ":" + port);
			broker.getSystemUsage().setSendFailIfNoSpace(true);
			broker.getSystemUsage().setSendFailIfNoSpaceAfterTimeout(5000);

			// Limit memory usage to 50MB
			broker.getSystemUsage().getMemoryUsage().setLimit(50 * 1024 * 1024);
			broker.getSystemUsage().getTempUsage().setLimit(50 * 1024 * 1024);
			broker.start();  
			contextEvent.getServletContext().setAttribute("mqBroker", broker);
		} catch (Exception e) {
			logger.error("Error Starting AMQ Broker", e);
		}  
	}

	@Override
	public void contextDestroyed(ServletContextEvent contextEvent) {
		BrokerService broker = (BrokerService) contextEvent.getServletContext().getAttribute("mqBroker");
		if(broker != null){
			try {
				broker.stop();
			} catch (Exception e) {
				logger.error("Error Stoping AMQ Broker", e);
			}
		}
	}
}
