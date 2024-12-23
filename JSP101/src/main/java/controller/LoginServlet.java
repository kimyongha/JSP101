package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.LoginService;
import vo.Member;



@WebServlet("/241218/member/login")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doPost(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String mb_id = req.getParameter("mb_id");
		String mb_passwd = req.getParameter("mb_passwd");
		
		LoginService loginService = new LoginService();
		Member loginMember = loginService.getLoginMember(mb_id, mb_passwd);
		
		if(loginMember != null) {
			
			HttpSession session = req.getSession();
			session.setAttribute("mb_id", loginMember.getId());
			session.setAttribute("mb_name", loginMember.getName());
			session.setAttribute("mb_gender", loginMember.getGender());
			session.setAttribute("mb_age", loginMember.getAge());
			session.setAttribute("mb_addr", loginMember.getAddr());
			session.setAttribute("mb_nation", loginMember.getNation());

			resp.sendRedirect("/241218/index.jsp");
			
		} else {
			
			resp.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = resp.getWriter();
			String msg = "<script>";
			msg += "alert(`로그인에 실패하였습니다.\n다시 로그인 해주세요.`); ";
			msg += "history.back(); ";
			msg += "</script>;";
			
			out.println(msg);
			out.close();
			
			
		}
	
	
	
	
	
	
	
	}
	
	
	
	
	

}
