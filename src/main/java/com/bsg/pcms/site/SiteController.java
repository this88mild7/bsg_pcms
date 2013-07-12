package com.bsg.pcms.site;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bsg.pcms.user.UserService;
import com.bsg.pcms.utility.BigstarConstant;

@Controller
@RequestMapping( value = "site" )
public class SiteController {

	private Logger logger = LoggerFactory.getLogger(SiteController.class);
	
	@Autowired
	BigstarConstant bigstarConstant; 
	
	@Autowired
	private SiteService siteService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping( value = "manage", method = RequestMethod.GET )
	public ModelAndView manage() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "site-manage" );
		mav.addObject( "leftMenuSeq", bigstarConstant.LEFT_MEMBER);
		mav.addObject( "navSeq", bigstarConstant.HEADER_SITE);
		
		mav.addObject( "userList", userService.getUserList() );

		return mav;
		
	}
	
}
