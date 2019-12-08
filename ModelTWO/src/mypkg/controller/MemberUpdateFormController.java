package mypkg.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypkg.bean.Member;
import mypkg.dao.MemberDao;

public class MemberUpdateFormController extends SuperAbstruct implements SuperInterface {
	/*****************************************************
	 * doProcess
	 *****************************************************/
	@Override
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		
		Member member = new Member();
		member.setId(id);
		member.setName(name);
		member.setPassword(password);
		
		MemberDao dao = new MemberDao();
		
		int cnt = -1;
		cnt = dao.UpdateData(member);
		
		if(cnt == -1) {
			SuperAbstruct.GetDispatcher(request, response, list_JSP_url);
		} else {
			SuperAbstruct.GetDispatcher(request, response, updateForm_JSP_url);
		}
		
		
	}

}
