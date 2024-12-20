package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.BoardDeleteProAction;
import action.BoardDetailAction;
import action.BoardListAction;
import action.BoardModifyFormAction;
import action.BoardModifyProAction;
import action.BoardReplyFormAction;
import action.BoardReplyProAction;
import action.BoardWriteProAction;
import vo.ActionForward;



@WebServlet("*.bo")
public class BoardFrontController extends HttpServlet {
	
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		ActionForward forward = null;
		Action action = null;
		
		
		System.out.println("[BoardFrontController] : " + command);
		
		if(command.equals("/241218/board/boardList.bo")) { // list
			
			action = new BoardListAction();
			
			try {
				
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
			}
			
		} else if(command.equals("/241218/board/boardDetail.bo")) { // view
			
			action = new BoardDetailAction();
			
			try {
				
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
			}
			
		} else if(command.equals("/241218/board/boardWriteForm.bo")) { // write
			
			forward = new ActionForward();
			forward.setPath("/241218/board/qna_board_write.jsp");
			
		} else if(command.equals("/241218/board/boardWritePro.bo")) {
			
			action = new BoardWriteProAction();
			
			try {
				
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
			}
			
		} else if(command.equals("/241218/board/boardModifyForm.bo")) { // 게시글 수정 페이지
			
			action = new BoardModifyFormAction();
			
			try {
				
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
			}
			
		} else if(command.equals("/241218/board/boardModifyPro.bo")) { // 게시글 수정 프로세스 
			
			action = new BoardModifyProAction();
			
			try {
				
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
			}
			
		} else if(command.equals("/241218/board/boardDeleteForm.bo")) { // delete form page 
			
			
			String nowPage = request.getParameter("page");
			int bo_num = Integer.parseInt(request.getParameter("bo_num"));
			
			request.setAttribute("page", nowPage);
			request.setAttribute("bo_num", bo_num);
			
			forward = new ActionForward();
			forward.setPath("/241218/board/qna_board_delete.jsp");
			
			
			
		} else if(command.equals("/241218/board/boardDeletePro.bo")) { // delete process 
			
			action = new BoardDeleteProAction();
			
			try {
				
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
			}
			
		} else if(command.equals("/boardReplyForm.bo")) {
			
			action = new BoardReplyFormAction();
			
			try {
				
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
			}
			
		}  else if(command.equals("/241218/board/boardReplyPro.bo")) { 
			
			action = new BoardReplyProAction();
			
			try {
				
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
			}
			
		} 
		
		
		
		if(forward != null) {
			
			if(forward.isRedirect()) {
				
				response.sendRedirect(forward.getPath());
				
			} else {
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
				
			}
			
		}
		
		
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		doProcess(req, resp);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
