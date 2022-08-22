package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.OracleConn;
import dto.Member;

public class MemberDao {
	
	private final Connection conn = OracleConn.getInstance().getConn();
	PreparedStatement stmt;

	public MemberDao() {
	}

	public Map<String, String> login(String id, String pw) {
		Map<String, String> status =new HashMap<String, String>();

		String sql = "SELECT m.*, "
				+ "(SELECT auth_code FROM member_auth a WHERE a.id=m.id) auth "
				+ "FROM member m WHERE id = ?";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				System.out.println("rs.next()");
				if (rs.getString("pw").equals(pw)) {
					if(rs.getString("auth").equals("A")||rs.getString("auth").equals("M")) {
						status.put("loginStatus","manager");
						status.put("name",rs.getString("name"));
					}else {
						status.put("loginStatus","ok");
					}
				} else {
					status.put("loginStatus","pwFail");
				}
			} else {
				status.put("loginStatus","fail");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

	public Map<String,Integer> statistics() {
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
		System.out.println("dao"+statistics);
		return statistics;
		
	}

	public List<Member> list() {
		List<Member> members=new ArrayList<Member>();
		String sql = "SELECT * FROM Member";
		try {
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			while(rs.next()) {
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
