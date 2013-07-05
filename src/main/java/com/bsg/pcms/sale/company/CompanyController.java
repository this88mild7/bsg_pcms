package com.bsg.pcms.sale.company;

import java.util.ArrayList;
import java.util.List;


import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bsg.pcms.dto.BankDTO;
import com.bsg.pcms.dto.PageLinkDTO;
import com.bsg.pcms.sale.company.dto.CompanyDTOEx;
import com.bsg.pcms.sale.company.svc.CompanyService;
import com.bsg.pcms.utility.BankListMaker;
import com.bsg.pcms.utility.BigstarConstant;
import com.bsg.pcms.utility.PageUtil;

@Controller
@RequestMapping( value = "saleCompany" )
public class CompanyController {

	private Logger _logger = LoggerFactory.getLogger(CompanyController.class);
	
	
	@Autowired
	private CompanyService _saleCompanyService; 
	
//	@Autowired
//	private PmsView _pmsView;
	
	@Autowired
	private BankListMaker bankListMaker;
	
	@Autowired
	BigstarConstant _bigstarConstant;
	
	@Autowired
	private PageUtil pageUtil;
	
	
	@RequestMapping( value = "list.do", method = RequestMethod.GET )
	public ModelAndView list(CompanyDTOEx saleCompany) {
		List<CompanyDTOEx> saleCompanyList = _saleCompanyService.list(saleCompany);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(_bigstarConstant.VW_SALE_COMPANY_LIST);
		mav.addObject( _bigstarConstant.OB_LEFT_MENU_SEQ, _bigstarConstant.LEFT_SALE_COMPANY );
		mav.addObject( _bigstarConstant.OB_NAV_SEQ, _bigstarConstant.HEADER_SALE_COMPANY );
		mav.addObject( _bigstarConstant.OB_SALE_COMPANY_LIST, saleCompanyList );
		
		int companyTotalCount = _saleCompanyService.totalCount(saleCompany);
		int pageNum = saleCompany.getPageNum();
		PageLinkDTO pageLink = pageUtil.setPageLinkDTO(companyTotalCount, pageNum);
		mav.addObject("pageLink", pageLink);
		mav.addObject("search", saleCompany);
		
		return mav;
		
	}
	
	@RequestMapping( value = "detail.do", method = RequestMethod.GET )
	public ModelAndView detail(CompanyDTOEx saleCompany) {
		CompanyDTOEx detail = _saleCompanyService.detail(saleCompany);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(_bigstarConstant.VW_SALE_COMPANY_INFO);
		mav.addObject( _bigstarConstant.OB_LEFT_MENU_SEQ, _bigstarConstant.LEFT_SALE_COMPANY );
		mav.addObject( _bigstarConstant.OB_NAV_SEQ, _bigstarConstant.HEADER_SALE_COMPANY );
		mav.addObject( _bigstarConstant.OB_SALE_COMPANY_DETTAIL, detail );
		mav.addObject( "viewType", "2");
		return mav;
	}
	
	@RequestMapping( value = "modify.do", method = RequestMethod.POST )
	public String modify(CompanyDTOEx saleCompany) {
		_saleCompanyService.modify(saleCompany);
		return "redirect:/saleCompany/list.do";
	}
	
	@RequestMapping( value = "delete.do", method = RequestMethod.POST )
	public String delete(CompanyDTOEx saleCompany) {
		_logger.info("{}", saleCompany);
		_saleCompanyService.delete(saleCompany);
		return "redirect:/saleCompany/list.do";
	}

	@RequestMapping( value = "create.do", method = RequestMethod.POST )
	public String create(CompanyDTOEx companyDTOEx) {
		
		_saleCompanyService.create(companyDTOEx);
		return "redirect:/saleCompany/list.do";
	}
	
	@RequestMapping( value = "createView.do", method = RequestMethod.GET )
	public ModelAndView createView() {
		ArrayList<BankDTO> bankList = bankListMaker.getBankList();
		ModelAndView mav = new ModelAndView();
		mav.setViewName(_bigstarConstant.VW_SALE_COMPANY_INFO);
		mav.addObject( _bigstarConstant.OB_LEFT_MENU_SEQ, _bigstarConstant.LEFT_SALE_COMPANY);
		mav.addObject( _bigstarConstant.OB_NAV_SEQ, _bigstarConstant.HEADER_SALE_COMPANY );
		mav.addObject( _bigstarConstant.OB_SALE_COMPANY_BANK_LIST, bankList );
		mav.addObject( "viewType", "1");
		return mav;
	}
	
}
