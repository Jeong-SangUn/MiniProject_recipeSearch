package com.recipe.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class MemberDao implements MemberService{
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	@Override
	public int insertMemberOne(Map<String, Object> map) {
		return sqlSession.insert("Cook_Member.insertMemberOne", map);
	}

	@Override
	public Map<String, Object> selectMemberLogin(Map<String, Object> map) {
		return sqlSession.selectOne("Cook_Member.selectMemberLogin", map);
	}

	@Override
	public Map<String, Object> selectoverlap(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Cook_Member.selectoverlap",map);
	}

	@Override
	public Map<String, Object> selectMemberTable(String mid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Cook_Member.selectMemberTable",mid);
	}

	@Override
	public int insertMemberScoreInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Cook_Member.insertMemberScoreInfo", map);
	}

	@Override
	public int updateMemberScoreInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("Cook_Member.updateMemberScoreInfo", map);
	}

	@Override
	public int insertMemberHitInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("Cook_Member.insertMemberHitInfo", map);
	}

	@Override
	public int updateMemberHitInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("Cook_Member.updateMemberHitInfo", map);
	}

	//회원목록
	@Override
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) {
		return sqlSession.selectList("Cook_Member.selectMemberList",map);
	}
	
	//회원목록 수정시 아이디,이름,폰번호 등등 가져옴
	@Override
	public Map<String, Object> selectMemberOne(String mid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Cook_Member.selectMemberOne",mid);
	}
	
	//본인정보수정
	@Override
	public int updateMemberOne(Map<String, Object> map) {
		return sqlSession.update("Cook_Member.updateMemberOne", map);
	}
	
	//회원탈퇴
	@Override
	public int deleteMemberOne(String mid) {
		// TODO Auto-generated method stub
		return sqlSession.delete("Cook_Member.deleteMemberOne",mid);
	}
	
	
}
