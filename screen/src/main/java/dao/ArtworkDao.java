package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.OracleConn;
import dto.Artwork;
import dto.TagDto;

public class ArtworkDao {
	Connection conn = OracleConn.getInstance().getConn();
	PreparedStatement stmt;

	public ArtworkDao() {
	}

	public List<Artwork> list(String type) {
		List<Artwork> artList = new ArrayList<Artwork>();
		List<Artwork> artRequest = new ArrayList<Artwork>();
		String sql = "SELECT * FROM v_art_info";
		try {
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
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
		}
		
		if(type.equals("request")){
			return artRequest;
		}else {
			return artList;
		}
	}

	public List<Artwork> AchuRecommendArt() {
		List<Artwork> mainRC = new ArrayList<Artwork>();
		String sql ="SELECT seqno, name, author, avg_rating, cnt, image_route"
				+ " FROM(SELECT *"
				+ "    FROM  v_art_info "
				+ "    ORDER BY avg_rating DESC)"
				+ " WHERE ROWNUM<=4";
		
		try {
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
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
				sql ="SELECT name "
						+ " FROM tag "
						+ " WHERE seqno IN "
						+ " (select at.tag_seqno "
						+ " from art_tag_value at "
						+ " where at.art_seqno="
						+ mainRC.get(i).getSeqno()+")";
				
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery();
				
				List<TagDto> tagList = new ArrayList<TagDto>();
				while(rs.next()) {
					TagDto tagDto = new TagDto();
					tagDto.setName(rs.getString("name"));
					tagList.add(tagDto);
				}
				mainRC.get(i).setTag(tagList);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mainRC;
	}

	public List<TagDto> topTag() {
		List<TagDto> toptag = new ArrayList<TagDto>();
		
		String sql ="SELECT *"
				+ "FROM(SELECT *"
				+ "    FROM tag_avg_rating"
				+ "    ORDER BY avg_rating DESC)"
				+ "WHERE ROWNUM<=2";
		
		try {
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				TagDto tagDto = new TagDto();
				tagDto.setSeqno(rs.getString("seqno"));
				tagDto.setName(rs.getString("name"));
				toptag.add(tagDto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return toptag;
	}
	
	public List<Artwork> topTagArt(String seqno){
		List<Artwork> artwork = new ArrayList<Artwork>();
		
		String sql ="SELECT *"
				+ "FROM(SELECT ar.avg_rating, ar.cnt, ai.* "
				+ "    FROM art_avg_rating ar, art_info ai, art_tag_value t "
				+ "    WHERE ar.seqno=ai.seqno "
				+ "		AND ar.seqno=t.art_seqno AND t.tag_seqno= "+seqno
				+ "    ORDER BY avg_rating DESC)"
				+ "WHERE ROWNUM<=5";
		try {
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				Artwork artList = new Artwork();
				artList.setSeqno(rs.getString("seqno"));
				artList.setName(rs.getString("name"));
				artwork.add(artList);
			}
			for(int i =0; i < artwork.size(); i++) {
				sql = "select seqno,name from v_tag_info ";
					stmt = conn.prepareStatement(sql);
					rs = stmt.executeQuery();
				List<TagDto> tagDto = new ArrayList<TagDto>();	
				while(rs.next()) {
				TagDto tagList = new TagDto();
					tagList.setSeqno(rs.getString("seqno"));
					tagList.setName(rs.getString("name"));
					tagDto.add(tagList);
				}artwork.get(i).setTag(tagDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		return artwork;
		
	}
}
