package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.OracleConn;
import dto.Tag;
import oracle.jdbc.oracore.OracleType;

public class TagDao {
private final Connection conn =OracleConn.getInstance().getConn();
PreparedStatement stmt;
CallableStatement cstmt;
public List<Tag> searchBox(){
	List<Tag> searchTag = new ArrayList<Tag>();
	String sql ="select top_seq,top,mid_seq,mid,seqno,name from v_tag_info";

	try {
		stmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		ResultSet rs =stmt.executeQuery();

	
		while(rs.next()) {
			Tag sd = new Tag();
			sd.setTop(rs.getString("top"));
			sd.setMid(rs.getString("mid"));
			sd.setName(rs.getString("name"));
			sd.setMidSeq(rs.getString("mid_seq"));
			sd.setTopSeq(rs.getString("top_seq"));
			sd.setSeqno(rs.getString("seqno"));
			searchTag.add(sd);
		}
		rs.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return searchTag;

}

public int insert(String tagName) {
	int rs=0;
	String sql ="call p_insert_tag(?,?)";
	try {
		cstmt = conn.prepareCall(sql);
		cstmt.setString(1, tagName);
		cstmt.registerOutParameter(2, OracleType.STYLE_INT);
		cstmt.executeQuery();
		rs=cstmt.getInt(2);
	} catch (SQLException e) {
		e.printStackTrace();
	}

	return rs;
}

public int modify(String seqno, String newName) {
	int rs=0;
	String sql ="call p_modify_tag(?,?,?)";
	try {
		cstmt = conn.prepareCall(sql);
		cstmt.setString(1, seqno);
		cstmt.setString(2, newName);
		cstmt.registerOutParameter(3, OracleType.STYLE_INT);
		cstmt.executeUpdate();
		rs=cstmt.getInt(3);
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return rs;
}

public void delete(String seqno) {
	String sql ="call p_delete_tag(?)";
	try {
		cstmt = conn.prepareCall(sql);
		cstmt.setString(1, seqno);
		cstmt.executeUpdate();

	} catch (SQLException e) {
		e.printStackTrace();
	}
}
}