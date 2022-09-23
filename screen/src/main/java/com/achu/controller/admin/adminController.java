package com.achu.controller.admin;

	import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
	import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
	import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.achu.dao.MemberDao;


		@Controller
	public class adminController {
			private static final Logger logger = LoggerFactory.getLogger(adminController.class);
		@Autowired
		MemberDao memberDao;
		
		@RequestMapping(value = "/", method = RequestMethod.GET)
		private String admin() {
			return "ahome";
		}
		
		@RequestMapping(value = "amain", method = RequestMethod.POST)
		public String log(@ModelAttribute("id") String id,
						@ModelAttribute("pw") String pw,
						@ModelAttribute("type") String type,
						HttpSession session,
						RedirectAttributes ra) {
			Map<String, String> status =  memberDao.login(id, pw);
			String viewPage = null;		
			switch (status.get("loginStatus")) {
			case "ok":
			//세션설정
			session.setAttribute("sess_id", id);
			session.setAttribute("sess_name", status.get("name"));
			session.setAttribute("login_time", session.getCreationTime());
			if(status.get("auth")=="manager") {
				ra.addFlashAttribute("msg","loginOk");
				viewPage= "redirect:/admin/amain";
				System.out.println("관리자 로그인");
			}else {
				//로그인에는 성공했지만 권한이 없는 경우에는 사용자 화면으로 쫓아내기
				ra.addFlashAttribute("msg","authFail");
				viewPage = "redirect:/admin/amain";
				System.out.println("유저 로그인");
			}
				break;
			default:
				ra.addFlashAttribute("msg","loginFail");
				//로그인실패
				System.out.println("로그인실패");
				if(type.equals("user")) {
					 viewPage = "ahome";
				}else if(type.equals("admin")) {
					 viewPage = "ahome";
				}
				break;
				}
				return viewPage;
		}
		@RequestMapping("amain")
		public void goHome() {
		}
		@RequestMapping("ahome")
		public void gowome() {
		}
}
