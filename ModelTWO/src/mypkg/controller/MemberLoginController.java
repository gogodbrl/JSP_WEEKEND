package mypkg.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypkg.bean.Member;
import mypkg.dao.MemberDao;

public class MemberLoginController implements SuperController {

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
		
		String url = "";
		if(member == null) {
			System.out.println("로그인 실패");
			url = "/member/loginForm.jsp";
		} else {
			System.out.println("로그인 성공");
			
			HttpSession session = request.getSession();
			session.setAttribute("loginfo", member);
			url = "/member/loginSuccess.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}

