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
		mav.setViewName("user-update");
		mav.addObject("isUpdate", true);
		mav.addObject("user", userSevice.getUser(userDTO));
		
		return mav;
	}
	
	@RequestMapping(value = "updateUserLevel.do", method = RequestMethod.GET)
	public String updateUserLevel(UserDTO userDTO) {
		int result = userSevice.updateUserLevel(userDTO);
		return "redirect:/site/manage.do";
	}

	@RequestMapping(value = "deleteUser.do", method = RequestMethod.GET)
	public String deleteUser(UserDTO userDTO) {
		int result = userSevice.deleteUser(userDTO);
		return "redirect:/site/manage.do";
	}
	
	@RequestMapping(value = "updateAction.do", method = RequestMethod.POST)
	public String updateAction(UserDTO userDTO) {
		int result = userSevice.updateUser(userDTO);
		return "redirect:/dashboard.do";
	}
	

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(UserDTO userDTO, HttpServletRequest request) {

		UserDTO loginDTO = userSevice.getLoginResult(userDTO);
		if (loginDTO == null) {
			return "redirect:/index.do?result=3";
		} else if(loginDTO.getLevel_cd().equalsIgnoreCase("2")) {
			return "redirect:/index.do?result=4";
		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", loginDTO.getId());
		map.put("level_cd", loginDTO.getLevel_cd());

		request.getSession().setAttribute("user", map);

		return "redirect:/dashboard.do"; 

	}

	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout() {
		return "redirect:/index.do";
	}

}
