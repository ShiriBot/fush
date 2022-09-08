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
import dto.Criteria;
import dto.Member;
import dto.Page;
import dto.TagDto;
import service.ArtworkService;
import service.MemberService;
import service.StatisticsService;
import service.TagService;

@WebServlet("/admin/*")
public class ManageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberService memberService = new MemberService();
	ArtworkService artworkService = new ArtworkService();
	TagService tagService = new TagService();
	StatisticsService statisticsService = new StatisticsService();
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
		
		if(cmd.equals("home")){
			Map<String, Integer> statistics = statisticsService.manageMainStatistics();
			request.setAttribute("statistics",statistics);
			goView(request, response, "/manage/manage_index.jsp");
		}else if(cmd.equals("tag")){
			TagDto[] tagList =tagService.tagList();
			request.setAttribute("tagList", tagList);
			request.setAttribute("msg", request.getAttribute("msg"));
			goView(request, response, "/manage/manage_tags.jsp");
		}else if(cmd.equals("tagInsert")){
			request.setAttribute("msg", tagService.insert(request.getParameter("tagName")));
			goView(request, response, "/admin/tag");
		}else if(cmd.equals("tagModify")){
			request.setAttribute("msg", tagService.modify(request.getParameter("seqno"),request.getParameter("newName")));
			goView(request, response, "/admin/tag");
		}else if(cmd.equals("tagDelete")){
			tagService.delete(request.getParameter("seqno"));
			goView(request, response, "/admin/tag");
		}else{
			String length=request.getParameter("length");
			String currentPage=request.getParameter("currentPage");
			String searchField=request.getParameter("searchField");
			String keyword = request.getParameter("keyword");
			
			if(request.getParameter("currentPage")==null) currentPage="1";
			if(request.getParameter("length")==null) length="10";
			
			if(cmd.equals("member")) {
				String kind=request.getParameter("kind");
				if(request.getParameter("kind")==null) kind="all";
				if(searchField==null) searchField="id"; 
				Criteria mCri = new Criteria(kind,length,currentPage,searchField,keyword);
			
				List<Member> members = memberService.list(mCri);
				request.setAttribute("members",new Page(members.size(),mCri,members));
				request.setAttribute("criteria",mCri);
				goView(request, response, "/manage/manage_members.jsp");
			}else if(cmd.equals("artwork")){
				if(searchField==null) searchField="name";
				Criteria aCri = new Criteria(null,length,currentPage,searchField,keyword);
				List<Artwork> artList = artworkService.list(aCri);
				
				request.setAttribute("artworkList",new Page(artList.size(),aCri,artList));
				request.setAttribute("criteria",aCri);
				goView(request, response, "/manage/manage_arts.jsp");
			}else if(cmd.equals("artworkRequest")){
				if(searchField==null) searchField="name";
				Criteria aCri = new Criteria("request",length,currentPage,searchField,keyword);
				List<Artwork> artRequest = artworkService.list(aCri);
				
				request.setAttribute("artRequest", artRequest);
				request.setAttribute("criteria",aCri);
				goView(request, response, "/manage/manage_arts_request.jsp");
			}
		}
		

	}
	
	void goView(HttpServletRequest req, HttpServletResponse resp, String viewPage) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);
	}

}
