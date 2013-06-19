package com.bsg.pcms.dto;

import java.util.Date;
import java.util.List;

public class BalanceDetailDTO extends CommonDTO{
	
	private int balance_detail_seq;
	
	private int balance_mgmtno;
	
	private String contents_cd;
	
	private int sale_price;
	
	private int sale_count;

	public int getBalance_detail_seq() {
		return balance_detail_seq;
	}

	public void setBalance_detail_seq(int balance_detail_seq) {
		this.balance_detail_seq = balance_detail_seq;
	}

	public int getBalance_mgmtno() {
		return balance_mgmtno;
	}

	public void setBalance_mgmtno(int balance_mgmtno) {
		this.balance_mgmtno = balance_mgmtno;
	}

	public String getContents_cd() {
		return contents_cd;
	}

	public void setContents_cd(String contents_cd) {
		this.contents_cd = contents_cd;
	}

	public int getSale_price() {
		return sale_price;
	}

	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}

	public int getSale_count() {
		return sale_count;
	}

	public void setSale_count(int sale_count) {
		this.sale_count = sale_count;
	}
	
	
}
