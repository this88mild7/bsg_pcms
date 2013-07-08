package com.bsg.pcms.balance.dto;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.bsg.pcms.dto.BalanceDTO;

public class BalanceDTOEx extends BalanceDTO{
	
	private List<String> contentList;
	
	private List<Integer> salePrice;
	
	private List<Integer> saleCount;
	
	private String contract_type;
	
	private String sale_type;
	
	// 정렬 타입 변수들
	private String sortingType;
	
	private String searchQuery;
	
	private String searchStrDate;
	
	private String searchEndDate;
	
	private String contentsCount = "6";
	
	private String sale_company_rate;
	
	private String cp_rate;
	
	private String total_cp_commission;
	
	private String total_sale_company_commission;
	
	private String total_profit;
	
	private String cpMoney; //cp_commission을 String타입으로 변환한 값
	
	private String totalMoney; //total_sale_price을 String타입으로 변환한 값
	
	
	private List<String> contentCpProfit;
	
	private List<String> contentSaleProfit;
	
	private List<String> contentSalePrice;
	
	
	public List<String> getContentSalePrice() {
		return contentSalePrice;
	}

	public void setContentSalePrice(List<String> contentSalePrice) {
		this.contentSalePrice = contentSalePrice;
	}

	public List<String> getContentCpProfit() {
		return contentCpProfit;
	}

	public void setContentCpProfit(List<String> contentCpProfit) {
		this.contentCpProfit = contentCpProfit;
	}



	public List<String> getContentSaleProfit() {
		return contentSaleProfit;
	}



	public void setContentSaleProfit(List<String> contentSaleProfit) {
		this.contentSaleProfit = contentSaleProfit;
	}



	public String getTotal_profit() {
		return total_profit;
	}



	public void setTotal_profit(String total_profit) {
		this.total_profit = total_profit;
	}



	public String getTotal_cp_commission() {
		return total_cp_commission;
	}



	public void setTotal_cp_commission(String total_cp_commission) {
		this.total_cp_commission = total_cp_commission;
	}



	public String getTotal_sale_company_commission() {
		return total_sale_company_commission;
	}



	public void setTotal_sale_company_commission(
			String total_sale_company_commission) {
		this.total_sale_company_commission = total_sale_company_commission;
	}



	public void checkBlankSearchParam() {
		if(StringUtils.isBlank(this.searchQuery)){
			this.searchQuery = null;
		}
		if(StringUtils.isBlank(this.searchStrDate)){
			this.searchStrDate = null;
		}
		if(StringUtils.isBlank(this.searchEndDate)){
			this.searchEndDate = null;
		}
	}
	
	
	
	public String getSearchQuery() {
		return searchQuery;
	}

	public void setSearchQuery(String searchQuery) {
		this.searchQuery = searchQuery;
	}

	public String getSortingType() {
		return sortingType;
	}

	public void setSortingType(String sortingType) {
		this.sortingType = sortingType;
	}

	public String getCpMoney() {
		return cpMoney;
	}

	public void setCpMoney(String cpMoney) {
		this.cpMoney = cpMoney;
	}

	public String getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(String totalMoney) {
		this.totalMoney = totalMoney;
	}

	public List<String> getContentList() {
		return contentList;
	}

	public void setContentList(List<String> contentList) {
		this.contentList = contentList;
	}

	public List<Integer> getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(List<Integer> salePrice) {
		this.salePrice = salePrice;
	}

	public List<Integer> getSaleCount() {
		return saleCount;
	}

	public void setSaleCount(List<Integer> saleCount) {
		this.saleCount = saleCount;
	}


	public String getSearchStrDate() {
		return searchStrDate;
	}

	public void setSearchStrDate(String searchStrDate) {
		this.searchStrDate = searchStrDate;
	}

	public String getSearchEndDate() {
		return searchEndDate;
	}

	public void setSearchEndDate(String searchEndDate) {
		this.searchEndDate = searchEndDate;
	}


	public String getContract_type() {
		return contract_type;
	}

	public void setContract_type(String contract_type) {
		this.contract_type = contract_type;
	}

	public String getContentsCount() {
		return contentsCount;
	}

	public void setContentsCount(String contentsCount) {
		this.contentsCount = contentsCount;
	}

	public String getSale_type() {
		return sale_type;
	}

	public void setSale_type(String sale_type) {
		this.sale_type = sale_type;
	}



	public String getSale_company_rate() {
		return sale_company_rate;
	}



	public void setSale_company_rate(String sale_company_rate) {
		this.sale_company_rate = sale_company_rate;
	}



	public String getCp_rate() {
		return cp_rate;
	}



	public void setCp_rate(String cp_rate) {
		this.cp_rate = cp_rate;
	}

	
	
}
