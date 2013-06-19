package com.bsg.pcms.dto;

import java.util.Date;
import java.util.List;

public class BalanceDTO extends CommonDTO{
	
	private int balance_mgmtno;
	
	private int company_mgmtno;
	
	private String company_name;
	
	private String user_mgmtseq;
	
	private String sorting_type;
	
	private String sale_str_date;
	
	private String sale_end_date;
	
	private int total_sale_count;
	
	private double total_sale_price;
	
	private double sale_commission;
	
	private double cp_commission;
	
	private double owner_profit;

	public int getBalance_mgmtno() {
		return balance_mgmtno;
	}

	public void setBalance_mgmtno(int balance_mgmtno) {
		this.balance_mgmtno = balance_mgmtno;
	}

	public String getUser_mgmtseq() {
		return user_mgmtseq;
	}

	public void setUser_mgmtseq(String user_mgmtseq) {
		this.user_mgmtseq = user_mgmtseq;
	}

	public String getSorting_type() {
		return sorting_type;
	}

	public void setSorting_type(String sorting_type) {
		this.sorting_type = sorting_type;
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

	public int getTotal_sale_count() {
		return total_sale_count;
	}

	public void setTotal_sale_count(int total_sale_count) {
		this.total_sale_count = total_sale_count;
	}

	public double getTotal_sale_price() {
		return total_sale_price;
	}

	public void setTotal_sale_price(double total_sale_price) {
		this.total_sale_price = total_sale_price;
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
	


	public int getCompany_mgmtno() {
		return company_mgmtno;
	}

	public void setCompany_mgmtno(int company_mgmtno) {
		this.company_mgmtno = company_mgmtno;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	@Override
	public String toString() {
		return "BalanceDTO [balance_mgmtno=" + balance_mgmtno
				+ ", company_mgmtno=" + company_mgmtno + ", company_name="
				+ company_name + ", user_mgmtseq=" + user_mgmtseq
				+ ", sorting_type=" + sorting_type + ", sale_str_date="
				+ sale_str_date + ", sale_end_date=" + sale_end_date
				+ ", total_sale_count=" + total_sale_count
				+ ", total_sale_price=" + total_sale_price
				+ ", sale_commission=" + sale_commission + ", cp_commission="
				+ cp_commission + ", owner_profit=" + owner_profit + "]";
	}

}
