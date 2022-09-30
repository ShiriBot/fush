package com.achu.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.achu.service.ArtworkService;

@Controller
@RequestMapping("/artDetail/")
public class ArtDetailController {
	
	@Autowired
	ArtworkService artworkService;
	
	
	@RequestMapping("detail")
	public String artDetail(Model m,@ModelAttribute("seqno") String seqno) {
		System.out.println("작품 상세정보 컨트롤러 "+seqno);
		m.addAttribute("detail",artworkService.artDetail(seqno));
		return "artDetail";
	}
		
}
