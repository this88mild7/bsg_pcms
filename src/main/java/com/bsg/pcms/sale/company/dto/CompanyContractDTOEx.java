package com.bsg.pcms.sale.company.dto;

import java.sql.Date;
import java.util.List;

import com.bsg.pcms.dto.ContractDTO;
import com.bsg.pcms.dto.InstallmentsDTO;


public class CompanyContractDTOEx extends ContractDTO{
	
	private int contents_count;
	private String company_name;
	private String contents_cd;
	private String contents_name;
	private String device_cd;
	private String device_name;
	private String device_detail;
	private String sale_price_type;
	private String sale_profit_type_detail;
	private String contract_type_cd;
	private String contract_type_cd_name;
	
	private String series_mgmtno;
	
	private String cate_id;
	
	private List<CompanyContentsDTOEx> contentsList;
	
	private List<String> saleTypeList;
	
	private List<String> seriesList;
	
	private List<String> device_cd_list;
	
	private List<String> contractedDeviceList;
	
	private String searchType;
	
	private String searchQuery;
	
	private double payments =0;
	
	private String payments_currency;
	
	private String sale_price_currency;
	
	private String payments_type;
	
	private List<InstallmentsDTO> installmentList;
	
	
	// JSP List 파라미터
	private List<String> installments_dt;
	private List<String> installments_price;
	private List<String> selectedContentsCd;
	private List<String> selectedContentsPrice;
	private List<String> selectedContentsCurrency;
	
	
	
	public List<String> getSelectedContentsCurrency() {
		return selectedContentsCurrency;
	}
	public void setSelectedContentsCurrency(List<String> selectedContentsCurrency) {
		this.selectedContentsCurrency = selectedContentsCurrency;
	}
	public String getContract_type_cd() {
		return contract_type_cd;
	}
	public void setContract_type_cd(String contract_type_cd) {
		this.contract_type_cd = contract_type_cd;
	}
	public String getContract_type_cd_name() {
		return contract_type_cd_name;
	}
	public void setContract_type_cd_name(String contract_type_cd_name) {
		this.contract_type_cd_name = contract_type_cd_name;
	}
	public String getDevice_name() {
		return device_name;
	}
	public void setDevice_name(String device_name) {
		this.device_name = device_name;
	}
	public double getPayments() {
		return payments;
	}
	public void setPayments(double payments) {
		this.payments = payments;
	}
	public String getPayments_type() {
		return payments_type;
	}
	public void setPayments_type(String payments_type) {
		this.payments_type = payments_type;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchQuery() {
		return searchQuery;
	}
	public void setSearchQuery(String searchQuery) {
		this.searchQuery = searchQuery;
	}
	public List<CompanyContentsDTOEx> getContentsList() {
		return contentsList;
	}
	public void setContentsList(List<CompanyContentsDTOEx> contentsList) {
		this.contentsList = contentsList;
	}
	public int getContents_count() {
		return contents_count;
	}
	public void setContents_count(int contents_count) {
		this.contents_count = contents_count;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getContents_cd() {
		return contents_cd;
	}
	public void setContents_cd(String contents_cd) {
		this.contents_cd = contents_cd;
	}
	public List<String> getSaleTypeList() {
		return saleTypeList;
	}
	public void setSaleTypeList(List<String> saleTypeList) {
		this.saleTypeList = saleTypeList;
	}
	public String getDevice_cd() {
		return device_cd;
	}
	public void setDevice_cd(String device_cd) {
		this.device_cd = device_cd;
	}
	public String getDevice_detail() {
		return device_detail;
	}
	public void setDevice_detail(String device_detail) {
		this.device_detail = device_detail;
	}
	public List<String> getDevice_cd_list() {
		return device_cd_list;
	}
	public void setDevice_cd_list(List<String> device_cd_list) {
		this.device_cd_list = device_cd_list;
	}
	public List<String> getSeriesList() {
		return seriesList;
	}
	public void setSeriesList(List<String> seriesList) {
		this.seriesList = seriesList;
	}
	public String getSeries_mgmtno() {
		return series_mgmtno;
	}
	public void setSeries_mgmtno(String series_mgmtno) {
		this.series_mgmtno = series_mgmtno;
	}
	public String getCate_id() {
		return cate_id;
	}
	public void setCate_id(String cate_id) {
		this.cate_id = cate_id;
	}
	public String getSale_price_type() {
		return sale_price_type;
	}
	public void setSale_price_type(String sale_price_type) {
		this.sale_price_type = sale_price_type;
	}
	public List<String> getContractedDeviceList() {
		return contractedDeviceList;
	}
	public void setContractedDeviceList(List<String> contractedDeviceList) {
		this.contractedDeviceList = contractedDeviceList;
	}
	public String getSale_profit_type_detail() {
		return sale_profit_type_detail;
	}
	public void setSale_profit_type_detail(String sale_profit_type_detail) {
		this.sale_profit_type_detail = sale_profit_type_detail;
	}
	public List<InstallmentsDTO> getInstallmentList() {
		return installmentList;
	}
	public void setInstallmentList(List<InstallmentsDTO> installmentList) {
		this.installmentList = installmentList;
	}
	
	public List<String> getInstallments_price() {
		return installments_price;
	}
	public void setInstallments_price(List<String> installments_price) {
		this.installments_price = installments_price;
	}
	public List<String> getSelectedContentsCd() {
		return selectedContentsCd;
	}
	public void setSelectedContentsCd(List<String> selectedContentsCd) {
		this.selectedContentsCd = selectedContentsCd;
	}
	public List<String> getSelectedContentsPrice() {
		return selectedContentsPrice;
	}
	public void setSelectedContentsPrice(List<String> selectedContentsPrice) {
		this.selectedContentsPrice = selectedContentsPrice;
	}
	public List<String> getInstallments_dt() {
		return installments_dt;
	}
	public void setInstallments_dt(List<String> installments_dt) {
		this.installments_dt = installments_dt;
		
	}
	public String getPayments_currency() {
		return payments_currency;
	}
	public void setPayments_currency(String payments_currency) {
		this.payments_currency = payments_currency;
	}
	public String getSale_price_currency() {
		return sale_price_currency;
	}
	public void setSale_price_currency(String sale_price_currency) {
		this.sale_price_currency = sale_price_currency;
	}
	@Override
	public String toString() {
		return "CompanyContractDTOEx [contents_count=" + contents_count
				+ ", company_name=" + company_name + ", contents_cd="
				+ contents_cd + ", device_cd=" + device_cd + ", device_name="
				+ device_name + ", device_detail=" + device_detail
				+ ", sale_price_type=" + sale_price_type
				+ ", sale_profit_type_detail=" + sale_profit_type_detail
				+ ", contract_type_cd=" + contract_type_cd
				+ ", contract_type_cd_name=" + contract_type_cd_name
				+ ", series_mgmtno=" + series_mgmtno + ", cate_id=" + cate_id
				+ ", contentsList=" + contentsList + ", saleTypeList="
				+ saleTypeList + ", seriesList=" + seriesList
				+ ", device_cd_list=" + device_cd_list
				+ ", contractedDeviceList=" + contractedDeviceList
				+ ", searchType=" + searchType + ", searchQuery=" + searchQuery
				+ ", payments=" + payments + ", payments_currency="
				+ payments_currency + ", sale_price_currency="
				+ sale_price_currency + ", payments_type=" + payments_type
				+ ", installments_dt=" + installments_dt
				+ ", installments_price=" + installments_price
				+ ", installmentList=" + installmentList
				+ ", selectedContentsCd=" + selectedContentsCd
				+ ", selectedContentsPrice=" + selectedContentsPrice
				+ ", selectedContentsCurrency=" + selectedContentsCurrency
				+ "]";
	}
	public String getContents_name() {
		return contents_name;
	}
	public void setContents_name(String contents_name) {
		this.contents_name = contents_name;
	}
}
