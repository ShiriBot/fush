package service;

import java.util.*;

import dao.MemberDao;
import dto.Member;

public class MemberService {
	MemberDao memberDao = new MemberDao();

	public MemberService() {
		
	}

	public Map<String, String> login(String id, String pw) {
		return memberDao.login(id, pw);
	}

	public Map<String, Integer> statistics() {
		return memberDao.statistics();
	}

	public List<Member> list() {
		return memberDao.list();
	}

}
