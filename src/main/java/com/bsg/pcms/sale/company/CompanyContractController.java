package com.bsg.pcms.sale.company;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bsg.pcms.provision.content.ContentDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyContentsDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyContractDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyDTOEx;
import com.bsg.pcms.sale.company.dto.DeviceDTOEx;
import com.bsg.pcms.sale.company.svc.CompanyContractService;
import com.bsg.pcms.sale.company.svc.CompanyService;
import com.bsg.pcms.utility.BigstarConstant;
import com.bsg.pcms.view.PmsView;

@Controller
@RequestMapping( value = "saleCompany/contract" )
public class CompanyContractController {

	private Logger _logger = LoggerFactory.getLogger(CompanyContractController.class);
	
	@Autowired
	BigstarConstant _bigstarConstant; 
	
	@Autowired
	CompanyService _saleCompanyService; 
	
	@Autowired
	CompanyContractService _saleContractService;
	
	
	@Autowired
	PmsView _pmsView;
	
	@RequestMapping( value = "list.do", method = RequestMethod.GET )
	public ModelAndView list() {
		List<CompanyContractDTOEx> saleCompanyContractList = _saleContractService.list();
		return _pmsView.getSaleCompanyContractListView(saleCompanyContractList);
	}
	
	@RequestMapping( value = "search.do", method = RequestMethod.GET )
	public ModelAndView search(CompanyContractDTOEx companyDTO) {
		_logger.info(companyDTO.getSearchQuery());
		if(StringUtils.isBlank(companyDTO.getSearchQuery())){
			companyDTO.setSearchType(null);
		}
		List<CompanyContractDTOEx> saleCompanyContractList = _saleContractService.search(companyDTO);
		return _pmsView.getSaleCompanyContractListView(saleCompanyContractList);
	}
	
	
	@RequestMapping( value = "createView.do", method = RequestMethod.GET )
	public ModelAndView contractView() {
		List<CompanyDTOEx> saleCompanyList = _saleCompanyService.list();
		List<CompanyContractDTOEx> deviceList = _saleContractService.deviceList();
		List<CompanyContractDTOEx> contractTypeList = _saleContractService.saleTypeList();
		List<CompanyContractDTOEx> licenseList = _saleContractService.licenseList();
		return _pmsView.getSaleCompanyCreateContractView(saleCompanyList, deviceList, contractTypeList, licenseList);
	}
	
	@RequestMapping( value = "detail.do", method = RequestMethod.GET )
	public ModelAndView detail(CompanyContractDTOEx saleCompany, HttpServletRequest request) {
		CompanyContractDTOEx saleContractDetail = _saleContractService.detail(saleCompany);
		
		List<ContentDTOEx> contentsList = _saleContractService.contents(saleCompany);
		
		List<CompanyContractDTOEx> deviceList = _saleContractService.deviceList();
		List<CompanyContractDTOEx> contractTypeList = _saleContractService.saleTypeList();
		List<CompanyContractDTOEx> licenseList = _saleContractService.licenseList();
		
		return _pmsView.getSaleCompanyContractDetailView(saleContractDetail, contentsList,
				deviceList, contractTypeList, licenseList);
	}
	
	@RequestMapping( value = "create.do", method = RequestMethod.POST )
	public String create(CompanyContractDTOEx companyDTO, HttpServletRequest request) {
		_saleContractService.create(companyDTO);
		
		return "redirect:/saleCompany/contract/list.do";
	}


	@RequestMapping( value = "delete.do", method = RequestMethod.POST )
	public String delete(@RequestParam(value="contract_mgmtno", required=true)
			List<String> deleteContractList, HttpServletRequest request) {
		
		_saleContractService.delete(deleteContractList);
		
		return "redirect:/saleCompany/contract/list.do";
	}
	
	@RequestMapping( value = "modify.do", method = RequestMethod.POST )
	public String modify(CompanyContractDTOEx companyDTO, HttpServletRequest request){
		List<CompanyContentsDTOEx> sessionContentsList = (List<CompanyContentsDTOEx>)request.getSession().getAttribute("selectedContentsList");
		companyDTO.setContentsList(sessionContentsList);
		_saleContractService.modify(companyDTO);
		
		return "redirect:/saleCompany/contract/list.do";
	}
	
}
