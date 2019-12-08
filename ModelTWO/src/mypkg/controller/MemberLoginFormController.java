package mypkg.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberLoginFormController extends SuperAbstruct implements SuperInterface {
	/*****************************************************
	 * doProcess
	 *****************************************************/
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("회원 로그인 폼으로 이동");
		SuperAbstruct.GetDispatcher(request, response, loginForm_JSP_url);
	}
}
