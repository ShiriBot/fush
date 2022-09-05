package service;

import java.util.List;

import dao.PreferenceDao;
import dto.Average;
import dto.TagDto;

public class PreferenceService {
	PreferenceDao preferenceDao = new PreferenceDao();

	public Average MyRatingInfo(String userId) {
		return preferenceDao.MyRatingInfo(userId);
	}
	public List<TagDto> MyRatingFavoriteTag() {
		return preferenceDao.MyRatingFavoriteTag();
	}
}
