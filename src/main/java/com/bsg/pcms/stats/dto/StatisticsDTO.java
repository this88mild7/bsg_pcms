package com.bsg.pcms.stats.dto;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.bsg.pcms.dto.CompanyDTO;

public class StatisticsDTO extends CompanyDTO{
	
	private int total_sale_count;
	
	private int total_sale_price;
	
	private String sale_device;
	
	private String sale_content_name;
	
	private String searchStrDate;
	
	private String searchEndDate;
	
	private String sale_str_date;
	
	private String sale_end_date;
	
	private Map monthSaleCount;
	
	private String sortingType;
	
	private String searchQuery;
	
	private String contents_name;
	
	private String contents_cd;
	
	private String searchDate;
	
	private int contentViewCount = 4;
	
	

	public int getTotal_sale_count() {
		return total_sale_count;
	}

	public void setTotal_sale_count(int total_sale_count) {
		this.total_sale_count = total_sale_count;
	}

	public int getTotal_sale_price() {
		return total_sale_price;
	}

	public void setTotal_sale_price(int total_sale_price) {
		this.total_sale_price = total_sale_price;
	}

	public String getSale_device() {
		return sale_device;
	}

	public void setSale_device(String sale_device) {
		this.sale_device = sale_device;
	}

	public String getSale_content_name() {
		return sale_content_name;
	}

	public void setSale_content_name(String sale_content_name) {
		this.sale_content_name = sale_content_name;
	}

	public String getSale_str_date() {
		return sale_str_date;
	}

	public void setSale_str_date(String sale_str_date) {
		this.sale_str_date = sale_str_date;
	}

	public String getSale_end_date() {
		return sale_end_date;
	}

	public void setSale_end_date(String sale_end_date) {
		this.sale_end_date = sale_end_date;
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

	public Map getMonthSaleCount() {
		return monthSaleCount;
	}

	public void setMonthSaleCount(Map monthSaleCount) {
		this.monthSaleCount = monthSaleCount;
	}

	public String getSortingType() {
		return sortingType;
	}

	public void setSortingType(String sortingType) {
		this.sortingType = sortingType;
	}

	public String getSearchQuery() {
		return searchQuery;
	}

	public void setSearchQuery(String searchQuery) {
		this.searchQuery = searchQuery;
	}

	public String getContents_name() {
		return contents_name;
	}

	public void setContents_name(String contents_name) {
		this.contents_name = contents_name;
	}

	public String getContents_cd() {
		return contents_cd;
	}

	public void setContents_cd(String contents_cd) {
		this.contents_cd = contents_cd;
	}

	@Override
	public String toString() {
		return "StatisticsDTO [total_sale_count=" + total_sale_count
				+ ", total_sale_price=" + total_sale_price + ", sale_device="
				+ sale_device + ", sale_content_name=" + sale_content_name
				+ ", searchStrDate=" + searchStrDate + ", searchEndDate="
				+ searchEndDate + ", sale_str_date=" + sale_str_date
				+ ", sale_end_date=" + sale_end_date + ", monthSaleCount="
				+ monthSaleCount + ", sortingType=" + sortingType
				+ ", searchQuery=" + searchQuery + ", contents_name="
				+ contents_name + ", contents_cd=" + contents_cd + "]";
	}

	public String getSearchDate() {
		return searchDate;
	}

	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}

	public int getContentViewCount() {
		return contentViewCount;
	}

	public void setContentViewCount(int contentViewCount) {
		this.contentViewCount = contentViewCount;
	}

}
