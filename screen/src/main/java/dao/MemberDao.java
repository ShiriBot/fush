package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import common.OracleConn;

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

	public int[][] count() {
		int[][] count = new int[4][2];
		
		String sql = "SELECT count(*) total, "
				+ "count(CASE WHEN wdate <=SYSDATE-7 THEN 1 END) as upto_last_week, "
				+ "count(CASE WHEN wdate BETWEEN SYSDATE-6 AND SYSDATE THEN 1 END) as new_this_week "
				+ "FROM member";
		//회원수 증감 조회.
		//전주 대비 증가율 구하기 위한 데이터 : 최근 일주일 가입 수 제외한 회원 수, 최근 일주일 가입 수
		try {
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			count[0][0] = rs.getInt(0);
			count[0][1] = (rs.getInt(2)/rs.getInt(1))*100;
			
			//int로 두개 다 가져올 수 있을줄 알았는데 ㅇ0ㅇ 증가율은 double로 가져와야 할거 같아서 dto가 하나 필요할듯??
			//아님 Map으로 할까...8개 정도면 Map으로 할만할지도...
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
		
	}

}
