package com.bsg.pcms.sale.company.dto;

import java.util.List;

import com.bsg.pcms.dto.ContractDTO;
import com.bsg.pcms.dto.InstallmentsDTO;


public class CompanyContractDTOEx extends ContractDTO{
	
	private int contents_count;
	private String company_name;
	private String contents_cd;
	private String device_cd;
	private String device_detail;
	private String sale_price_type;
	private String sale_profit_type_detail;
	
	private String series_mgmtno;
	
	private String cate_id;
	
	private List<CompanyContentsDTOEx> contentsList;
	
	private List<String> saleTypeList;
	
	private List<String> seriesList;
	
	private List<String> device_cd_list;
	
	private List<String> contractedDeviceList;
	
	private String searchType;
	
	private String searchQuery;
	
	private double payments;
	
	private String currency;
	
	private String payments_type;
	
	private List<String> installments_dt;
	
	private List<String> installments_price;
	
	private List<InstallmentsDTO> installmentList;
	
	
	public double getPayments() {
		return payments;
	}
	public void setPayments(double payments) {
		this.payments = payments;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
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
	
	@Override
	public String toString() {
		return "CompanyContractDTOEx [contents_count=" + contents_count
				+ ", company_name=" + company_name + ", contents_cd="
				+ contents_cd + ", device_cd=" + device_cd + ", device_detail="
				+ device_detail + ", sale_price_type=" + sale_price_type
				+ ", sale_profit_type_detail=" + sale_profit_type_detail
				+ ", series_mgmtno=" + series_mgmtno + ", cate_id=" + cate_id
				+ ", contentsList=" + contentsList + ", saleTypeList="
				+ saleTypeList + ", seriesList=" + seriesList
				+ ", device_cd_list=" + device_cd_list
				+ ", contractedDeviceList=" + contractedDeviceList
				+ ", searchType=" + searchType + ", searchQuery=" + searchQuery
				+ ", payments=" + payments + ", currency=" + currency
				+ ", payments_type=" + payments_type + "]";
	}
	public List<String> getInstallments_dt() {
		return installments_dt;
	}
	public void setInstallments_dt(List<String> installments_dt) {
		this.installments_dt = installments_dt;
	}
	public List<String> getInstallments_price() {
		return installments_price;
	}
	public void setInstallments_price(List<String> installments_price) {
		this.installments_price = installments_price;
	}
}
