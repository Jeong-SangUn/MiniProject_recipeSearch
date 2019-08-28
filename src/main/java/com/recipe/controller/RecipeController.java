package com.recipe.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.recipe.dao.MemberService;
import com.recipe.dao.RecipeService;
import com.recipe.vo.Comment;
import com.recipe.vo.Recipe;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class RecipeController {

	@Autowired
	private RecipeService rDAO;
	@Autowired
	private MemberService mDAO;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "main";
	}

	@RequestMapping(value = "/rank.do", method = RequestMethod.GET)
	public String rank(Model model) {
		List<Recipe> rankList = rDAO.rankRecipeList();
		model.addAttribute("list", rankList);
		return "rank";

	}
	
	@RequestMapping(value = "/rankhelp.do", method = RequestMethod.GET)
	public String rankhelp() {
		return "rankhelp";
	}
	
	@RequestMapping(value = "/updateScore.do", method = RequestMethod.GET)
	public String updateScore(@RequestParam("score") double score, @RequestParam("rid") int rid,
			HttpSession httpSession, Model model) {

		Map<String, Object> map = new HashMap<String, Object>();
		String mid = (String) httpSession.getAttribute("S_ID");
		Map<String, Object> mid_chk = null;
		mid_chk = mDAO.selectMemberTable(mid);
		map.put("mid", mid);
		map.put("mscore", rid + "/");
		

		if (mid_chk == null) {
			mDAO.insertMemberScoreInfo(map);
		} else {
			String score_chk = "";
			System.out.println("score_chk+ 전: "+ score_chk);
			score_chk = score_chk+(String)mid_chk.get("MSCORE");
			System.out.println("score_chk:"+score_chk);
			System.out.println("Integer.toString(rid) + /: "+Integer.toString(rid) + "/");
			if (score_chk.contains(Integer.toString(rid) + "/")) {
				System.out.println(1);
				model.addAttribute("score_chk", true);
				return "redirect:recipe.do?id=" + rid;
			} else {
				mDAO.updateMemberScoreInfo(map);
				System.out.println(2);
			}
		}
		Recipe recipe = new Recipe();
		double result_avg;

		recipe.setRid(rid);
		recipe.setScore_all(score);
		rDAO.updateScore(recipe); // 레시피 총점 증가, 평가 인원수 1증가

		recipe = rDAO.selectRecipeOne(rid);
		result_avg = recipe.getScore_all() / recipe.getScore_num();
		recipe.setScore_avg(result_avg);
		rDAO.updateAvgScore(recipe);
		return "redirect:recipe.do?id=" + rid;
	}

	@RequestMapping(value = "/recipeImg.do", method = RequestMethod.GET)
	public ResponseEntity<byte[]> recipeImg(@RequestParam("id") String rid) {
		int id = Integer.parseInt(rid);
		try {
			Recipe recipe = rDAO.selectImage(id);
			HttpHeaders header = new HttpHeaders();
			header.setContentType(MediaType.MULTIPART_FORM_DATA);
			// byte[]를 이미지로 변환해서 전달함.
			return new ResponseEntity<byte[]>(recipe.getRimage(), header, HttpStatus.OK);

		} catch (Exception e) {
			return null;
		}
	}

	@RequestMapping(value = "/recipeThumnail.do", method = RequestMethod.GET)
	public ResponseEntity<byte[]> recipeThumnail(@RequestParam("id") String rid) {
		int id = Integer.parseInt(rid);
		try {
			Recipe recipe = rDAO.selectThumnail(id);
			HttpHeaders header = new HttpHeaders();
			header.setContentType(MediaType.MULTIPART_FORM_DATA);
			// byte[]를 이미지로 변환해서 전달함.
			return new ResponseEntity<byte[]>(recipe.getThumnail(), header, HttpStatus.OK);

		} catch (Exception e) {
			return null;
		}
	}

	@RequestMapping(value = "/recipe.do", method = RequestMethod.GET)
	public String recipe(@RequestParam("id") String rid, Model model, HttpSession httpSession) {		
		int id = Integer.parseInt(rid);
		
		Recipe recipe = rDAO.selectRecipeOne(id);
		List<Comment> comment = rDAO.selectComment(id);
		String item = recipe.getRitem();
		item = item.replace("양념장", "\n양념장");
		recipe.setRitem(item);
		item = recipe.getRrecipe();
		for (int i = 1; i < 10; i++) {
			item = item.replace(Integer.toString(i) + ". ", "\n" + Integer.toString(i) + ".");
		}
		
		recipe.setRrecipe(item);
		model.addAttribute("recipe", recipe);
		model.addAttribute("comment", comment);
		model.addAttribute("insert_comment", new Comment());
		
		
		///////////////////////////////////////////
		Map<String, Object> map = new HashMap<String, Object>();
		String mid = (String) httpSession.getAttribute("S_ID");
		Map<String, Object> mid_chk = null;
		mid_chk = mDAO.selectMemberTable(mid);
		map.put("mid", mid);
		map.put("mhit", id + "/");
		/////////////////////////////////////////////
		if (mid_chk == null) {
			mDAO.insertMemberHitInfo(map);
		} else {
			String hit_chk = "";
			hit_chk = hit_chk+(String)mid_chk.get("MHIT");
			if (hit_chk.contains(rid + "/")) {
				return "recipe";
			} else {
				mDAO.updateMemberHitInfo(map);
			}
		}
		System.out.println(5);
		rDAO.updateHit(id);
		return "recipe";
	}

	@RequestMapping(value = "/insertcomment.do", method = RequestMethod.POST)
	public String insertcomment(@ModelAttribute("insert_comment") Comment comment) {
		rDAO.insertComment(comment);
		return "redirect:recipe.do?id=" + comment.getRid();
	}

	@RequestMapping(value = "/deletecomment.do", method = RequestMethod.POST)
	public String deletecomment(@RequestParam("comment_cid") int cid, @RequestParam("comment_rid") int rid) {
		rDAO.deleteComment(cid);
		return "redirect:recipe.do?id=" + rid;
	}

	/////////////////////////////////////////////////////////////////////////////////////////////////////

	@RequestMapping(value = "/search.do", method = RequestMethod.GET)
	public String search() {
		return "search";
	}

	@RequestMapping(value = "/insert.do", method = RequestMethod.GET)
	public String insert(Model model) {
		model.addAttribute("recipe", new Recipe());
		return "insert";
	}

	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public String insert(@ModelAttribute("recipe") Recipe recipe, MultipartHttpServletRequest request) {

		try {
			MultipartFile file = request.getFile("rimage1");
			recipe.setRimage(file.getBytes());
			rDAO.insertRecipe(recipe);
			return "redirect:insert.do";
		} catch (Exception e) {
			return "redirect:insert.do";
		}
	}

	@RequestMapping(value = "/thumnail.do", method = RequestMethod.GET)
	public String thumnailpage(Model model) {
		model.addAttribute("recipe", new Recipe());
		return "thumnail";
	}

	@RequestMapping(value = "/thumnail.do", method = RequestMethod.POST)
	public String thumnail(@ModelAttribute("recipe") Recipe recipe, MultipartHttpServletRequest request)
			throws IOException {
		File image = new File("C:/Users/User/Desktop/recipe/" + Integer.toString(recipe.getRid()) + ".jpg");
		File thumbnail = new File("C:/Users/User/Desktop/recipe/" + Integer.toString(recipe.getRid()) + ".png");

		if (image.exists()) {
			thumbnail.getParentFile().mkdirs();
			Thumbnails.of(image).size(150, 150).outputFormat("png").toFile(thumbnail);
		}

		FileInputStream input = new FileInputStream(thumbnail);
		MultipartFile multipartFile = new MockMultipartFile(Integer.toString(recipe.getRid()), thumbnail.getName(),
				"png", IOUtils.toByteArray(input));

		MultipartFile file = multipartFile;
		recipe.setThumnail(file.getBytes());
		rDAO.updateThumnail(recipe);
		return "redirect:thumnail.do";

	}
	
//	---------------------------------------------------------
	@RequestMapping(value = "/admin.do", method = RequestMethod.GET)
	public String admin(Model model) {
		List<Recipe> selList = rDAO.selectRecipeList();
		model.addAttribute("list", selList);
		return "admin";
	}

	
	  @RequestMapping(value = "/admin_insert.do", method = RequestMethod.GET)
	  public String admin_insert() { return "admin_insert"; }
	  
	  @RequestMapping(value = "/admin_insert.do", method = RequestMethod.POST)
	  public String admin_insert(Recipe recipe, MultipartHttpServletRequest request) { 
		  try { 
			  MultipartFile file = request.getFile("rimage1");
			  recipe.setRimage(file.getBytes()); 
			  rDAO.insertRecipe(recipe);
			  	return "redirect:admin_insert.do"; 
			  } catch (Exception e) { 
				return "redirect:admin_insert.do"; 
			  } 
		  }
	  
	  @RequestMapping(value="/admin_delete.do", method=RequestMethod.GET)
	  public String admin_delete(@RequestParam("id") int rid) {
		  rDAO.deleteRecipeOne(rid);
		  return "redirect:admin.do";		  
	  }
	 
	
	  @RequestMapping(value = "/admin_update.do", method = RequestMethod.GET)
	  public String admin_update(@RequestParam("id") String rid, Model model,
	  HttpSession httpSession) { int id = Integer.parseInt(rid);
	  
	  Recipe recipe = rDAO.selectRecipeOne(id);
	  
	  String item = recipe.getRitem(); item = item.replace("양념장", "\n양념장");
	  recipe.setRitem(item); item = recipe.getRrecipe(); for (int i = 1; i < 10;
	  i++) { item = item.replace(Integer.toString(i) + ". ", "\n" +
	  Integer.toString(i) + "."); } recipe.setRrecipe(item);
	  model.addAttribute("recipe", recipe);	  
	  return "admin_update"; 
	  }	  

	  @RequestMapping(value = "/admin_update.do", method = RequestMethod.POST)
	  public String admin_update(@ModelAttribute Recipe recipe, MultipartHttpServletRequest request) {
		  int rid=recipe.getRid();
		  try {
			  MultipartFile file = request.getFile("rimage1");
			  recipe.setRimage(file.getBytes());
			  rDAO.updateRecipeOne(recipe);
			  	return "redirect:admin_update.do?id="+rid; 
			  } catch (Exception e) { 
				return "redirect:admin_update.do?id="+rid;
		  }
	  }
}
