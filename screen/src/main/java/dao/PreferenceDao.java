package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.OracleConn;
import dto.Average;

public class PreferenceDao {
	Connection conn = OracleConn.getInstance().getConn();
	PreparedStatement stmt;
	
	public Average MyRatingInfo(String userId) {
		Average average = new Average();
		String sql ="SELECT ROUND(avg(r.value),2) as ArtRatingAvg,COUNT(r.seqno) as artCount "
				+ " FROM rating r "
				+ " where r.ID='"+ userId+"'";
		
		sql="SELECT COUNT(rp.content) as rcnt "
				+ "FROM reply rp "
				+ "where rp.id='"+ userId+"'";
		try {
			stmt = conn.prepareStatement(sql);
			System.out.println(sql);
			ResultSet rs = stmt.executeQuery();
			System.out.println(rs);
			average.setArtRatingAvg(rs.getString("ArtRatingAvg"));
			average.setArtCount(rs.getString("artCount"));
			average.setReplyCount(rs.getString("replyCount"));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("average : "+average);
		return average;
	}
}
