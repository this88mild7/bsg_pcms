package com.bsg.pcms.user;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bsg.pcms.dto.UserDTO;
import com.bsg.pcms.utility.BigstarConstant;

@Controller
public class UserController {

	private Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	BigstarConstant bigstarConstant;

	@Autowired
	private UserService userSevice;

	/** 로그인 화면
	 * @return
	 */
	@RequestMapping(value = "index.do", method = RequestMethod.GET)
	public ModelAndView index() {
		return new ModelAndView("index");
	}
	
	/** 회원가입 화면
	 * @return
	 */
	@RequestMapping(value = "join.do", method = RequestMethod.GET)
	public String join() {
		return "join";
	}
	
	@RequestMapping(value = "joinAction.do", method = RequestMethod.POST)
	public String joinAction(UserDTO userDTO) {
		int result = userSevice.createUser(userDTO);
		return "redirect:/index.do?result=" + result;
	}
	
	/** 회원정보 수정 화면
	 * @return
	 */
	@RequestMapping(value = "update.do", method = RequestMethod.GET)
	public ModelAndView update(UserDTO userDTO) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("join");
		mav.addObject("isUpdate", true);
		mav.addObject("user", userSevice.getUser(userDTO));
		
		return mav;
	}
	
	@RequestMapping(value = "updateAction.do", method = RequestMethod.POST)
	public String updateAction(UserDTO userDTO) {
		int result = userSevice.updateUser(userDTO);
		// TODO 회원정보 수정 후 어떤 화면으로 가야 맞는가?
		return "redirect:/dashboard.do";
	}

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(UserDTO member, HttpServletRequest request) {

		if (userSevice.hasNoUser(member)) {
			return "redirect:/index.do?result=0";
		}

		UserDTO resultDTO = userSevice.getUser(member);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", resultDTO.getId());
		map.put("level_cd", resultDTO.getLevel_cd());

		request.getSession().setAttribute("user", map);

		return "redirect:/dashboard.do"; 

	}

	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout() {
		return "redirect:/index.do";
	}

}
