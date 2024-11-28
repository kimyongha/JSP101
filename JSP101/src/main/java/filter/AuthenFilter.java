package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class AuthenFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
		System.out.println("filter01 초기화");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		
		
		System.out.println("filter01.jsp 수행");
		String name = request.getParameter("name");
		
		if(name == null || name.equals("")) {
			
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html, charset=UTF-8");
			PrintWriter writer = response.getWriter();
			
			String msg = "입력된 name 값은 null...";
			
			writer.println(msg);
			
		}
		
		chain.doFilter(request, response);
		
	}

	
	@Override
	public void destroy() {
		
		System.out.println("filter01 해제");
		
	}


}
