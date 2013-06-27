package com.bsg.pcms.view;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.bsg.pcms.dto.BankDTO;
import com.bsg.pcms.dto.CompanyDTO;
import com.bsg.pcms.provision.content.ContentDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyContractDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyDTOEx;
import com.bsg.pcms.sale.company.dto.DeviceDTOEx;
import com.bsg.pcms.utility.BigstarConstant;

@Service
public class PmsViewImpl implements PmsView {
	
	private final String _OB_LEFT_MENU_SEQ = "leftMenuSeq";
	private final String _OB_NAV_SEQ = "navSeq";
	
	private final String _VW_SALE_COMPANY_LIST = 					"sale-company-list";
	private final String _OB_SALE_COMPANY_LIST = 					"salCompanyList";
	
	private final String _VW_SALE_COMPANY_INFO = 					"sale-company-info";
	private final String _OB_SALE_COMPANY_DETTAIL = 				"saleCompany";
	
	private final String _OB_SALE_COMPANY_BANK_LIST = 			"bankList";
	
	
	private final String _VW_SALE_COMPANY_CONTRACT_LIST = 		"sale-company-contract-list";
	private final String _OB_SALE_COMPANY_CONTRACT_LIST = 		"saleContractList";
	private final String _OB_SALE_COMPANY_CONTRACT_DEVICE = 		"deviceList";
	private final String _OB_SALE_COMPANY_CONTRACTED_DEVICE = 	"contractedDeviceList";
	private final String _OB_SALE_COMPANY_CONTRACT_TYPE = 		"contractTypeList";
	private final String _OB_SALE_COMPANY_LICENSE = 				"licenseList";
	
	private final String _VW_SALE_COMPANY_CONTRACT_INFO = 		"sale-company-contract-info";
	private final String _OB_SALE_COMPANY_CONTRACT_DETAIL = 		"saleContractDetail";
	private final String _OB_SALE_COMPANY_CONTRACT_INSTALLMENT = 		"installment";
	private final String _OB_SALE_COMPANY_CONTRACT_CONTENTS = 		"contentList";
	
	@Autowired
	BigstarConstant bigstarConstant;

	

	@Override
	public ModelAndView getSaleCompanyListView(List<CompanyDTOEx> customerList) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(_VW_SALE_COMPANY_LIST);
		mav.addObject( _OB_LEFT_MENU_SEQ, bigstarConstant.getLEFT_SALE_COMPANY() );
		mav.addObject( _OB_NAV_SEQ, bigstarConstant.getHEADER_SALE_COMPANY() );
		mav.addObject( _OB_SALE_COMPANY_LIST, customerList );
		return mav;
	}


	@Override
	public ModelAndView getSaleCompanyCreateView(ArrayList<BankDTO> bankList) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(_VW_SALE_COMPANY_INFO);
		mav.addObject( _OB_LEFT_MENU_SEQ, bigstarConstant.getLEFT_SALE_COMPANY());
		mav.addObject( _OB_NAV_SEQ, bigstarConstant.getHEADER_SALE_COMPANY() );
		mav.addObject( _OB_SALE_COMPANY_BANK_LIST, bankList );
		mav.addObject( "viewType", "1");
		return mav;
	}

	@Override
	public ModelAndView getSaleCompanyDetailView(CompanyDTOEx companyDTOEx) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(_VW_SALE_COMPANY_INFO);
		mav.addObject( _OB_LEFT_MENU_SEQ, bigstarConstant.getLEFT_SALE_COMPANY() );
		mav.addObject( _OB_NAV_SEQ, bigstarConstant.getHEADER_SALE_COMPANY() );
		mav.addObject( _OB_SALE_COMPANY_DETTAIL, companyDTOEx );
		mav.addObject( "viewType", "2");
		return mav;
	}
	

	@Override
	public ModelAndView getSaleCompanyContractListView(List<CompanyContractDTOEx> customerContractList) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName( _VW_SALE_COMPANY_CONTRACT_LIST );
		mav.addObject( _OB_LEFT_MENU_SEQ, bigstarConstant.getLEFT_SALE_COMPANY_CONTRACT());
		mav.addObject( _OB_NAV_SEQ, bigstarConstant.getHEADER_SALE_COMPANY() );
		mav.addObject( _OB_SALE_COMPANY_CONTRACT_LIST, customerContractList );
		return mav;
	}
	

	@Override
	public ModelAndView getSaleCompanyContractDetailView(
			CompanyContractDTOEx contractDetail,
			List<ContentDTOEx> contentsList,
			List<CompanyContractDTOEx> deviceList,
			List<CompanyContractDTOEx> contractTypeList,
			List<CompanyContractDTOEx> licenseList) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(_VW_SALE_COMPANY_CONTRACT_INFO);
		mav.addObject( _OB_LEFT_MENU_SEQ, bigstarConstant.getLEFT_SALE_COMPANY_CONTRACT() );
		mav.addObject( _OB_NAV_SEQ, bigstarConstant.getHEADER_SALE_COMPANY() );
		mav.addObject( _OB_SALE_COMPANY_CONTRACT_DETAIL, contractDetail);
		mav.addObject( _OB_SALE_COMPANY_CONTRACT_CONTENTS, contentsList);
		mav.addObject( _OB_SALE_COMPANY_CONTRACTED_DEVICE, contractDetail.getContractedDeviceList() );
		mav.addObject( _OB_SALE_COMPANY_CONTRACT_INSTALLMENT, contractDetail.getInstallmentList() );
		mav.addObject( _OB_SALE_COMPANY_CONTRACT_DEVICE, deviceList );
		mav.addObject( _OB_SALE_COMPANY_CONTRACT_TYPE, contractTypeList );
		mav.addObject( _OB_SALE_COMPANY_LICENSE, licenseList );
		mav.addObject( "viewType", "2");
		return mav;
	}


	@Override
	public ModelAndView getSaleCompanyCreateContractView(
			List<CompanyDTOEx> saleCompanyList,
			List<CompanyContractDTOEx> deviceList,
			List<CompanyContractDTOEx> contractTypeList,
			List<CompanyContractDTOEx> licenseList) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(_VW_SALE_COMPANY_CONTRACT_INFO);
		mav.addObject( _OB_LEFT_MENU_SEQ, bigstarConstant.getLEFT_SALE_COMPANY_CONTRACT());
		mav.addObject( _OB_NAV_SEQ, bigstarConstant.getHEADER_SALE_COMPANY() );
		mav.addObject( _OB_SALE_COMPANY_LIST, saleCompanyList );
		mav.addObject( _OB_SALE_COMPANY_CONTRACT_DEVICE, deviceList );
		mav.addObject( _OB_SALE_COMPANY_CONTRACT_TYPE, contractTypeList );
		mav.addObject( _OB_SALE_COMPANY_LICENSE, licenseList );
		mav.addObject( "viewType", "1");
		return mav;
	}

}
