package com.bsg.pcms.balance;

import java.text.DecimalFormat;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bsg.pcms.balance.dto.BalanceDTOEx;
import com.bsg.pcms.balance.svc.BalanceService;
import com.bsg.pcms.dto.PageLinkDTO;
import com.bsg.pcms.utility.BigstarConstant;
import com.bsg.pcms.utility.BigstarParamChecker;
import com.bsg.pcms.utility.PageUtil;

@Controller
@RequestMapping( value = "balance/cp" )
public class BalanceCpController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	BigstarConstant bigstarConstant; 
	
	@Autowired
	private BalanceService balanceService;
	
	@Autowired
	private PageUtil pageUtil;
	
	@Autowired
	private BigstarParamChecker paramChecker;
	
	@RequestMapping(value = "list.do")
	public ModelAndView list(BalanceDTOEx balanceDTOEx) {
		
		if(paramChecker.invalidSearchDate(balanceDTOEx.getSearchDate())){
			balanceDTOEx.setSearchDate(null);
		}
		
		List<BalanceDTOEx> balanceList = balanceService.cpList(balanceDTOEx);
		
		DecimalFormat df = new DecimalFormat("#");
		for( BalanceDTOEx bde :balanceList ) {
			bde.setCpMoney( df.format(bde.getCp_commission()) );
			bde.setTotalMoney( df.format(bde.getTotal_sale_price()) );
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("balance-cp-list");
		mav.addObject("navSeq", bigstarConstant.HEADER_BALANCE);
		mav.addObject("leftMenuSeq", bigstarConstant.LEFT_BALANCE_CP);
		mav.addObject("balanceList", balanceList);
		
		int balanceCpTotalCount = balanceService.cpsCount(balanceDTOEx);
		
		int pageNum = balanceDTOEx.getPageNum();
		PageLinkDTO pageLink = pageUtil.setPageLinkDTO(balanceCpTotalCount, pageNum);
		mav.addObject("pageLink", pageLink);
		mav.addObject("search", balanceDTOEx);
		
		return mav;
		
	}
	
	
	@RequestMapping(value = "create.do", method = RequestMethod.GET)
	public String create(BalanceDTOEx balanceDto) {
		logger.info("balance/sale-company/create.do");
		
		balanceService.create(balanceDto);
		
		return "redirect:/balance/sale-company/list.to";
	}
	
	@RequestMapping(value = "createView.do", method = RequestMethod.GET)
	public ModelAndView creatView(BalanceDTOEx balanceDto) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("balance-cp-info");
		mav.addObject("navSeq", bigstarConstant.HEADER_BALANCE);
		mav.addObject("leftMenuSeq", bigstarConstant.LEFT_BALANCE_CP);
		
		return mav;
		
	}
}
