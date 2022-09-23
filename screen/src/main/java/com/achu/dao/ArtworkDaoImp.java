package com.achu.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.achu.common.OracleConn;

import com.achu.dto.Artwork;
import com.achu.dto.Criteria;
import com.achu.dto.Tag;

import oracle.jdbc.OracleTypes;


@Repository
public class ArtworkDaoImp implements ArtworkDao {

	@Autowired
	private DataSource dataSource;

	@Override
	public List<Artwork> list(Criteria aCri) {
		CallableStatement stmt = null;
		Connection conn = null; 
		
		List<Artwork> artList = new ArrayList<Artwork>();
		List<Artwork> artRequest = new ArrayList<Artwork>();
		/*
		 * String sql = "SELECT * FROM v_art_info"; if(aCri.getSearchField()!=null) {
		 * if(!aCri.getSearchField().equals("")) sql+=
		 * " WHERE "+aCri.getSearchField()+" LIKE '%"+aCri.getKeyword()+"%'"; }
		 */
		
		String sql = "call p_get_art_info(?,?,?)";
		try {
			conn=dataSource.getConnection();
			stmt = conn.prepareCall(sql);
			stmt.setString(1, aCri.getSearchField());
			stmt.setString(2, aCri.getKeyword());
			stmt.registerOutParameter(3, OracleTypes.CURSOR);
			stmt.executeQuery();
			ResultSet rs = (ResultSet) stmt.getObject(3);
			while(rs.next()) {
				Artwork artwork = new Artwork();
				artwork.setName(rs.getString("name"));
				artwork.setAuthor(rs.getString("author"));
				artwork.setDetail(rs.getString("detail"));
				artwork.setWeek(rs.getString("week"));
				artwork.setUrl(rs.getString("url"));
				artwork.setImageRoute(rs.getString("image_route"));
				
				if(rs.getString("admit").equals("Y")) {
					artList.add(artwork);
				}else {
					artRequest.add(artwork);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resourceClose(conn,stmt);
		}
		
		if(aCri.getKind()!=null){
			if(aCri.getKind().equals("request")){
				return artRequest;
			}
		}
		return artList;
		
	}
	@Override
	public List<Artwork> AchuRecommendArt() {
		Connection conn = null; 
		CallableStatement stmt = null;
		List<Artwork> mainRC = new ArrayList<Artwork>();
			String sql ="call p_get_rec_art(?)";
			
		try {
			conn = dataSource.getConnection();
			stmt = conn.prepareCall(sql);
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			stmt.executeQuery();
			ResultSet rs = (ResultSet) stmt.getObject(1);
			while(rs.next()) {
				Artwork artwork = new Artwork();
				artwork.setSeqno(rs.getString("seqno"));
				artwork.setName(rs.getString("name"));
				artwork.setAuthor(rs.getString("author"));
				artwork.setAvgRating(rs.getDouble("avg_rating"));
				artwork.setCnt(rs.getInt("cnt"));
				artwork.setImageRoute(rs.getString("image_route"));
				mainRC.add(artwork);
			}
			for(int i = 0; i < mainRC.size(); i++) {
				sql ="call p_get_rec_art_tag(?,?)";
				conn=dataSource.getConnection();
				stmt = conn.prepareCall(sql);
				stmt.setInt(1, i);
				stmt.registerOutParameter(2, OracleTypes.CURSOR);
				stmt.executeQuery();
				rs = (ResultSet) stmt.getObject(2);
				
				List<Tag> tagList = new ArrayList<Tag>();
				while(rs.next()) {
					Tag tagDto = new Tag();
					tagDto.setName(rs.getString("name"));
					tagList.add(tagDto);
				}
				mainRC.get(i).setTag(tagList);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			resourceClose(conn,stmt);
		}
		return mainRC;
	}
	@Override
	public List<Tag> topTag() {
		Connection conn = null; 
		CallableStatement stmt = null;
		List<Tag> toptag = new ArrayList<Tag>();
		String sql ="call p_get_toptag(?)";
		
		try {
			conn = dataSource.getConnection();
			stmt = conn.prepareCall(sql);
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			stmt.executeQuery();
			ResultSet rs = (ResultSet) stmt.getObject(1);
			
			while(rs.next()) {
				Tag tagDto = new Tag();
				tagDto.setSeqno(rs.getString("seqno"));
				tagDto.setName(rs.getString("name"));
				toptag.add(tagDto);
			}
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resourceClose(conn,stmt);
		}
		return toptag;
	}
	@Override
	public List<Artwork> topTagArt(String seqno){
		Connection conn = null; 
		CallableStatement stmt = null;
		List<Artwork> artwork = new ArrayList<Artwork>();
		
		String sql ="call p_get_toptagart(?,?)";
		try {
			conn =dataSource.getConnection();
			stmt = conn.prepareCall(sql);
			stmt.setString(1, seqno);
			stmt.registerOutParameter(2, OracleTypes.CURSOR);
			stmt.executeQuery();
			ResultSet rs = (ResultSet) stmt.getObject(2);
			
			while(rs.next()) {
				Artwork artList = new Artwork();
				artList.setSeqno(rs.getString("seqno"));
				artList.setName(rs.getString("name"));
				artwork.add(artList);
			}
			for(int i =0; i < artwork.size(); i++) {
				sql = "call p_get_topart_tag(?) ";
					stmt = conn.prepareCall(sql);
					stmt.registerOutParameter(1, OracleTypes.CURSOR);
					stmt.executeQuery();
					rs =(ResultSet) stmt.getObject(1); 
				List<Tag> tagDto = new ArrayList<Tag>();	
				while(rs.next()) {
				Tag tagList = new Tag();
					tagList.setSeqno(rs.getString("seqno"));
					tagList.setName(rs.getString("name"));
					tagDto.add(tagList);
				}artwork.get(i).setTag(tagDto);
			}
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resourceClose(conn,stmt);
		}
		return artwork;
	}
	@Override
	public List<Artwork> Rating(String userId){
		List<Artwork> artwork = new ArrayList<Artwork>();
		Connection conn = null; 
		CallableStatement stmt = null;
		String sql ="call get_rating_art(?,?)";
		
		try {
			conn = dataSource.getConnection();
			stmt = conn.prepareCall(sql);
			stmt.setString(1, userId);
			stmt.registerOutParameter(2, OracleTypes.CURSOR);
			stmt.executeQuery();
			ResultSet rs = (ResultSet) stmt.getObject(2);
			while(rs.next()) {
				Artwork a = new Artwork();
				a.setSeqno(rs.getString("seqno"));
				a.setName(rs.getString("name"));
				a.setAuthor(rs.getString("author"));
				a.setImageRoute(rs.getString("image_route"));
				artwork.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resourceClose(conn,stmt);
		}
		return artwork;
	}
	
	@Override
	public List<Artwork> keywordList(Criteria aCri) {
		CallableStatement stmt = null;
		Connection conn = null; 
		
		List<Artwork> artList = new ArrayList<Artwork>();
		List<Artwork> artRequest = new ArrayList<Artwork>();
	
		
		String sql = "call p_get_search_keyword(?,?)";
		try {
			conn=dataSource.getConnection();
			stmt = conn.prepareCall(sql);
			stmt.setString(1, aCri.getKeyword());
			stmt.registerOutParameter(2, OracleTypes.CURSOR);
			stmt.executeQuery();
			ResultSet rs = (ResultSet) stmt.getObject(2);
			while(rs.next()) {
				Artwork artwork = new Artwork();
				artwork.setName(rs.getString("name"));
				artwork.setAuthor(rs.getString("author"));
				artwork.setDetail(rs.getString("detail"));
				artwork.setWeek(rs.getString("week"));
				artwork.setUrl(rs.getString("url"));
				artwork.setImageRoute(rs.getString("image_route"));
				
				if(rs.getString("admit").equals("Y")) {
					artList.add(artwork);
				}else {
					artRequest.add(artwork);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resourceClose(conn,stmt);
		}
		if(aCri.getKind()!=null){
			if(aCri.getKind().equals("request")){
				return artRequest;
			}
		}
		return artList;
		
	}
	
	private void resourceClose(Connection conn, PreparedStatement stmt) {
		try {
			if(stmt != null || conn != null) {
			stmt.close();
			conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void resourceClose(Connection conn,CallableStatement csmt) {
		try {
			if(csmt != null || conn != null) {
				csmt.close();
				conn.close();
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
