package com.bsg.pcms.balance.dto;

import java.util.List;

import com.bsg.pcms.dto.BalanceDTO;

public class BalanceDTOEx extends BalanceDTO{
	
	private List<String> contentList;
	
	private List<Integer> salePrice;
	
	private List<Integer> saleCount;
	
	// 정렬 타입 변수들
	private String dateSortingType;
	
	private String sortingStrDate;
	
	private String sortingEndDate;
	
	private String printType = "1";
	
	private String searchQuery;
	

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

	public String getDateSortingType() {
		return dateSortingType;
	}

	public void setDateSortingType(String dateSortingType) {
		this.dateSortingType = dateSortingType;
	}

	public String getSortingStrDate() {
		return sortingStrDate;
	}

	public void setSortingStrDate(String sortingStrDate) {
		this.sortingStrDate = sortingStrDate;
	}

	public String getSortingEndDate() {
		return sortingEndDate;
	}

	public void setSortingEndDate(String sortingEndDate) {
		this.sortingEndDate = sortingEndDate;
	}

	public String getPrintType() {
		return printType;
	}

	public void setPrintType(String printType) {
		this.printType = printType;
	}

	public String getSearchQuery() {
		return searchQuery;
	}

	public void setSearchQuery(String searchQuery) {
		this.searchQuery = searchQuery;
	}

	@Override
	public String toString() {
		return "BalanceDTOEx [contentList=" + contentList + ", salePrice="
				+ salePrice + ", saleCount=" + saleCount + ", dateSortingType="
				+ dateSortingType + ", sortingStrDate=" + sortingStrDate
				+ ", sortingEndDate=" + sortingEndDate + ", printType="
				+ printType + ", searchQuery=" + searchQuery + "]";
	}
	
}
