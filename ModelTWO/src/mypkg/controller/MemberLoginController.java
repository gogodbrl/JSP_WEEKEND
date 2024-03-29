package mypkg.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypkg.bean.Member;
import mypkg.dao.MemberDao;

public class MemberLoginController extends SuperAbstruct implements SuperInterface {
	/*****************************************************
	 * doProcess
	 *****************************************************/
	@Override
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		System.out.println(id + "/" + password);
		
		Member mem = new Member();
		mem.setId(id);
		mem.setPassword(password);
		
		MemberDao dao = new MemberDao();
		Member member = dao.GetMemberInfomation(mem);
		
		if(member == null) {
			System.out.println("로그인 실패");
		} else {
			System.out.println("로그인 성공");
			
			HttpSession session = request.getSession();
			session.setAttribute("loginfo", member);
		}
		SuperAbstruct.GetDispatcher(request, response, loginSuccess_JSP_url);
	}
}

