package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.OracleConn;
import dto.TagDto;

public class TagDao {
	private final Connection conn =OracleConn.getInstance().getConn();
	
	public TagDto[] searchBox(){
		TagDto[] searchTag =null;
		String sql ="select top_seq,top,mid_seq,mid,seqno,name from v_tag_info";
		
		
		
		PreparedStatement stmt;
		try {
			stmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			ResultSet rs =stmt.executeQuery();
			
			
			rs.last();
			searchTag = new TagDto[rs.getRow()];
			rs.beforeFirst();
			int i =0;
			while(rs.next()) {
				TagDto sd = new TagDto();
				sd.setTop(rs.getString("top"));
				sd.setMid(rs.getString("mid"));
				sd.setName(rs.getString("name"));
				sd.setMid_seq(rs.getString("mid_seq"));
				sd.setTop_seq(rs.getString("top_seq"));
				sd.setSeqno(rs.getString("seqno"));
				searchTag[i++] = sd;
				System.out.println(rs.getString("top_seq"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return searchTag;
		
	}
}
