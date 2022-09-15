package service;

import java.util.List;

import dao.PreferenceDao;
import dto.Artwork;
import dto.Average;
import dto.Tag;

public class PreferenceService {
	PreferenceDao preferenceDao = new PreferenceDao();

	public Average MyRatingInfo(String userId) {
		return preferenceDao.MyRatingInfo(userId);
	}
	public List<Tag> MyRatingFavoriteTag() {
		return preferenceDao.MyRatingFavoriteTag();
	}
	public List<Tag> MyRatingMostGenre(String userId) {
		return preferenceDao.MyRatingMostGenre(userId);
	}
	public List<Tag>MyRatingFavoriteGenre(String userId) {
		return preferenceDao.MyRatingFavoriteGenre(userId);
	}
	public List<Tag>MyRatingCountGenre(String userId) {
		return preferenceDao.MyRatingCountGenre(userId);
	}
	public List<Artwork>MyRatingPlatform(String userId) {
		return preferenceDao.MyRatingPlatform(userId);
	}
}
