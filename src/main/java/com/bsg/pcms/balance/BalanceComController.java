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
import com.bsg.pcms.utility.PageUtil;

@Controller
@RequestMapping( value = "balance/sale-company" )
public class BalanceComController {

	private Logger logger = LoggerFactory.getLogger(BalanceComController.class);
	
	@Autowired
	BigstarConstant bigstarConstant;
	
	@Autowired
	private BalanceService balanceService;
	
	@Autowired
	private CompanyService _saleCompanyService; 
	
	@Autowired
	private PageUtil pageUtil;
	
	@RequestMapping(value = "list.do")
	public ModelAndView list(BalanceDTOEx balanceDTOEx) {
		
		List<BalanceDTOEx> balanceList = balanceService.saleList(balanceDTOEx);
		
		DecimalFormat df = new DecimalFormat("#");
		for( BalanceDTOEx bde :balanceList ) {
			bde.setSaleMoney( df.format(bde.getSale_commission()) );
			bde.setCpMoney( df.format(bde.getCp_commission()) );
			bde.setTotalMoney( df.format(bde.getTotal_sale_price()) );
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("balance-sale-list");
		mav.addObject("navSeq", bigstarConstant.HEADER_BALANCE);
		mav.addObject("leftMenuSeq", bigstarConstant.LEFT_BALANCE_SALE);
		mav.addObject("balanceList", balanceList);
		mav.addObject("sorting_type", balanceDTOEx.getSorting_type());
		
		int balanceSalesTotalCount = balanceService.salesCount(balanceDTOEx);
		
		int pageNum = balanceDTOEx.getPageNum();
		PageLinkDTO pageLink = pageUtil.setPageLinkDTO(balanceSalesTotalCount, pageNum);
		mav.addObject("pageLink", pageLink);
		mav.addObject("search", balanceDTOEx);
		
		return mav;
		
	}
	
	@RequestMapping(value = "create.do", method = RequestMethod.POST)
	public String create(BalanceDTOEx balanceDto) {
		logger.info("balance/sale-company/create.do");
		
		balanceService.create(balanceDto);
		
		return "redirect:/balance/sale-company/list.do";
	}
	
	@RequestMapping(value = "createView.do", method = RequestMethod.GET)
	public ModelAndView creatView(BalanceDTOEx balanceDto) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("balance-sale-info");
		mav.addObject("navSeq", bigstarConstant.HEADER_BALANCE);
		mav.addObject("leftMenuSeq", bigstarConstant.LEFT_BALANCE_SALE);
		mav.addObject("isCreate", 1);
		
		//판매처 리스트
		mav.addObject("saleCompanyList", _saleCompanyService.list(new CompanyDTOEx()));
		
		return mav;
		
	}
	
	
}
