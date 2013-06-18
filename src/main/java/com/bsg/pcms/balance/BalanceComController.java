package com.bsg.pcms.balance;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bsg.pcms.dto.BalanceDTO;
import com.bsg.pcms.utility.BigstarConstant;

@Controller
@RequestMapping( value = "balance/sale-company" )
public class BalanceComController {

	private Logger logger = LoggerFactory.getLogger(BalanceComController.class);
	
	@Autowired
	BigstarConstant bigstarConstant; 
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("balance");
		mav.addObject("navSeq", bigstarConstant.getHEADER_BALANCE());
		
		return mav;
		
	}
	
	@RequestMapping(value = "creat", method = RequestMethod.GET)
	public ModelAndView create(BalanceDTO balanceDto) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("balance");
		mav.addObject("navSeq", bigstarConstant.getHEADER_BALANCE());
		
		return mav;
		
	}
	
	@RequestMapping(value = "creatView", method = RequestMethod.GET)
	public ModelAndView creatView(BalanceDTO balanceDto) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("balance");
		mav.addObject("navSeq", bigstarConstant.getHEADER_BALANCE());
		return mav;
		
	}
	
	
}