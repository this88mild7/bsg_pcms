package com.bigstarglobal.cms.view;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.bigstarglobal.cms.dto.BankDTO;
import com.bigstarglobal.cms.dto.CompanyDTO;
import com.bigstarglobal.cms.sale.company.dto.CompanyContractDTOEx;
import com.bigstarglobal.cms.sale.company.dto.CompanyDTOEx;
import com.bigstarglobal.cms.sale.company.dto.DeviceDTOEx;

public interface PmsView {
	
	
	public ModelAndView getSaleCompanyListView(
			List<CompanyDTOEx> customerList);
	
	public ModelAndView getSaleCompanyDetailView(
			CompanyDTOEx companyDTOEx);
	
	public ModelAndView getSaleCompanyCreateView(ArrayList<BankDTO> bankList);
	
	public ModelAndView getSaleCompanyContractListView(
			List<CompanyContractDTOEx> customerContractList);
	
	public ModelAndView getSaleCompanyCreateContractView(
			List<CompanyContractDTOEx> customerList);
	
	public ModelAndView getSaleCompanyContractDetailView(
			CompanyContractDTOEx customerList,
			List<CompanyContractDTOEx> contractTypeList
			);
	
	public ModelAndView getSaleCompanyCreateContractView(
			List<CompanyDTOEx> saleCompanyList,
			List<String> deviceList,
			List<CompanyContractDTOEx> saleTypeList);

}
