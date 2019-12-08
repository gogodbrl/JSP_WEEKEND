package mypkg.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface SuperController {
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
