package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author TJ
 * 
 * JSP에서 쓰던 자바 값들을 자바파일로 가지고 왔다고 생각하면 됨
 * 그리고, \@WebServlet 이라는 어노테이션으로 JSP에서 받은 값을 자바파일로 가져올 수 있는 것임
 * 그 때 get인지 post인지 처리하는 것이 중요함
 * 
 * (MODEL 1방식 - jsp에서 jsp로 넘기는 것)
 * loginForm.jsp(페이지) -> loginTo.jsp(스크립틀릿) -> jsp페이지에서 자바코딩 -> redirection -> nextpage.jsp 
 *    
 * (MODEL 2방식의 시작 - jsp에서 java로 넘기는 것)  
 * jsp는 값을 받기만 하고 -> servlet으로 redirection -> java에서 자바코딩 -> redirection return -> nextPage.jsp)
 * 즉 servlet이 controller가 된다고 생각하면 됨.
 * 
 */

@WebServlet("/hello")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 4310911333781693362L;

	@Override 
	public void init() throws ServletException { super.init(); }
	
	@Override 
	public void destroy(){ super.destroy(); }
	
	@Override 
	public void doGet(HttpServletRequest req, HttpServletResponse res)  throws IOException, ServletException {
		PrintWriter out = res.getWriter();
		out.println("<html><body>");
		out.println("<h1> Hello World </h1>");
		out.println("</body></html>");
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getMethod();
		if(method.equalsIgnoreCase("get")) { 
			doGet(request, response);
		} else {
			doPost(request, response);
		}
	}
}
