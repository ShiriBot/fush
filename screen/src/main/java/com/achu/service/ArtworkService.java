package com.achu.service;

import java.util.List;

import com.achu.dto.Artwork;
import com.achu.dto.Criteria;
import com.achu.dto.Tag;

public interface ArtworkService {


	public List<Artwork> list(Criteria aCri) ;
	
	public List<Artwork> list();
	
	public List<Artwork> AchuRecommendArt() ;
	
	public List<Tag> topTag();
	
	public List<Artwork> topTagArt(String seqno);
	
	public List<Artwork> rating(String userId);
	
	public List<Artwork> keywordList(Criteria aCri);

	public Artwork artDetail(String seqno);

	public List<Artwork> Restlist();

	public List<Artwork> searchList(String keyword);
}
