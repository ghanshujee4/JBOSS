package com.tresfocus.ekart.util;

import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;

import org.codehaus.jackson.JsonFactory;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.ObjectMapper;

public class JSONUtil {
	/**
	  * Method to get a JSON string representing the object
	  * supplied.
	  * @param object for which JSON string is required
	  * @return Json String
	  * @throws IOException
	  */
	 public static String createJsonString(Object object) throws IOException {
	  Writer writer = new StringWriter();
	  JsonFactory factory = new JsonFactory();
	  JsonGenerator generator = factory.createJsonGenerator(writer);
	  generator.setCodec(new ObjectMapper());
	  generator.writeObject(object);
	  generator.close();
	  System.out.println("Json string " + writer.toString());
	  return writer.toString();
	 }

}
