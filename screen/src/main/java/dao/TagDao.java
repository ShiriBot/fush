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
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return searchTag;
		
	}

	public void insert(String tagName) {
		String sql ="INSERT INTO tag VALUES (tag_seqno.NEXTVAL,?)";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, tagName);
			stmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void modify(String seqno, String newName) {
		//쓰읍... 제대로 하려면 중복검사도 해야할거 같긴한데...
		String sql ="UPDATE tag SET name=? WHERE seqno=?";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, newName);
			stmt.setString(2, seqno);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void delete(String seqno) {
		String sql ="DELETE FROM tag_match WHERE tag_seqno=?";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, seqno);
			stmt.executeUpdate();
			sql="DELETE FROM tag WHERE seqno=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, seqno);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
