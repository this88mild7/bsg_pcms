package com.bigstarglobal.cms.balance;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bigstarglobal.cms.utility.BigstarConstant;

@Controller
@RequestMapping( value = "balance/cp" )
public class BalanceCpController {

	private Logger logger = LoggerFactory.getLogger(BalanceCpController.class);
	
	@Autowired
	BigstarConstant bigstarConstant; 
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("balance");
		mav.addObject("navSeq", bigstarConstant.getHEADER_BALANCE());
		
		return mav;
		//주석 테스트561616161
		
	}
	
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public ModelAndView create() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("balance");
		mav.addObject("navSeq", bigstarConstant.getHEADER_BALANCE());
		
		return mav;
		//주석 테스트561616161
		
	}
}
