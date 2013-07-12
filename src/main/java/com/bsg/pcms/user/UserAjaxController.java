package com.bsg.pcms.user;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bsg.pcms.dto.UserDTO;
import com.bsg.pcms.utility.BigstarConstant;
import com.bsg.pcms.utility.JsonResponseMaker;

@Controller
public class UserAjaxController {

	private Logger logger = LoggerFactory.getLogger(UserAjaxController.class);

	@Autowired
	BigstarConstant bigstarConstant;

	@Autowired
	private UserService userSevice;

	@Autowired
	private JsonResponseMaker jsonResponseMaker;
	
	/** id를 받아 user인지 아닌지 체크
	 * 
	 * param 
	 * id  
	 * 
	 * response
	 * {
			"code": 200,
			"msg": "OK"
		}
	 * @return
	 */
	@RequestMapping( value = "getUser.ajax", produces = "application/json;charset=UTF-8")
	public @ResponseBody String getUser(UserDTO userDTO) {
		
		UserDTO userResult = userSevice.getUser(userDTO);
		
		return jsonResponseMaker.generateGetUserJson(userResult);
	}
}
