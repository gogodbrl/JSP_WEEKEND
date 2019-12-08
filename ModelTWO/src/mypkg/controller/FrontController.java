package mypkg.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypkg.util.GetProperties;

/** doProcess(doGet + doPost) => 근데 자바에서 강제로 밀어붙이기 위한 방법이 Interface이다. **/
/** front controller pettern = a하면 a으로 가고 b하면 b로 가는거**/

/**
 * 1. Config에 추가한다.
 * 2. Controller를 추가한다.
 * 3. Controller에서 값을 받아서 처리한다.
 * 4. 다시 JSP 페이지로 보낸다.
 */
@WebServlet(
		urlPatterns = { "/MiniShopCtrl" }, 
		initParams = { 
				@WebInitParam(name = "configFile", value = "/WEB-INF/commandList.properties")
		})
public class FrontController extends HttpServlet {
	/*****************************************************
	 * Static
	 *****************************************************/
	private static final long serialVersionUID = 1L;
	
	/*****************************************************
	 * Value
	 *****************************************************/
	private Map<String, SuperInterface> actionMaps =  new HashMap<String, SuperInterface>();
	private String configFile = "";
	
	/*****************************************************
	 * Constructor
	 *****************************************************/
    public FrontController() { super(); }
    
    /*****************************************************
	 * Init
	 *****************************************************/
	public void init() throws ServletException {
		
		/** init이 실행되었을 때 읽는 것으로 보인다. **/
		configFile = getInitParameter("configFile");
		String configFilePath = getServletContext().getRealPath(configFile);
		
		/** Get Properties **/
		new GetProperties(actionMaps, configFilePath);
		System.out.println("[ACTION MAP] : " + actionMaps);
	}

	 /*****************************************************
	 * doGet()
	 *****************************************************/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			doProcess(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	 /*****************************************************
	 * doPost()
	 *****************************************************/
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			doProcess(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*****************************************************
	 * doProcess()
	 * 해당 커맨드에 맞는 컨트롤러를 찾아서 해당 컨트롤러의 doProcess() 메소드를 호출한다.
	 * map 객체에서 해당 command에 해당하는 Controller 객체를 얻어 낸다.
	 *****************************************************/
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String command = request.getParameter("command");
		SuperInterface controller = actionMaps.get(command);
		if(controller != null){
			try {
				controller.doProcess(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("요청하신 커멘트가 없습니다");
			System.out.println("Command : " + command);
		}
	}	
}
