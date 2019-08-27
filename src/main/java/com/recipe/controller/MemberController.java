package com.recipe.controller;

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
			@RequestParam("m_pw") String m_pw, @RequestParam("m_name") String m_name, @RequestParam("m_age") int m_age,
			@RequestParam("m_phone") String m_phone, @RequestParam("m_birth") String m_birth,
			@RequestParam("m_addr1") String m_addr1, @RequestParam("m_addr2") String m_addr2) {
		
		map.put("m_id", m_id);
		map.put("m_pw", m_pw);
		map.put("m_name", m_name);
		map.put("m_age", m_age);
		map.put("m_phone", Integer.parseInt(m_phone.replace("-", "")));
		map.put("m_birth", m_birth);
		map.put("m_addr", m_addr1 + " " + m_addr2);

		cDAO.insertMemberOne(map);
		return "redirect:/main.do";

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

}
