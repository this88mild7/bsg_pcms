package com.bsg.pcms.balance;

import java.text.DecimalFormat;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bsg.pcms.balance.dto.BalanceDTOEx;
import com.bsg.pcms.balance.svc.BalanceService;
import com.bsg.pcms.utility.BigstarConstant;
import com.bsg.pcms.utility.BigstarParamChecker;

@Controller
@RequestMapping( value = "balance" )
public class BalanceExcelController {

	private Logger logger = LoggerFactory.getLogger(BalanceExcelController.class);
	
	@Autowired
	BigstarConstant bigstarConstant;
	
	@Autowired
	private BalanceService balanceService;
	
	@Autowired
	private BigstarParamChecker paramChecker;
	
	@RequestMapping(value = "sale-company/list.excel")
	public ModelAndView saleList(BalanceDTOEx balanceDTOEx) {
		
		if(paramChecker.invalidSearchDate(balanceDTOEx.getSearchDate())){
			balanceDTOEx.setSearchDate(null);
		}
		
		this.checkEmpty(balanceDTOEx);
		
		List<BalanceDTOEx> balanceList = balanceService.saleList(balanceDTOEx);
		
		DecimalFormat df = new DecimalFormat("#");
		for( BalanceDTOEx bde :balanceList ) {
			bde.setSaleMoney( df.format(bde.getSale_commission()) );
			bde.setCpMoney( df.format(bde.getCp_commission()) );
			bde.setOwnerMoney( df.format(bde.getOwner_profit()) );
			bde.setTotalMoney( df.format(bde.getTotal_sale_price()) );
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("balanceSaleExcelView");
		mav.addObject("balanceList", balanceList);
		
		
		return mav;
		
	}
	
	@RequestMapping(value = "cp/list.excel")
	public ModelAndView list(BalanceDTOEx balanceDTOEx) {
		
		if(paramChecker.invalidSearchDate(balanceDTOEx.getSearchDate())){
			balanceDTOEx.setSearchDate(null);
		}
		
		this.checkEmpty(balanceDTOEx);
		
		List<BalanceDTOEx> balanceList = balanceService.cpList(balanceDTOEx);
		
		DecimalFormat df = new DecimalFormat("#");
		for( BalanceDTOEx bde :balanceList ) {
			bde.setCpMoney( df.format(bde.getCp_commission()) );
			bde.setTotalMoney( df.format(bde.getTotal_sale_price()) );
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("balanceCompanyExcelView");
		mav.addObject("balanceList", balanceList);
		
		return mav;
		
	}

	/** 공백 값이 들어오면 NULL값으로 변경
	 * @param balanceDTOEx
	 */
	private void checkEmpty(BalanceDTOEx balanceDTOEx) {
		
		if( balanceDTOEx.getSearchDate() != null && balanceDTOEx.getSearchDate().length() == 0 ) {
			balanceDTOEx.setSearchDate(null);
		}
		if( balanceDTOEx.getSearchQuery() != null && balanceDTOEx.getSearchQuery().length() == 0 ) {
			balanceDTOEx.setSearchQuery(null);
		}
	}
}
