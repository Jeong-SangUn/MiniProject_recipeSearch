package com.recipe.dao;

import java.util.List;
import java.util.Map;

import com.recipe.vo.Comment;
import com.recipe.vo.Recipe;

public interface RecipeService {

	public List<Map<String, Object>> selectRecipeList(String search);

	public int deleteComment(int no);

	public int insertComment(Comment comment);

	public Recipe selectRecipeOne(int rid);

	public List<Recipe> rankRecipeList();

	public List<Comment> selectComment(int rid);

	public int insertRecipe(Recipe recipe);

	public Recipe selectImage(int rid);
	
	public Recipe selectThumnail(int rid);
	
	public int updateThumnail(Recipe recipe);
	
	public int updateHit(int rid);
	
	public int updateScore(Recipe recipe);

	public int updateAvgScore(Recipe recipe);
}
