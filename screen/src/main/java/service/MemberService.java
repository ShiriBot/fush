package service;

import java.util.*;

import dao.MemberDao;
import dao.RatingDao;
import dao.ReplyDao;
import dto.Criteria;
import dto.Member;

public class MemberService {
	MemberDao memberDao = new MemberDao();

	public MemberService() {
		
	}

	public Map<String, String> login(String id, String pw) {
		return memberDao.login(id, pw);
	}

	public List<Member> list(Criteria mCri){
		return memberDao.list(mCri);
	}

}
