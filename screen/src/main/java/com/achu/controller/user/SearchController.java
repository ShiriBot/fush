package com.achu.controller.user;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.achu.dto.Criteria;
import com.achu.service.ArtworkService;
import com.achu.service.MemberService;
import com.achu.service.TagService;

@Controller
public class SearchController {

	@Autowired
	TagService tagService;
	@Autowired
	ArtworkService artworkService;
	@Autowired
	MemberService ms;
	
	@RequestMapping(value = "search_new",method = RequestMethod.GET)
	private void ArtSearch(@RequestParam("keyword") String keyword,Model m) {
			Criteria cri = new Criteria();
			cri.setKeyword(keyword);
		System.out.println(cri);
			m.addAttribute("searchList", tagService.tagList());
			m.addAttribute("artList",artworkService.list(cri));
			m.addAttribute("keyword",keyword);
		}
	
	
	
}


