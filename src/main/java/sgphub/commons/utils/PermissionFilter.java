package sgphub.commons.utils;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PermissionFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		HttpSession  session= request.getSession();
		if (request.getRequestURI().contains("admin")) {
			chain.doFilter(request, response);
			
		}else if (session.getAttribute("userInfo")==null) {
			if (request.getRequestURI().contains("index")||request.getRequestURI().contains("login")
					||request.getRequestURI().contains("Login")||request.getRequestURI().contains("find")||request.getRequestURI().contains("register")) {
				chain.doFilter(request, response);
			}else {
				response.sendRedirect(request.getContextPath()+	"/index.jsp");
			}
		}else {
			chain.doFilter(request, response);

			
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("加载过滤器");

	}

}
