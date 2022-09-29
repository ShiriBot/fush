package com.achu.controller.user;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.achu.dto.Tag;
import com.achu.service.TagService;

@Controller
@RequestMapping(value="/adminRest/")
public class ManageRestController {
	
	private static final Logger log = LoggerFactory.getLogger("ManageRestController.class");
	
	@Autowired
	TagService tagService;
	
	@GetMapping(value="tagList")
	public ResponseEntity<List<Tag>> tag(Model model) {
		log.info("tagList Mapping OK");
		return new ResponseEntity<>(tagService.tagListRest(),HttpStatus.OK);
	}
	
	@GetMapping(value="tagInsert/{tagName}", produces= {MediaType.APPLICATION_XML_VALUE,
													MediaType.APPLICATION_JSON_UTF8_VALUE })
	public void tagInsert(@PathVariable("tagName") String tagName) {
		tagService.insert(tagName);
	}
	
	@RequestMapping(value="tagModify/{tno}/{name}", produces= {MediaType.APPLICATION_XML_VALUE,
															MediaType.APPLICATION_JSON_UTF8_VALUE })
	public int tagModify(@PathVariable("tagName") String seqno,@PathVariable("name") String newName) {
		return tagService.edit(seqno,newName);
	}
	
	@RequestMapping(value="tagDelete/{tno}", produces= {MediaType.APPLICATION_XML_VALUE,
														MediaType.APPLICATION_JSON_UTF8_VALUE })
	public int tagDelete(@PathVariable("tno") String seqno) {
		return tagService.remove(seqno);
	}
}
