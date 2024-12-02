package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LoginBean;

public class ControllerServlet extends HttpServlet {

	
	protected static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doPost(req, resp);
		
		
	}
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		resp.setContentType("text/html; charset=utf-8");
		
		String id = req.getParameter("id");
		String passwd = req.getParameter("passwd");
		
		
		System.out.println(id + " " + passwd);
		
		
		LoginBean bean = new LoginBean();
		bean.setId(id);
		bean.setPasswd(passwd);
		
		req.setAttribute("bean", bean);
		
		boolean status = bean.validator();
		
		System.out.println(status);
		
		
		if(status) {
			
			RequestDispatcher rd = req.getRequestDispatcher("/241202/mvc_success.jsp");
			rd.forward(req, resp);
			
		} else {
			
			RequestDispatcher rd = req.getRequestDispatcher("/241202/mvc_error.jsp");
			rd.forward(req, resp);
			
		}
		
		
	}
	
	
	
	

	
	

}
