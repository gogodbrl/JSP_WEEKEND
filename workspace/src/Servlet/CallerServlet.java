package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.InitParam;

/**
page : 거의 안씀??
session : 로그인정보, 장바구니 정보
request : 왠만한 모든 데이터들
application : 전역변수로 넣어야 될 값들
**/

@WebServlet(
	urlPatterns = {"/aaa.do" },
	initParams = {
			@WebInitParam(name = "company", value = "대한 리서치", description = "description"),
			@WebInitParam(name = "manager", value = "김대희"),
			@WebInitParam(name = "melong", value = "메롱"),
			@WebInitParam(name = "phone", value = "02-555-6666")
	}
)
public class CallerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	String company;
	String manager;
	String melong;
	String phone;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		this.company = config.getInitParameter("company") ;
		this.manager = config.getInitParameter("manager") ;
		this.melong = config.getInitParameter("melong") ;
		this.phone = config.getInitParameter("phone") ;
	}
	
	public CallerServlet() { }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String gender = request.getParameter("gender");
		String _singer = request.getParameter("singer");
		
		String singer = "" ;
		
		if(_singer.equalsIgnoreCase("1")) {
			singer = "박진영";
		} else if ( _singer.equalsIgnoreCase("2")) {
			singer = "에이 핑크";
		} else {
			singer = "이문세";
		}
		
		String[] _hobby = request.getParameterValues("hobby");
		String hobbies =  "";
		
		if(_hobby == null ) {
			hobbies = "체크 좀 해주세요";
		} else {
			for(int i=0; i < _hobby.length; i++ ) {
				hobbies += _hobby[i] + ", " ;
			}
		}
		
		InitParam params = new InitParam() ;
		params.setCompany(company); 
		params.setManager(manager); 
		params.setMelong(melong);
		params.setPhone(phone); 
		
		HttpSession session = request.getSession() ;
		
		session.setAttribute("xxx", params);
		
		request.setAttribute("gender", gender);
		request.setAttribute("singer", singer);
		request.setAttribute("hobbies", hobbies);		
		
		String gotourl = "/servlet/Caller.jsp" ;
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(gotourl) ;
		dispatcher.forward(request, response); 		
	}
}	