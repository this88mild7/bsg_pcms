package com.bsg.pcms.sale.company;

import java.util.ArrayList;
import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bsg.pcms.dto.BankDTO;
import com.bsg.pcms.sale.company.dto.CompanyDTOEx;
import com.bsg.pcms.sale.company.svc.CompanyService;
import com.bsg.pcms.utility.BankListMaker;
import com.bsg.pcms.view.PmsView;

@Controller
@RequestMapping( value = "saleCompany" )
public class CompanyController {

	private Logger _logger = LoggerFactory.getLogger(CompanyController.class);
	
	
	@Autowired
	private CompanyService _saleCompanyService; 
	
	@Autowired
	private PmsView _pmsView;
	
	@Autowired
	private BankListMaker bankListMaker;
	
	
	@RequestMapping( value = "list.do", method = RequestMethod.GET )
	public ModelAndView list() {
		List<CompanyDTOEx> saleCompanyList = _saleCompanyService.list();
		return _pmsView.getSaleCompanyListView(saleCompanyList);
	}
	
	@RequestMapping( value = "search.do", method = RequestMethod.GET )
	public ModelAndView search(CompanyDTOEx saleCompany) {
		List<CompanyDTOEx> saleCompanyList = _saleCompanyService.search(saleCompany);
		return _pmsView.getSaleCompanyListView(saleCompanyList);
	}
	
	@RequestMapping( value = "detail.do", method = RequestMethod.GET )
	public ModelAndView detail(CompanyDTOEx saleCompany) {
		CompanyDTOEx detail = _saleCompanyService.detail(saleCompany);
		_logger.info("{}", detail);
		return _pmsView.getSaleCompanyDetailView(detail);
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
		return _pmsView.getSaleCompanyCreateView(bankList);
	}
	
}
