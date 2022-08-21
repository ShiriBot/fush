package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/manage/*")
public class ManageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;

    public ManageController() {
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession();
		
		String uri = request.getRequestURI(); //프로젝트+파일명
		String path = request.getContextPath(); //프로젝트 패스
		StringBuffer url = request.getRequestURL(); //전체 경로
		String file = request.getServletPath(); //파일명만
		
		String cmd = uri.substring(uri.lastIndexOf("/")+1);
		System.out.println("uri : " +uri+", cmd : "+cmd+", url:"+url+", path:"+path+", file:"+file);
		
		String loginStatus = (String)session.getAttribute("loginStatus");
		
		if(cmd.equals("login")) {
			goView(request, response, "/manage/manage_login.jsp");
		}else {
			if(!cmd.equals("manage_login.jsp")){
				if(loginStatus==null) {
					response.sendRedirect("/manage/login");
				}else if(!loginStatus.equals("manager")) {
					response.sendRedirect("/manage/login");
				}
			}
		}
		/*response.getWriter().append("Served at: ").append(request.getContextPath());*/
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	void goView(HttpServletRequest req, HttpServletResponse resp, String viewPage) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);
	}

}
