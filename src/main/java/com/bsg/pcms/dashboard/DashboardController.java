package com.bsg.pcms.dashboard;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bsg.pcms.dto.CompanyDTO;
import com.bsg.pcms.dto.ProductDTO;
import com.bsg.pcms.provision.cp.CpService;
import com.bsg.pcms.sale.company.dto.CompanyContractDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyDTOEx;
import com.bsg.pcms.sale.company.svc.CompanyService;
import com.bsg.pcms.utility.BigstarConstant;

@Controller
public class DashboardController {
	
	private Logger logger = LoggerFactory.getLogger(DashboardController.class);
	
	@Autowired
	private CpService cpService;
	
	@Autowired
	private CompanyService _saleCompanyService;

	@Autowired
	BigstarConstant bigstarConstant; 
	
	@RequestMapping( value = "dashboard", method = RequestMethod.GET )
	public ModelAndView dashboard() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "dashboard" );
		mav.addObject( "navSeq", bigstarConstant.HEADER_MAIN);
		
		//CP업체 리스트
		List<CompanyDTO> cpList = cpService.getCpList(new CompanyDTO());
		mav.addObject( "cpList", cpList );
		
		List<CompanyDTOEx> saleCompanyList = _saleCompanyService.list(new CompanyDTOEx());
		mav.addObject( "saleCompanyList", saleCompanyList );
		
		List<CompanyContractDTOEx> saleProductList = _saleCompanyService.saleProductList();
		mav.addObject( "productList", saleProductList );
		
		return mav;
		
	}
	
	// rebase 테스트
}
