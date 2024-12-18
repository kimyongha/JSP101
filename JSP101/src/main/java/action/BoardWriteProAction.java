package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import vo.ActionForward;
import vo.BoardBean;

public class BoardWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {


		ActionForward forward = null;
		BoardBean boardBean = null;
		
		String realFolder = "";
		String saveFolder = "";
		
		int fileSize = 5 * 1024 * 1024;
		
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		
		MultipartRequest multi = new MultipartRequest(request,
				realFolder,
				fileSize,
				"UTF-u",
				new DefaultFileRenamePolicy()
				
				);
		
		
		
		boardBean = new BoardBean();
		boardBean.setBo_name(multi.getParameter("bo_name"));
		boardBean.setBo_pass(multi.getParameter("bo_pass"));
		boardBean.setBo_subject(multi.getParameter("bo_subject"));
		boardBean.setBo_content(multi.getParameter("bo_content"));
		
		boardBean.setBo_file(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
		
		
		
		

		BoardWriteProService boardProService = new BoardWriteProService();
		boolean isWriteSuccess = boardProService.registArticle(boardBean);
				
		
		
		if(isWriteSuccess) {
			
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
			
			String msg = "<script>";
			msg += "alert('등록실패');";
			msg += "history.back();";
			msg += "</script>";
			out.println(msg);
	
			
		} else {
			
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("/boardList.bo");
			
		}
		
		return forward;;
		
		
	}
	
	
	

}
