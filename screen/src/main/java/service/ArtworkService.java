package service;

import java.util.List;

import dao.ArtworkDao;
import dto.Artwork;
import dto.TagDto;

public class ArtworkService {
	ArtworkDao artworkDao = new ArtworkDao();
	
	public ArtworkService() {
	}

	public List<Artwork> list(String type) {
		return artworkDao.list(type);
	}
	public List<Artwork> AchuRecommendArt() {
		return artworkDao.AchuRecommendArt();
	}
	
	public List<TagDto> topTag(String seqno){
		return artworkDao.topTag(seqno);
	}
}
