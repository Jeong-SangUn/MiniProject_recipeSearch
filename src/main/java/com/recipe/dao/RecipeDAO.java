package com.recipe.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.recipe.vo.Comment;
import com.recipe.vo.Recipe;

@Service
public class RecipeDAO implements RecipeService{
	
	@Autowired
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	@Override
	public List<Map<String, Object>> selectRecipeList(String search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Recipe selectRecipeOne(int rid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("RecipeMapper.selectRecipeOne",rid);
	}

	@Override
	public List<Comment> selectComment(int rid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("RecipeMapper.selectComment",rid);
	}

	@Override
	public List<Recipe> rankRecipeList() {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("RecipeMapper.rankRecipeList");
	}

	@Override
	public int insertRecipe(Recipe recipe) {
		// TODO Auto-generated method stub
		return sqlSession.insert("RecipeMapper.insertRecipe",recipe);
	}

	@Override
	public Recipe selectImage(int rid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("RecipeMapper.selectImage",rid);
	}

	@Override
	public int insertComment(Comment comment) {
		// TODO Auto-generated method stub
		return sqlSession.insert("RecipeMapper.insertComment",comment);
	}

	@Override
	public int deleteComment(int no) {
		// TODO Auto-generated method stub
		return sqlSession.delete("RecipeMapper.deleteComment",no);
	}

	@Override
	public int updateScore(Recipe recipe) {
		// TODO Auto-generated method stub
		return sqlSession.update("RecipeMapper.updateScore",recipe);
	}
	@Override
	public int updateAvgScore(Recipe recipe) {
		// TODO Auto-generated method stub
		return sqlSession.update("RecipeMapper.updateAvgScore",recipe);
	}

	@Override
	public int updateThumnail(Recipe recipe) {
		// TODO Auto-generated method stub
		return sqlSession.update("RecipeMapper.updateThumnail",recipe);
	}

	@Override
	public Recipe selectThumnail(int rid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("RecipeMapper.selectThumnail",rid);
	}

	@Override
	public int updateHit(int rid) {
		// TODO Auto-generated method stub
		return sqlSession.update("RecipeMapper.updateHit",rid);
	}
//	------------------------------------------------------------
	@Override
	public List<Recipe> selectRecipeList() {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("RecipeMapper.selectRecipeList");
	}
	
	@Override
	public int deleteRecipeOne(int rid) {
		return sqlSession.delete("RecipeMapper.deleteRecipeOne", rid);
	}
	
	@Override
	public int updateRecipeOne(Recipe recipe) {
		return sqlSession.update("RecipeMapper.updateRecipeOne", recipe);
	}
}
