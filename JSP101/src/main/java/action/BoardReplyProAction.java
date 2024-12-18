package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;
import vo.BoardBean;

public class BoardReplyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		ActionForward forward = null;
		String nowPage = request.getParameter("page");
		
		BoardBean article = new BoardBean();
		article.setBo_num(Integer.parseInt(request.getParameter("bo_num")));
		article.setBo_name(request.getParameter("bo_name"));
		article.setBo_pass(request.getParameter("bo_pass"));
		article.setBo_subject(request.getParameter("bo_subject"));
		article.setBo_content(request.getParameter("bo_content"));
		
		article.setBo_re_ref(Integer.parseInt(request.getParameter("bo_re_ref")));
		article.setBo_re_lev(Integer.parseInt(request.getParameter("bo_re_lev")));
		article.setBo_re_seq(Integer.parseInt(request.getParameter("bo_re_seq")));
		
		
		BoardReplyProService boardReplyProService = new BoardReplyService();
		boolean isReplySuccess = boardReplyProService.replyArticle(article);
		
		if(isReplySuccess) {
			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("/boardList.bo?page="+ nowPage);
			
		} else {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			String msg = "<script>";
			msg += "alert('댓글 등록에 실패하였습니다.'); ";
			msg += "history.back(); ";
			msg += "</script>";
			
			out.println(msg);
			
		}
		
		
		
		
		return forward;
	}

}
