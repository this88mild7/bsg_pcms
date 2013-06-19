package com.bsg.pcms.view;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.bsg.pcms.dto.BankDTO;
import com.bsg.pcms.dto.CompanyDTO;
import com.bsg.pcms.sale.company.dto.CompanyContractDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyDTOEx;
import com.bsg.pcms.sale.company.dto.DeviceDTOEx;

public interface PmsView {
	
	
	public ModelAndView getSaleCompanyListView(
			List<CompanyDTOEx> customerList);
	
	public ModelAndView getSaleCompanyDetailView(
			CompanyDTOEx companyDTOEx);
	
	public ModelAndView getSaleCompanyCreateView(ArrayList<BankDTO> bankList);
	
	public ModelAndView getSaleCompanyContractListView(
			List<CompanyContractDTOEx> customerContractList);
	
	
	public ModelAndView getSaleCompanyContractDetailView(
			CompanyContractDTOEx customerList,
			List<CompanyContractDTOEx> contractTypeList
			);
	
	public ModelAndView getSaleCompanyCreateContractView(
			List<CompanyDTOEx> saleCompanyList,
			List<String> deviceList,
			List<CompanyContractDTOEx> saleTypeList);

}
