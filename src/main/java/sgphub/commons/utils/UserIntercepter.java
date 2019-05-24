package sgphub.commons.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class UserIntercepter implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		System.out.println("拦截器工作");
		if (request.getSession().getAttribute("userInfo")==null) {
			response.sendRedirect(request.getServletContext().getContextPath()+"/UI/user/login.jsp");
			System.out.println("非法访问资源");
			return false;
		}else {
			System.out.println("正常访问资源");
			return true;
		}
	}
	
	
}
