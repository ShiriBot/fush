package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.OracleConn;
import dto.Artwork;
import dto.Average;
import dto.Tag;
import oracle.jdbc.OracleTypes;

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
				tag.setArtRatingAvg(rs.getString("avg_rating"));
				tagDto.add(tag);
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return tagDto;
	}
	public List<Tag> MyRatingMostGenre(String userId) {
		List<Tag> genre = new ArrayList<Tag>();
		String sql="select *  "
				+ "from( "
				+ "select  count(*) cnt , name  "
				+ "from v_tag_info i , user_tag_record u "
				+ "where i.top_seq ='1' and u.id='"+userId+"' and u.tag_seqno = i.seqno "
				+ "group by name "
				+ "order by cnt desc) "
				+ "where rownum <4";

		try {
			stmt = conn.prepareStatement(sql);
			ResultSet rs =stmt.executeQuery();
			while(rs.next()) {
				Tag tag = new Tag();
				tag.setName(rs.getString("name"));
				tag.setArtRatingAvg(rs.getString("cnt"));
				genre.add(tag);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return genre;
	}
	// 수정해야됨
	public List<Tag> MyRatingCountGenre(String userId) {
		List<Tag> genre = new ArrayList<Tag>();
		String sql="call get_myart_rating_cnt(?,?)";
		
		try {
			CallableStatement stmt = conn.prepareCall(sql);
			stmt.setString(1, userId );
			stmt.registerOutParameter(2, OracleTypes.CURSOR);
			stmt.executeQuery();
			ResultSet rs =(ResultSet) stmt.getObject(2);
			while(rs.next()) {
				Tag tag = new Tag();
				tag.setName(rs.getString("cnt_name"));
				tag.setArtCount(rs.getString("cnt"));
				genre.add(tag);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return genre;
	}
	public List<Tag> MyRatingFavoriteGenre(String userId) {
		List<Tag> genre = new ArrayList<Tag>();
		String sql="call get_myart_rating_favorite(?,?)";
		
		try {
		CallableStatement stmt = conn.prepareCall(sql);
		stmt.setString(1, userId );
		stmt.registerOutParameter(2, OracleTypes.CURSOR);
		stmt.executeQuery();
		ResultSet rs =(ResultSet) stmt.getObject(2);
		while(rs.next()) {
			Tag tag = new Tag();
			tag.setName(rs.getString("avg_name"));
			tag.setArtRatingAvg(rs.getString("avg"));
			genre.add(tag);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return genre;
	}
	public List<Artwork> MyRatingPlatform(String userId) {
		List<Artwork> platform = new ArrayList<Artwork>();
		String sql ="call get_myplatform_rating(?,?)";
		
		try {
			CallableStatement stmt = conn.prepareCall(sql);
			stmt.setString(1, userId);
			stmt.registerOutParameter(2, OracleTypes.CURSOR);
			stmt.executeQuery();
			ResultSet rs = (ResultSet) stmt.getObject(2);
			
			while(rs.next()) {
				Artwork artwork= new Artwork();
				artwork.setPlaform(rs.getString("platform"));
				artwork.setCnt(rs.getInt("cnt"));
				platform.add(artwork);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return platform;
	}
}
