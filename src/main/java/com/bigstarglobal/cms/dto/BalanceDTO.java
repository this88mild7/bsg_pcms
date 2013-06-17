package com.bigstarglobal.cms.dto;

import java.util.Date;
import java.util.List;

public class BalanceDTO extends ContractDTO{
	
	private String sorting_type;
	
	private Date sale_str_date;
	
	private Date sale_end_date;
	
	private List<String> contentList;
	
	private int total_sale_count;
	
	private double total_sale_amount;
	
	private double sale_commission;
	
	private double cp_commission;
	
	private double owner_profit;

	public String getSorting_type() {
		return sorting_type;
	}

	public void setSorting_type(String sorting_type) {
		this.sorting_type = sorting_type;
	}

	public Date getSale_str_date() {
		return sale_str_date;
	}

	public void setSale_str_date(Date sale_str_date) {
		this.sale_str_date = sale_str_date;
	}

	public Date getSale_end_date() {
		return sale_end_date;
	}

	public void setSale_end_date(Date sale_end_date) {
		this.sale_end_date = sale_end_date;
	}

	public int getTotal_sale_count() {
		return total_sale_count;
	}

	public void setTotal_sale_count(int total_sale_count) {
		this.total_sale_count = total_sale_count;
	}

	public double getTotal_sale_amount() {
		return total_sale_amount;
	}

	public void setTotal_sale_amount(double total_sale_amount) {
		this.total_sale_amount = total_sale_amount;
	}

	public double getSale_commission() {
		return sale_commission;
	}

	public void setSale_commission(double sale_commission) {
		this.sale_commission = sale_commission;
	}

	public double getCp_commission() {
		return cp_commission;
	}

	public void setCp_commission(double cp_commission) {
		this.cp_commission = cp_commission;
	}

	public double getOwner_profit() {
		return owner_profit;
	}

	public void setOwner_profit(double owner_profit) {
		this.owner_profit = owner_profit;
	}

	public List<String> getContentList() {
		return contentList;
	}

	public void setContentList(List<String> contentList) {
		this.contentList = contentList;
	}
	
	
	

}
