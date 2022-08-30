package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ArtworkService;
import service.BannerService;

@WebServlet("/main")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MainController() {
        super();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doAction(req,resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doAction(req, resp);
	}

	private void doAction(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		System.out.println("confirm");
		
		BannerService bannerService = new BannerService();
		ArtworkService artworkService = new ArtworkService();
		
		req.setAttribute("Banner", bannerService.bannerImage());
		req.setAttribute("mainChu", artworkService.AchuRecommendArt());
		req.setAttribute("mainTag", artworkService.list(""));

		req.setAttribute("", artworkService.toptag());
		req.setAttribute("mainTopTag", artworkService.topTagArt());
		goView(req, resp, "main.jsp");
	}

	void goView(HttpServletRequest req, HttpServletResponse resp, String viewPage) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);
	}
}
