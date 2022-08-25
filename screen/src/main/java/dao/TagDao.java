package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.OracleConn;
import dto.TagDto;

public class TagDao {
	private final Connection conn =OracleConn.getInstance().getConn();
	PreparedStatement stmt;
	
	public TagDto[] searchBox(){
		TagDto[] searchTag =null;
		String sql ="select top_seq,top,mid_seq,mid,seqno,name from v_tag_info";
		
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
				sd.setMidSeq(rs.getString("mid_seq"));
				sd.setTopSeq(rs.getString("top_seq"));
				sd.setSeqno(rs.getString("seqno"));
				searchTag[i++] = sd;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return searchTag;
		
	}

	public void insert() {
		
	}
}
