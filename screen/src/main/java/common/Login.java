package common;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI(); //프로젝트+파일명
		String path = request.getContextPath(); //프로젝트 패스
		StringBuffer url = request.getRequestURL(); //전체 경로
		String file = request.getServletPath(); //파일명만
		
		String cmd = uri.substring(uri.lastIndexOf("/")+1);
		System.out.println("uri : " +uri+", cmd : "+cmd+", url:"+url+", path:"+path+", file:"+file);
		
		
		MemberDao memberDao = new MemberDao();
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		Map<String, String> status =  memberDao.login(id, pw);
		switch (status.get("loginStatus")) {
		case "ok":
			//세션설정
			session.setAttribute("sess_id", id);
			session.setAttribute("sess_name", status.get("name"));
			session.setAttribute("login_time", session.getCreationTime());
			if(status.get("auth")=="manager") {
				request.setAttribute("msg","loginOk");
				response.sendRedirect("/admin/home");
				System.out.println("관리자 로그인");
			}else {
				//로그인에는 성공했지만 권한이 없는 경우에는 사용자 화면으로 쫓아내기
				request.setAttribute("msg","authFail");
				response.sendRedirect("/");
				System.out.println("권한없음");
			}
			break;
		default:
			request.setAttribute("msg","loginFail");
			//로그인실패
			System.out.println("로그인실패");
			response.sendRedirect("/");
			break;
		}
	}
}
