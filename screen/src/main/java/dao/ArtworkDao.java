package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.OracleConn;
import dto.Artwork;

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
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mainRC;
	}

	public List<Artwork> topTagArt() {
		List<Artwork> toptag = new ArrayList<Artwork>();
		
		String sql ="SELECT *"
				+ "FROM(SELECT *"
				+ "    FROM tag_avg_rating"
				+ "    ORDER BY avg_rating DESC)"
				+ "WHERE ROWNUM<=2";
		
		try {
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				Artwork artwork = new Artwork();
				artwork.setSeqno(rs.getString("seqno"));
				artwork.setName(rs.getString("name"));
				toptag.add(artwork);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return toptag;
	}
	
}
