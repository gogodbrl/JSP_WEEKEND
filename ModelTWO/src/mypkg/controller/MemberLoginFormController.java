package mypkg.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberLoginFormController implements SuperController {
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("회원 로그인 폼으로 이동");
		String url = "/member/loginForm.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
