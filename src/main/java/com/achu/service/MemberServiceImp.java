package com.achu.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.achu.dao.MemberDao;
import com.achu.dao.MemberDaoImp;
import com.achu.dao.RatingDao;
import com.achu.dao.ReplyDao;

import com.achu.dto.Criteria;
import com.achu.dto.Member;

@Service
public class MemberServiceImp implements MemberService{
	
	@Autowired
	MemberDao memberDao;

	public Map<String, String> login(String id, String pw) {
		return memberDao.login(id, pw);
	}

	public List<Member> list(Criteria mCri){
		return memberDao.list(mCri);
	}

}
