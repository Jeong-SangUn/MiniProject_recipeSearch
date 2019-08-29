package com.recipe.dao;

import java.util.List;
import java.util.Map;

public interface MemberService {

	public int insertMemberOne(Map<String, Object> map);

	public Map<String, Object> selectMemberLogin(Map<String, Object> map);

	public Map<String, Object> selectoverlap(Map<String, Object> map);

	public Map<String, Object> selectMemberTable(String mid);

	public int insertMemberScoreInfo(Map<String, Object> map);

	public int updateMemberScoreInfo(Map<String, Object> map);

	public int insertMemberHitInfo(Map<String, Object> map);

	public int updateMemberHitInfo(Map<String, Object> map);
	
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map);
	
	public Map<String, Object> selectMemberOne(String mid);
	
	public int updateMemberOne(Map<String, Object> map);
	
	public int deleteMemberOne(String mid);

}
