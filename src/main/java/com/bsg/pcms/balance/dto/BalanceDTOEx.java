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

	
	
}
