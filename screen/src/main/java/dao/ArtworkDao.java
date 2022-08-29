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
//		이부분 v_art_info에 admit이없어서 오류
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

}
