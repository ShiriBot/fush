package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.OracleConn;
import dto.Criteria;
import dto.Member;
import oracle.jdbc.OracleTypes;

public class MemberDao {
	
	private final Connection conn = OracleConn.getInstance().getConn();
	PreparedStatement stmt;

	public MemberDao() {
	}

	public Map<String, String> login(String id, String pw) {
		Map<String, String> status =new HashMap<String, String>();
		String sql = "SELECT * FROM v_member_info WHERE id = ?";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				if (rs.getString("pw").equals(pw)) {
					status.put("loginStatus","ok");
					status.put("name",rs.getString("name"));
					if(rs.getString("auth").equals("A")||rs.getString("auth").equals("M")) {
						status.put("auth","manager");
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

	public Map<String,Integer> manageMainStatistics() {
		//이 메소드의 위치(클래스)가 여기가 맞는지 모르겠어요...
		Map<String,Integer> statistics = new HashMap<String,Integer>();
		
		try {
			String sql = "call p_member_count(?,?)";
			//회원수 증감 조회.
			//전주 대비 증가율 구하기 위한 데이터 : 최근 일주일 가입 수
			CallableStatement stmt = conn.prepareCall(sql);
			stmt.registerOutParameter(1, OracleTypes.NUMBER);
			stmt.registerOutParameter(2, OracleTypes.NUMBER);
			stmt.executeQuery();
			
			statistics.put("totalMember", stmt.getInt(1));
			statistics.put("newMember", (int)Math.round(stmt.getDouble(2)/(stmt.getDouble(1)-stmt.getDouble(2))*100));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return statistics;
		
	}
	
	public List<Member> list(Criteria mCri){
		List<Member> members=new ArrayList<Member>();
		try {
			String sql = " SELECT rownum as rn, m.*"
					+ " FROM v_member_info m";
			switch (mCri.getKind()) {
			case "all":
				sql += " WHERE isdel='N'";
				break;
			case "new":
				sql += " WHERE isdel='N' AND (wdate BETWEEN SYSDATE-7 AND SYSDATE)";
				break;
			case "del":
				sql += " WHERE isdel='Y'";
				break;
			default:
				break;
			}
				
			if(mCri.getSearchField()!=null) {
				if(!mCri.getSearchField().equals("")) sql+= " AND "+mCri.getSearchField()+" LIKE '%"+mCri.getKeyword()+"%'";
			}
			
			System.out.println(sql);
			
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			Member member = null;
			while(rs.next()) {
				member = new Member();
				member.setRownum(rs.getInt("rn"));
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setAuth(rs.getString("auth"));
				member.setWdate(rs.getString("wdate"));
				member.setBirth(rs.getString("birth"));
				members.add(member);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return members;
	}
	
}
