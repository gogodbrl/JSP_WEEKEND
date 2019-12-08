package mypkg.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypkg.dao.MemberDao;

public class MemberDeleteController extends SuperAbstruct implements SuperInterface {
	/*****************************************************
	 * doProcess
	 *****************************************************/
	@Override
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		
		MemberDao dao = new MemberDao();
		
		int cnt = -1;
		cnt = dao.DeleteDate(id);
		
		if(cnt == -1) {
			SuperAbstruct.GetDispatcher(request, response, list_JSP_url);
		} else {
			SuperAbstruct.GetDispatcher(request, response, delete_JSP_url);
		}
	}
}
