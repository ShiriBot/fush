package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Artwork;
import dto.Member;
import service.ArtworkService;
import service.MemberService;

@WebServlet("/admin/*")
public class ManageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberService memberService = new MemberService();
	ArtworkService artworkService = new ArtworkService();
	HttpSession session;

    public ManageController() {
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		session = request.getSession();
		
		String uri = request.getRequestURI(); //프로젝트+파일명
		String path = request.getContextPath(); //프로젝트 패스
		StringBuffer url = request.getRequestURL(); //전체 경로
		String file = request.getServletPath(); //파일명만
		
		String cmd = uri.substring(uri.lastIndexOf("/")+1);
		System.out.println("uri : " +uri+", cmd : "+cmd+", url:"+url+", path:"+path+", file:"+file);
		
		if(cmd.equals("login")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			Map<String, String> status =  memberService.login(id, pw);
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
				goView(request, response, "/manage/manage_login.jsp");
				System.out.println("로그인실패");
				break;
			}
		}else if(cmd.equals("home")){
			Map<String, Integer> statistics = memberService.statistics();
			request.setAttribute("statistics",statistics);
			System.out.print(request.getAttribute("statistics"));
			goView(request, response, "/manage/manage_index.jsp");
		}else if(cmd.equals("member")){
			Map<String, List<Member>> lists = memberService.list();
			request.setAttribute("allMembers",lists.get("allMembers"));
			request.setAttribute("newMembers",lists.get("newMembers"));
			request.setAttribute("delMembers",lists.get("delMembers"));
			goView(request, response, "/manage/manage_members.jsp");
		}else if(cmd.equals("artwork")){
			List<Artwork> artList = artworkService.list("all");
			request.setAttribute("artList", artList);
			goView(request, response, "/manage/manage_arts.jsp");
		}else if(cmd.equals("artworkRequest")){
			List<Artwork> artRequest = artworkService.list("request");
			request.setAttribute("artRequest", artRequest);
			goView(request, response, "/manage/manage_arts_request.jsp");
		}else if(cmd.equals("tag")){
			goView(request, response, "/manage/manage_tags.jsp");
		}
		

	}
	
	void goView(HttpServletRequest req, HttpServletResponse resp, String viewPage) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);
	}

}