package com.achu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.achu.dao.ArtworkDao;
import com.achu.dao.ArtworkDaoImp;

import com.achu.dto.Artwork;
import com.achu.dto.Criteria;
import com.achu.dto.Tag;

@Service
public class ArtworkServiceImp implements ArtworkService {
	@Autowired
	ArtworkDao artworkDao;
	
	@Override
	public List<Artwork> list(Criteria aCri) {
		return artworkDao.list(aCri);
	}
	@Override
	public List<Artwork> list() {
		return artworkDao.list(new Criteria());
	}
	@Override
	public List<Artwork> AchuRecommendArt() {
		return artworkDao.AchuRecommendArt();
	}
	@Override
	public List<Tag> topTag(){
		return artworkDao.topTag();
	}
	@Override
	public List<Artwork> topTagArt(String seqno){
		return artworkDao.topTagArt(seqno);
	}
	@Override
	public List<Artwork> rating(String userId){
		return artworkDao.Rating(userId);
	}
	@Override
	public List<Artwork> keywordList(Criteria aCri) {
		return artworkDao.keywordList(aCri);
	}
}
