package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;
import service.PreferenceService;

@WebServlet("/mypage/*")
public class PreferenceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PreferenceController() {
        super();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doAction(req,resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doAction(req, resp);
	}

	private void doAction(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
		String uri =req.getRequestURI();
		String cmd = uri.substring(uri.lastIndexOf("/")+1);
		
		PreferenceService preferenceService = new PreferenceService(); 
		String id =(String)req.getSession().getAttribute("sess_id");
		if(cmd.equals("")) {
			goView(req, resp, "/mypage.jsp");
		} else if(cmd.equals("preference")) {
			req.setAttribute("Preference", preferenceService.MyRatingInfo(id));
			req.setAttribute("FavoriteTag", preferenceService.MyRatingFavoriteTag());
			goView(req, resp, "/preference.jsp");
		}
	
	}
	
	void goView(HttpServletRequest req, HttpServletResponse resp, String viewPage) throws ServletException, IOException{
		RequestDispatcher rd =req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);
	}
}
