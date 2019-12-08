package mypkg.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypkg.bean.Member;
import mypkg.dao.MemberDao;

public class MemberDetailViewController extends SuperAbstruct implements SuperInterface {
	/*****************************************************
	 * doProcess
	 *****************************************************/
	@Override
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id = request.getParameter("id");
		
		MemberDao dao = new MemberDao();
		Member member = dao.GetMemberById(id);
		
		request.setAttribute("member", member);
		
		SuperAbstruct.GetDispatcher(request, response, detail_JSP_url);
	}
	
}
