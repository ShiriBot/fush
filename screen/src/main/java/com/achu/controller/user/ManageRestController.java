package com.achu.controller.user;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.achu.dto.Tag;
import com.achu.service.TagService;

@Controller
@RequestMapping(value="/adminRest/")
public class ManageRestController {
	
	private static final Logger log = LoggerFactory.getLogger("ManageRestController.class");
	
	@Autowired
	TagService tagService;
	
	@GetMapping(value="tagList")
	public ResponseEntity<List<Tag>> tag() {
		log.info("tagList Mapping OK");
		return new ResponseEntity<>(tagService.tagListRest(),HttpStatus.OK);
	}
	
	@PostMapping(value="tagInsert/{tagName}", produces= {"text/plain; charset=utf-8" })
	public ResponseEntity<String> tagInsert(@PathVariable("tagName") String tagName) {
		return tagService.register(tagName)==1? new ResponseEntity<>("태그 등록 완료", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value="tagModify", 
					method= {RequestMethod.PUT, RequestMethod.PATCH},
					produces={"text/plain; charset=utf-8"})
	public ResponseEntity<String> tagModify(@RequestBody Tag tag) {
		return tagService.edit(tag.getSeqno(),tag.getName())==1? new ResponseEntity<>("태그 수정 완료", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value="tagDelete/{tno}", produces="text/plain; charset=utf-8")
	public ResponseEntity<String> tagDelete(@PathVariable("tno") String seqno) {
		log.info("tag DELETE Mapping OK");
		int rs=tagService.remove(seqno);
		log.info("tag DELETE result : " +rs);
		return rs==-1? new ResponseEntity<>("태그 삭제 완료", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="tagConfirm/{tagName}",produces="text/plain; charset=utf-8")
	public ResponseEntity<String> tagConfirm(@PathVariable("tagName") String tagName){
		String rs=String.valueOf(tagService.confirm(tagName));
			ResponseEntity<String> result = null; 
			if(rs.equals("0")||rs.equals("1")) {
				result = new ResponseEntity<>(rs, HttpStatus.OK);
			}else {
				result=new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		return result;
	}
}
