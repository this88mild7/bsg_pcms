package com.bigstarglobal.cms.site;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bigstarglobal.cms.user.UserService;
import com.bigstarglobal.cms.utility.BigstarConstant;

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
		mav.addObject( "leftMenuSeq", bigstarConstant.getLEFT_MEMBER() );
		mav.addObject( "navSeq", bigstarConstant.getHEADER_SITE() );
		
		mav.addObject( "memberList", userService.getUserList() );

		return mav;
		
	}
	
}
