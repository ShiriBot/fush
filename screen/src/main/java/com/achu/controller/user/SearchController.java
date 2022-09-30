package com.achu.controller.user;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.achu.service.ArtworkService;
import com.achu.service.ArtworkServiceImp;
import com.achu.service.MemberService;
import com.achu.service.TagService;
import com.achu.service.TagServiceImp;

@Controller
public class SearchController {

	@Autowired
	TagService tagService;
	@Autowired
	ArtworkService artworkService;
	@Autowired
	MemberService ms;
	
	@RequestMapping(value = "search_new",method = RequestMethod.GET)
	private void ArtSearch(Model m) {
		
			m.addAttribute("searchList", tagService.tagList());
			m.addAttribute("artList",artworkService.list());
		}
	
	
	}
	

