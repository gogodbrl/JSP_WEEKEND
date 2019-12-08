package mypkg.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypkg.bean.Member;
import mypkg.dao.MemberDao;

public class MemberListController extends SuperAbstruct implements SuperInterface {
	/*****************************************************
	 * doProcess
	 *****************************************************/
	@Override
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberDao dao = new MemberDao();
		
		List<Member> lists = dao.SelectAll();
		
		/** LIST BINDING **/
		request.setAttribute("lists", lists);
		
		SuperAbstruct.GetDispatcher(request, response, list_JSP_url);
	}
}
