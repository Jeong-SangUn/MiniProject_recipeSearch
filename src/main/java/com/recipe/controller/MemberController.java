package com.recipe.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.recipe.dao.MemberService;

@Controller
@RequestMapping("/mem")
public class MemberController {
	// DAO 객체 생성
	@Autowired
	private MemberService cDAO;

	@RequestMapping(value = "/popup.do", method = RequestMethod.GET)
	public String popup() {
		return "popup";
	}

	@RequestMapping(value = "/popup.do", method = RequestMethod.POST)
	public String popup(@RequestParam Map<String, Object> map, Model model) {
		return "popup";
	}

	@RequestMapping(value = "/registerOverlap.do", method = RequestMethod.POST)
	public String registerOverlap(@RequestParam Map<String, Object> map, Model model,
			@RequestParam("m_id") String m_id) {
		map.put("m_id", m_id);

		Map<String, Object> rmap = cDAO.selectoverlap(map);
		// 아이디 중복 값이 없을때
		if (rmap == null) {
			model.addAttribute("msg", "noting");
		} else { // 아이디 중복이 있을때
			model.addAttribute("msg", "overlap");
		}

		model.addAttribute("m_id", m_id);

		return "popup";
	}

	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String join() {
		return "join";
	}

	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String join(@RequestParam Map<String, Object> map, Model model, @RequestParam("m_id") String m_id,
			@RequestParam("m_pw") String m_pw, @RequestParam("m_pw2") String m_pw2,
			@RequestParam("m_name") String m_name,
			@RequestParam("m_phone") int m_phone, @RequestParam("m_birth") String m_birth,
			@RequestParam("m_addr1") String m_addr1, @RequestParam("m_addr2") String m_addr2) {
		Map<String, Object> rmap = cDAO.selectMemberLogin(map);
		map.put("m_id", m_id);
		map.put("m_pw", m_pw);
		map.put("m_name", m_name);
		
		map.put("m_phone", m_phone);
		map.put("m_birth", m_birth);
		map.put("m_addr", m_addr1 + " " + m_addr2);
		if (rmap == null) {
			cDAO.insertMemberOne(map);
			return "redirect:/mem/login.do";
		} else {
			return "redirect:/mem/join.do";
		}
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(Model model, HttpSession httpSession) {
		return "login";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(@RequestParam Map<String, Object> map, HttpSession httpSession, Model model) {

		Map<String, Object> rmap = cDAO.selectMemberLogin(map);
		if (rmap != null) {
			httpSession.setAttribute("S_ID", rmap.get("MID"));
			httpSession.setAttribute("S_NA", rmap.get("NAME"));
			httpSession.setAttribute("GRADE", rmap.get("GRADE"));
			model.addAttribute("msg", "success");

			System.out.println("로그인 성공");
			return "redirect:/home.do";
		} else {
			model.addAttribute("msg", "failure");
			System.out.println("로그인 실패");
			return "login";
		}
	}

	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session, Model model) {
		model.addAttribute("msg", "로그아웃되었습니다.");
		session.invalidate();
		return "logout";
	}

	// 마이페이지
		@RequestMapping(value = "/list.do", method = RequestMethod.GET)
		public String list(Model model, @RequestParam("mid") String mid) {
			System.out.println("mid: "+mid);
			Map<String, Object> map = cDAO.selectMemberOne(mid);
			model.addAttribute("m", map);
			return "list";
		}

		// 본인정보수정
		@RequestMapping(value = "/modify.do", method = RequestMethod.GET)
		public String modify(@RequestParam("mid") String mid, Model model) {
			Map<String, Object> map = cDAO.selectMemberOne(mid);
			model.addAttribute("map", map);
			model.addAttribute("msg",map.get("mid"));
			return "modify";
		}
		
		// 본인정보수정
		@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
		public String modify(@RequestParam HashMap<String,Object> map) {
			cDAO.updateMemberOne(map);
			System.out.println(map);
			return "redirect:/mem/list.do?mid="+map.get("mid");
		}
		
		//마이페이지 탈퇴
		   @RequestMapping(value="/delete.do",method=RequestMethod.GET)
		   public String delete(@RequestParam("mid") String mid,Model model) {
		      Map<String, Object> parameter_map = new HashMap<String, Object>();
		      parameter_map.put("m_id", mid);
		      model.addAttribute("MID",mid);
		      
		      
		      Map<String, Object> rmap = cDAO.selectoverlap(parameter_map);
		      
		      model.addAttribute("MPW",rmap.get("PW"));
		       
		      return "delete";
		   }
		   
		   //마이페이지 탈퇴
		   @RequestMapping(value="/delete.do",method=RequestMethod.POST)
		   public String delete(HttpSession session,Model model,@RequestParam Map<String, Object> map,
		                     @RequestParam("m_id") String mid) {
		      System.out.println("확인");
		      Map<String,Object> cmap = cDAO.selectMemberLogin(map);
		      if (cmap != null) {
		         cDAO.deleteMemberOne(mid);
		         model.addAttribute("ok", "success");
		         session.invalidate();
		         return "redirect:/home.do";
		      }
		      else {
		         cDAO.selectMemberLogin(map);
		         System.out.println(mid);
		         model.addAttribute("ok", "failure");
		         model.addAttribute("map",mid);
		         return "delete";
		      }

		   }
}
