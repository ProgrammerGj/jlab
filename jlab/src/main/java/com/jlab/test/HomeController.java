package com.jlab.test;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jlab.test.dao.MemberDAO;
import com.jlab.test.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private MemberDAO dao;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/memberList.do", method = RequestMethod.GET)
	public String home(@RequestParam("parentNo") int parentNo, Locale locale, Model model) {

		logger.info("parentNo :: {}", parentNo);

		MemberVO vo = new MemberVO();
		vo.setParentNo(parentNo);
		List<MemberVO> list = dao.selectList(vo);
		logger.info(list.toString());
		model.addAttribute("MemberList", list);
		model.addAttribute("parentNo", parentNo);

		return "Member/home";
	}

}
