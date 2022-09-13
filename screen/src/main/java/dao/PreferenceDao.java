package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.OracleConn;
import dto.Average;
import dto.Tag;

public class PreferenceDao {
	Connection conn = OracleConn.getInstance().getConn();
	PreparedStatement stmt;
	
	//취향분석-나의 평가 현황
	public Average MyRatingInfo(String userId) {
		Average average = new Average();
		String sql ="SELECT ROUND(avg(r.value),2) as ArtRatingAvg, COUNT(r.seqno) as artCount "
				+ " FROM rating r "
				+ " where r.ID='"+ userId+"'";
		try {
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				average.setArtRatingAvg(rs.getString("ArtRatingAvg"));
				average.setArtCount(rs.getString("artCount"));
			}
			sql="SELECT COUNT(rp.content) as rcnt "
					+ "FROM reply rp "
					+ "where rp.id='"+ userId+"'";
		
			stmt = conn.prepareStatement(sql);
			ResultSet rs2 = stmt.executeQuery();
			while(rs2.next()) {
				average.setReplyCount(rs2.getString("rcnt"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return average;
	}
	// 취향분석-나의선호태그
	public List<Tag> MyRatingFavoriteTag() {
		List<Tag> tagDto = new ArrayList<Tag>();
		
		String sql="select * "
				+ "from "
				+ "(SELECT t.name,r.avg_rating "
				+ "FROM user_tag_record r,tag t "
				+ "WHERE ID='user2' and r.tag_seqno = t.seqno "
				+ "ORDER BY avg_rating DESC)";
		try {
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
				while(rs.next()) {
				Tag tag = new Tag();
				tag.setName(rs.getString("name"));
				tag.setAvgRating(rs.getDouble("avg_rating"));
				tagDto.add(tag);
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return tagDto;
	}
}
