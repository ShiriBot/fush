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

	public void insert(String tagName) {
		tagDao.insert(tagName);
	}

	public void modify(String seqno, String newName) {
		tagDao.modify(seqno,newName);
	}

	public void delete(String seqno) {
		tagDao.delete(seqno);
	}
}
