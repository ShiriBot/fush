package service;

import java.util.List;

import dao.ArtworkDao;
import dto.Artwork;
import dto.Criteria;
import dto.Tag;

public class ArtworkService {
	ArtworkDao artworkDao = new ArtworkDao();
	
	public ArtworkService() {
	}

	public List<Artwork> list(Criteria aCri) {
		return artworkDao.list(aCri);
	}
	
	public List<Artwork> list() {
		return artworkDao.list(new Criteria());
	}
	
	public List<Artwork> AchuRecommendArt() {
		return artworkDao.AchuRecommendArt();
	}
	
	public List<Tag> topTag(){
		return artworkDao.topTag();
	}
	
	public List<Artwork> topTagArt(String seqno){
		return artworkDao.topTagArt(seqno);
	}
	public List<Artwork> rating(String userId){
		return artworkDao.Rating(userId);
	}
}
