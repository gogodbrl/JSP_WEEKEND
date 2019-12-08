package mypkg.util;

import java.io.FileInputStream;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import mypkg.controller.SuperController;

@WebServlet(
		initParams = { 
			@WebInitParam(name = "configFile", value = "/WEB-INF/commandList.properties")
})
public class GetProperties extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public GetProperties(Map<String, SuperController> actionMaps) throws ServletException {
		try {
			Properties prop = LoadProperties();
			BindProperties(actionMaps, prop);
			System.out.println( "맵 사이즈 : " + actionMaps.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Properties LoadProperties() throws Exception {
		/** Load Properties **/
		String configFile = getInitParameter("configFile");
		String configFilePath = getServletContext().getRealPath(configFile);
		
		Properties prop = new Properties();
		FileInputStream fis = new FileInputStream(configFilePath);
		prop.load(fis);
		fis.close();
		
		return prop;
	}
	
	public Map<String, SuperController> BindProperties(Map<String, SuperController> actionMaps, Properties prop) throws Exception {
		/** Put Properties to actionMaps **/
		Iterator<Object> keyIter = prop.keySet().iterator();
		while (keyIter.hasNext()) {
			String command = (String) keyIter.next();
			String handlerClassName = prop.getProperty(command);
			Class<?> handlerClass = Class.forName(handlerClassName);
			SuperController handlerInstance = (SuperController) handlerClass.newInstance();
			actionMaps.put(command, handlerInstance);
		}
		return null;
	}
}
