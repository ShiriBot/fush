package com.achu.service;



import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.achu.dao.TagDao;
import com.achu.dto.Tag;
import com.achu.mapper.TagMapper;

@Service
public class TagServiceImp implements TagService {
	
	private static final Logger log = LoggerFactory.getLogger("TagServiceImp.class");
	
	@Autowired
	private TagMapper mapper;
	
	@Autowired
	TagDao tagDao;
	
	@Override
	public List<Tag> tagList() {
		return tagDao.tagList();
	}

	@Override
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

	@Override
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
	
	@Override
	public void delete(String seqno) {
		tagDao.delete(seqno);
	}
	
	//이 아래로 mybatis-jquery 적용 용도
	@Override
	public int register(Tag tag) {
		log.info("tag register service called..."+tag);
		return mapper.insert(tag);
	}
}
