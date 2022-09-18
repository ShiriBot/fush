package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import service.MemberService;
import service.PreferenceService;

@WebServlet("/mypage/*")
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyPageController() {
        super();
    }

    @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doAction(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doAction(req, resp);
	}

	private void doAction(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
		String uri =req.getRequestURI();
		String cmd = uri.substring(uri.lastIndexOf("/")+1);
		
		PreferenceService preferenceService = new PreferenceService();
		MemberService memberService = new MemberService();
		String id =(String)req.getSession().getAttribute("sess_id");
		if(cmd.equals("")) {
			goView(req, resp, "/mypage.jsp");
		} else if(cmd.equals("preference")) {
			req.setAttribute("Preference", preferenceService.MyRatingInfo(id));
			req.setAttribute("FavoriteTagCount", preferenceService.MyRatingFavoriteTag());
			req.setAttribute("MostGenre", preferenceService.MyRatingMostGenre(id));
			req.setAttribute("FavoriteGenre", preferenceService.MyRatingFavoriteGenre(id));
			req.setAttribute("CountGenre", preferenceService.MyRatingCountGenre(id));
			req.setAttribute("Platform", preferenceService.MyRatingPlatform(id));
			req.setAttribute("Chart", preferenceService.Chart(id));
			goView(req, resp, "/preference.jsp");
		} else if(cmd.equals("ratedArt")) {
			goView(req, resp, "/checkArt.jsp");
		} else if(cmd.equals("friend")) {
			goView(req, resp, "/friend.jsp");
		} else if(cmd.equals("friendSearch")) {
			Criteria fCri = new Criteria("all","id",req.getParameter("id"));
			PrintWriter out = resp.getWriter();
			System.out.print(memberService.list(fCri).size());
			if(memberService.list(fCri).size()==1) {
		        out.print("ok"); //response    
			}else{
				out.print("no"); //response
			};
			/*goView(req, resp, "/friend.jsp");*/
	}
	
	}
	
	void goView(HttpServletRequest req, HttpServletResponse resp, String viewPage) throws ServletException, IOException{
		RequestDispatcher rd =req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);
	}
}
