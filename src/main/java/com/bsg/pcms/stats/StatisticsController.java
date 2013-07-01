package com.bsg.pcms.stats;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bsg.pcms.utility.BigstarConstant;

@Controller
public class StatisticsController {

	private Logger logger = LoggerFactory.getLogger(StatisticsController.class);
	
	@Autowired
	BigstarConstant bigstarConstant; 
	
	@RequestMapping( value = "statistics", method = RequestMethod.GET )
	public ModelAndView statistics() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "statistics" );
		mav.addObject( "navSeq", bigstarConstant.HEADER_STATS);
		
		return mav;
		
	}
}
