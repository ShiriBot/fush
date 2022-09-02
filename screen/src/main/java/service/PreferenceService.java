package service;

import dao.PreferenceDao;
import dto.Average;

public class PreferenceService {

	public Average MyRatingInfo(String userId) {
		PreferenceDao preferenceDao = new PreferenceDao();
		return preferenceDao.MyRatingInfo(userId);
	}

}
