package mypkg.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class SuperAbstruct {
	/*****************************************************
	 * GetDispatcher
	 *****************************************************/
	protected static void GetDispatcher(HttpServletRequest request, HttpServletResponse response, String url) {
		try {
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
