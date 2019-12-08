package mypkg.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SuperInterface {
	/*****************************************************
	 * Static
	 *****************************************************/
	public static final String list_JSP_url 			= "/member/list.jsp";
	public static final String loginSuccess_JSP_url 	= "/member/loginSuccess.jsp";
	public static final String loginForm_JSP_url 		= "/member/loginForm.jsp";
	public static final String updateForm_JSP_url 		= "/member/updateForm.jsp";
	public static final String detail_JSP_url 			= "/member/detail.jsp";
	public static final String delete_JSP_url 			= "/member/delete.jsp";
	
	/*****************************************************
	 * Interface
	 *****************************************************/
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
