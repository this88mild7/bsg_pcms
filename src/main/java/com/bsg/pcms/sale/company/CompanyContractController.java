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

import com.bsg.pcms.code.dto.CodeDTO;
import com.bsg.pcms.code.svc.CodeService;
import com.bsg.pcms.dto.PageLinkDTO;
import com.bsg.pcms.provision.content.ContentDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyContentsDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyContractDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyDTOEx;
import com.bsg.pcms.sale.company.dto.DeviceDTOEx;
import com.bsg.pcms.sale.company.svc.CompanyContractService;
import com.bsg.pcms.sale.company.svc.CompanyService;
import com.bsg.pcms.utility.BigstarConstant;
import com.bsg.pcms.utility.PageUtil;

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
	CodeService _codeService;
	
	@Autowired
	private PageUtil pageUtil;
	
	@RequestMapping( value = "list.do", method = RequestMethod.GET )
	public ModelAndView list(CompanyContractDTOEx companyDTO) {
		List<CompanyContractDTOEx> saleCompanyContractList = _saleContractService.list(companyDTO);
		int contractTotalCount = _saleContractService.totalCount(companyDTO);
		ModelAndView mav = saleContractListMAV(saleCompanyContractList, contractTotalCount);
		
		int pageNum = companyDTO.getPageNum();
		PageLinkDTO pageLink = pageUtil.setPageLinkDTO(contractTotalCount, pageNum);
		mav.addObject("pageLink", pageLink);
		mav.addObject("search", companyDTO);
		return mav;
	}

	@RequestMapping( value = "createView.do", method = RequestMethod.GET )
	public ModelAndView createView() {
		List<CompanyDTOEx> saleCompanyList = _saleCompanyService.list(null);
		List<CodeDTO> deviceList = _codeService.deviceList();
		List<CodeDTO> contractTypeList = _codeService.saleTypeList();
		List<CodeDTO> licenseList = _codeService.licenseList();
		
		ModelAndView mav = saleContractInfoMAV(deviceList, contractTypeList,licenseList);
		mav.addObject( _bigstarConstant.OB_SALE_COMPANY_LIST, saleCompanyList );
		mav.addObject( "viewType", "1");
		return mav;
	}
	
	@RequestMapping( value = "detail.do", method = RequestMethod.GET )
	public ModelAndView detail(CompanyContractDTOEx saleCompany, HttpServletRequest request) {
		CompanyContractDTOEx saleContractDetail = _saleContractService.detail(saleCompany);
		
		List<ContentDTOEx> contentsList = _saleContractService.contents(saleCompany);
		
		List<CodeDTO> deviceList = _codeService.deviceList();
		List<CodeDTO> contractTypeList = _codeService.saleTypeList();
		List<CodeDTO> licenseList = _codeService.licenseList();
		
		
		ModelAndView mav = saleContractInfoMAV(deviceList, contractTypeList, licenseList);
		mav.addObject( _bigstarConstant.OB_SALE_COMPANY_CONTRACT_DETAIL, saleContractDetail);
		mav.addObject( _bigstarConstant.OB_SALE_COMPANY_CONTRACT_CONTENTS, contentsList);
		mav.addObject( _bigstarConstant.OB_SALE_COMPANY_CONTRACTED_DEVICE, saleContractDetail.getContractedDeviceList() );
		mav.addObject( _bigstarConstant.OB_SALE_COMPANY_CONTRACT_INSTALLMENT, saleContractDetail.getInstallmentList() );
		mav.addObject( "viewType", "2");
		return mav;
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
	
	private ModelAndView saleContractListMAV(
			List<CompanyContractDTOEx> saleCompanyContractList,
			int totalCount) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName( _bigstarConstant.VW_SALE_COMPANY_CONTRACT_LIST );
		mav.addObject( _bigstarConstant.OB_LEFT_MENU_SEQ, _bigstarConstant.LEFT_SALE_COMPANY_CONTRACT);
		mav.addObject( _bigstarConstant.OB_NAV_SEQ, _bigstarConstant.HEADER_SALE_COMPANY );
		mav.addObject( _bigstarConstant.OB_SALE_COMPANY_CONTRACT_LIST, saleCompanyContractList );
		mav.addObject( "totalCount", totalCount );
		return mav;
	}
	
	private ModelAndView saleContractInfoMAV(List<CodeDTO> deviceList,
			List<CodeDTO> contractTypeList, List<CodeDTO> licenseList) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(_bigstarConstant.VW_SALE_COMPANY_CONTRACT_INFO);
		mav.addObject( _bigstarConstant.OB_LEFT_MENU_SEQ, _bigstarConstant.LEFT_SALE_COMPANY_CONTRACT);
		mav.addObject( _bigstarConstant.OB_NAV_SEQ, _bigstarConstant.HEADER_SALE_COMPANY);
		mav.addObject( _bigstarConstant.OB_DEVICE_LIST, deviceList );
		mav.addObject( _bigstarConstant.OB_CONTRACT_TYPE_LIST, contractTypeList );
		mav.addObject( _bigstarConstant.OB_LICENSE_LIST, licenseList );
		return mav;
	}
	
}
