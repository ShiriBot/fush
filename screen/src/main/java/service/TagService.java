package service;



import java.util.List;

import dao.TagDao;
import dto.Tag;

public class TagService {
	TagDao searchDao = new TagDao();
	TagDao tagDao = new TagDao();
	
	public List<Tag> tagList() {
		return searchDao.searchBox();
	}

	public String insert(String tagName) {
		String msg="";
		int rs =tagDao.insert(tagName);
		if(rs==0) {
			msg="InsertSuccess";
		}else {
			msg="DuplicateTag";
		}
		return msg;
	}

	public String modify(String seqno, String newName) {
		String msg="";
		int rs =tagDao.modify(seqno,newName);
		if(rs==0) {
			msg="ModifySuccess";
		}else {
			msg="DuplicateTag";
		}
		return msg;
	}

	public void delete(String seqno) {
		tagDao.delete(seqno);
	}
}
