package com.recipe.dao;

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
}
