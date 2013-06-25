package com.bsg.pcms.balance;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bsg.pcms.balance.dto.BalanceDTOEx;
import com.bsg.pcms.balance.svc.BalanceService;
import com.bsg.pcms.utility.BigstarConstant;

@Controller
@RequestMapping( value = "balance/cp" )
public class BalanceCpController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	BigstarConstant bigstarConstant; 
	
	@Autowired
	private BalanceService balanceService;
	
	
	@RequestMapping(value = "list.do", method = RequestMethod.GET)
	public ModelAndView list() {
		
		List<BalanceDTOEx> balanceList = balanceService.cpList();
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("balance-cp-list");
		mav.addObject("navSeq", bigstarConstant.getHEADER_BALANCE());
		mav.addObject("leftMenuSeq", bigstarConstant.getLEFT_BALANCE_CP());
		mav.addObject("balanceList", balanceList);
		return mav;
		//주석 테스트561616161
		
	}
	
	@RequestMapping(value = "create.do", method = RequestMethod.GET)
	public ModelAndView create() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("balance-cp-info");
		mav.addObject("navSeq", bigstarConstant.getHEADER_BALANCE());
		mav.addObject("leftMenuSeq", bigstarConstant.getLEFT_BALANCE_CP());
		
		return mav;
		
	}
}
