package mypkg.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/** doProcess(doGet + doPost) => 근데 자바에서 강제로 밀어붙이기 위한 방법이 Interface이다. **/
/** front controller pettern = a하면 a으로 가고 b하면 b로 가는거**/
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
	private Map<String, SuperController> actionMaps =  new HashMap<String, SuperController>();	
	
	/*****************************************************
	 * Constructor
	 *****************************************************/
    public FrontController() { super(); }
    
    /*****************************************************
	 * Init()
	 *****************************************************/
	public void init() throws ServletException {
		
		//configFile 초기화 파라미터 읽기
		String configFile = getInitParameter("configFile");

		//스트림을 통하여 Properties 객체에 넣기
		Properties prop = new Properties();
		FileInputStream fis = null;
		try {
			String configFilePath = getServletContext().getRealPath(configFile);
			fis = new FileInputStream(configFilePath);
			prop.load(fis); //자바의 스트림을 이용하여 Properties 컬렉션에 요소들을 추가한다.
		} catch (IOException e) {
			throw new ServletException(e);
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException ex) {}
			}
		}
		
		//prop 객체를 Iterator를 이용하여 map 객체에 담기
		Iterator<Object> keyIter = prop.keySet().iterator();
		while (keyIter.hasNext()) {
			String command = (String) keyIter.next();
			
			//handlerClassName는 클래스 정보를 담고 있는 문자열
			String handlerClassName = prop.getProperty(command);
			try {
				//문자열을 객체로 만들어준다.
				Class<?> handlerClass = Class.forName(handlerClassName);
				//각 요청 업무에 따르는 Controller들은 SuperController의 하위 클래스이다. 
				SuperController handlerInstance = (SuperController) handlerClass.newInstance();
				
				//객체로 만들어서 자바의 맵 구조에 추가한다.
				actionMaps.put(command, handlerInstance);
			} catch (ClassNotFoundException e) {
				throw new ServletException(e);
			} catch (InstantiationException e) {
				throw new ServletException(e);
			} catch (IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
		System.out.println( "맵 사이즈 : " + actionMaps.size());
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
	 *****************************************************/
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		
			//파일 업로드를 이용하기 위하여 multipart/form-data을 사용하게 되면
			//request 객체를 직접 이용하지 못한다.
			//파라미터 command를 챙긴다.
			String command = request.getParameter("command");
			if( command == null ){		
			}
			//해당 커맨드에 맞는 컨트롤러를 찾아서 해당 컨트롤러의 doProcess() 메소드를 호출한다.
			//map 객체에서 해당 command에 해당하는 Controller 객체를 얻어 낸다.
			SuperController controller = actionMaps.get(command);
			if(controller != null){
				try {
					controller.doProcess( request, response );
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				System.out.println("요청하신 커멘트는 없습니다");
			}
		}	
}
