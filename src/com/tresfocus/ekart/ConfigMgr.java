package com.tresfocus.ekart;

import java.io.InputStream;
import java.util.Properties;

public class ConfigMgr {
	private static Properties configProps;
	
	public static Properties getConfiguration() throws Exception{
		if(configProps == null){
			InputStream configStream = ConfigMgr.class.getClassLoader().getResourceAsStream("config.xml");
			if(configStream != null ){
				configProps = new Properties();
				configProps.loadFromXML(configStream);
			}else{
				throw new Exception("Configuration file not found.");
			}
		}
		
		return configProps;
	}
}
