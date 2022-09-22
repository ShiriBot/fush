package com.achu.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.achu.dao.TagDao;
import com.achu.dao.TagDaoImp;

import com.achu.dto.Tag;

@Service
public class TagServiceImp implements TagService {
	@Autowired
	TagDao tagDao;
	
	public List<Tag> tagList() {
		return tagDao.tagList();
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
