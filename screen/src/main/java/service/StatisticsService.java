package service;

import java.util.HashMap;
import java.util.Map;

import dao.MemberDao;
import dao.RatingDao;
import dao.ReplyDao;

public class StatisticsService {
	MemberDao memberDao = new MemberDao();
	RatingDao ratingDao = new RatingDao();
	ReplyDao replyDao = new ReplyDao();

	public StatisticsService() {
	}
	public Map<String, Integer> manageMainStatistics() {
		Map<String,Integer> statistics = new HashMap<String,Integer>();
		Map<String,Integer> mStatistics = memberDao.manageMainStatistics();
		Map<String,Integer> rStatistics = ratingDao.manageMainStatistics();
		Map<String,Integer> rpStatistics = replyDao.manageMainStatistics();
		
		
		statistics.put("totalMember", mStatistics.get("totalMember"));
		statistics.put("newMember", mStatistics.get("newMember"));
		statistics.put("totalRating", rStatistics.get("totalRating"));
		statistics.put("newRating", rStatistics.get("newRating"));
		statistics.put("totalReply", rpStatistics.get("totalReply"));
		statistics.put("newReply", rpStatistics.get("newReply"));
		
		return statistics;
	}

}
