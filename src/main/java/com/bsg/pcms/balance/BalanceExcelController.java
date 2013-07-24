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
import com.bsg.pcms.dto.BalanceDTO;
import com.bsg.pcms.dto.PageLinkDTO;
import com.bsg.pcms.sale.company.dto.CompanyDTOEx;
import com.bsg.pcms.sale.company.svc.CompanyService;
import com.bsg.pcms.utility.BankListMaker;
import com.bsg.pcms.utility.BigstarConstant;
import com.bsg.pcms.utility.BigstarParamChecker;
import com.bsg.pcms.utility.PageUtil;

@Controller
@RequestMapping( value = "balance" )
public class BalanceExcelController {

	private Logger logger = LoggerFactory.getLogger(BalanceExcelController.class);
	
	@Autowired
	BigstarConstant bigstarConstant;
	
	@Autowired
	private BalanceService balanceService;
	
	@Autowired
	private CompanyService _saleCompanyService; 
	
	@Autowired
	private PageUtil pageUtil;
	
	@Autowired
	private BigstarParamChecker paramChecker;
	
	@RequestMapping(value = "sale-company/list.excel")
	public ModelAndView saleList(BalanceDTOEx balanceDTOEx) {
		
		if(paramChecker.invalidSearchDate(balanceDTOEx.getSearchDate())){
			balanceDTOEx.setSearchDate(null);
		}
		
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
	
}
