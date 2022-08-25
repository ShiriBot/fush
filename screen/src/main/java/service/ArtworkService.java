package service;

import java.util.List;

import dao.ArtworkDao;
import dto.Artwork;

public class ArtworkService {
	ArtworkDao artworkDao = new ArtworkDao();
	
	public ArtworkService() {
	}

	public List<Artwork> list(String type) {
		return artworkDao.list(type);
	}

}