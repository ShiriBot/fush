package com.achu.service;

import java.util.List;

import com.achu.dto.Tag;

public interface TagService {
	public List<Tag> tagList() ;

	public String insert(String tagName);

	public String modify(String seqno, String newName);

	public void delete(String seqno);

	//이 아래로 mybatis-jquery 적용 용도
	public int register(Tag tag);
}
