package mypkg.util;

import java.io.FileInputStream;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import mypkg.controller.SuperInterface;

public class GetProperties extends HttpServlet {
	/*****************************************************
	 * Static
	 *****************************************************/
	private static final long serialVersionUID = 1L;
	
	/*****************************************************
	 * Constructor
	 *****************************************************/
	public GetProperties(Map<String, SuperInterface> actionMaps, String configFilePath) throws ServletException {
		try {
			Properties prop = LoadProperties(configFilePath);
			BindProperties(actionMaps, prop);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*****************************************************
	 * LoadProperties
	 *****************************************************/
	public Properties LoadProperties(String configFilePath) throws Exception {
		/** Load Properties **/
		Properties prop = new Properties();
		FileInputStream fis = new FileInputStream(configFilePath);
		prop.load(fis);
		fis.close();
		
		return prop;
	}
	
	/*****************************************************
	 * BindProperties
	 *****************************************************/
	public void BindProperties(Map<String, SuperInterface> actionMaps, Properties prop) throws Exception {
		/** Put Properties to actionMaps **/
		Iterator<Object> keyIter = prop.keySet().iterator();
		while (keyIter.hasNext()) {
			String command = (String) keyIter.next();
			String handlerClassName = prop.getProperty(command);
			Class<?> handlerClass = Class.forName(handlerClassName);
			SuperInterface handlerInstance = (SuperInterface) handlerClass.newInstance();
			actionMaps.put(command, handlerInstance);
		}
	}
}
