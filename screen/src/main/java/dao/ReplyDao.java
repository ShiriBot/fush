package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import common.OracleConn;

public class ReplyDao {
	
	private final Connection conn = OracleConn.getInstance().getConn();
	PreparedStatement stmt;

	public ReplyDao() {
	}
	
	public Map<String,Integer> manageMainStatistics() {
		//이 메소드의 위치(클래스)가 여기가 맞는지 모르겠어요...
		Map<String,Integer> statistics = new HashMap<String,Integer>();
		
		try {
			String sql = "SELECT count(*) total, "
					+ "count(CASE WHEN wdate BETWEEN SYSDATE-7 AND SYSDATE THEN 1 END) as new "
					+ "FROM member";
			//회원수 증감 조회.
			//전주 대비 증가율 구하기 위한 데이터 : 최근 일주일 가입 수
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			
			statistics.put("totalMember", rs.getInt("total"));
			statistics.put("newMember", (int)Math.round(rs.getDouble("new")/(rs.getDouble("total")-rs.getDouble("new"))*100));
			
			sql = "SELECT count(*) total, "
					+ "count(CASE WHEN wdate BETWEEN SYSDATE-7 AND SYSDATE THEN 1 END) as new "
					+ "FROM rating";
			//평가수 증감 조회.
			//전주 대비 증가율 구하기 위한 데이터 : 최근 일주일 가입 수
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			rs.next();
			
			statistics.put("totalRating", rs.getInt("total"));
			statistics.put("newRating", (int)Math.round(rs.getDouble("new")/(rs.getDouble("total")-rs.getDouble("new"))*100));
			
			sql = "SELECT count(*) total, "
					+ "count(CASE WHEN wdate BETWEEN SYSDATE-7 AND SYSDATE THEN 1 END) as new "
					+ "FROM reply";
			//평가수 증감 조회.
			//전주 대비 증가율 구하기 위한 데이터 : 최근 일주일 가입 수
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			rs.next();
			
			statistics.put("totalReply", rs.getInt("total"));
			statistics.put("newReply", (int)Math.round(rs.getDouble("new")/(rs.getDouble("total")-rs.getDouble("new"))*100));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return statistics;
		
	}
	

}
