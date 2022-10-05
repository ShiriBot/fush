package com.achu.controller.user;

import java.awt.RenderingHints.Key;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.achu.dto.Artwork;
import com.achu.dto.Criteria;
import com.achu.service.ArtworkService;

@RestController
@RequestMapping("/searchDetail/")
public class SearchRestController {

	@Autowired
	ArtworkService artworkService;
	
	@GetMapping(value="search/{keyword}",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Artwork>> search(@PathVariable("keyword") String Keyword){
		System.out.println("서치 컨트롤러 검색어 기능 구현 디버깅" + Keyword);
		
		return new ResponseEntity<>(artworkService.searchList(Keyword),HttpStatus.OK);
	}
	
	@GetMapping(value ="list",
			produces = {MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Artwork>> getReply(@PathVariable("ano") Long ano){
		System.out.println("search컨트롤러 리스트 불러오는 메소드 디버깅");
		return new ResponseEntity<>(artworkService.list(),HttpStatus.OK);
	}
	@GetMapping(value ="Detail",produces = {MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Artwork>> getArtList(){
		return new ResponseEntity<>(artworkService.Restlist(),HttpStatus.OK);
	}
}
