package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ArtworkService;
import service.TagService;


@WebServlet("*.so")
public class TagController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TagController() {
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
		TagService tagService = new TagService();
		ArtworkService artworkService = new ArtworkService();
		
		if(cmd.equals("search.so")) {
			req.setAttribute("searchList", tagService.tagList());
			goView(req,resp,"/search.jsp");
		}else if(cmd.equals("searchTag.so")) {
		      String tag = req.getParameter("tag");
		      req.setAttribute("artList", artworkService);
		      goView(req, resp, "/search.jsp");
		}
		
	}
	
	void goView(HttpServletRequest req, HttpServletResponse resp, String viewPage) throws ServletException, IOException{
		RequestDispatcher rd =req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);
	}

}
