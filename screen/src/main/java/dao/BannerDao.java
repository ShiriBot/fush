package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.OracleConn;
import dto.BannerImage;
import dto.File;

public class BannerDao {
	Connection conn = OracleConn.getInstance().getConn();
	PreparedStatement stmt;
	
	public List<File> banner() {
		List<File> bannerImage = new ArrayList<File>();
		String sql = "SELECT route,save_name,file_type,slide_arr_num "
				+ " FROM banner_image "
				+ " ORDER BY slide_arr_num";
		try {
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				BannerImage bi = new BannerImage();
				bi.setRoute(rs.getString("route"));
				bi.setSaveName(rs.getString("save_name"));
				bi.setFileType(rs.getString("file_type"));
				bi.setSlideArrNum(rs.getString("slide_arr_num"));
				bannerImage.add(bi);
			}
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bannerImage;
	}
}
