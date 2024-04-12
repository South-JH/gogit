package com.kh.gogit.member.model.service;

import com.kh.gogit.member.model.vo.Member;

public interface MemberService {
	
	int insertMember(Member m);
	
	int checkMemberId(String memId);
	
	int updateMember(Member m);
	
	Member loginMember(String memId);

}
