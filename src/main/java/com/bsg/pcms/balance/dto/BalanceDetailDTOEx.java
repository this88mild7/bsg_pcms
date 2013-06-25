package com.bsg.pcms.balance.dto;

public class BalanceDetailDTOEx extends BalanceDTOEx{
	
	private String contents_cd;
	
	private int sale_count;

	public String getContents_cd() {
		return contents_cd;
	}

	public void setContents_cd(String contents_cd) {
		this.contents_cd = contents_cd;
	}

	public int getSale_count() {
		return sale_count;
	}

	public void setSale_count(int sale_count) {
		this.sale_count = sale_count;
	}

	@Override
	public String toString() {
		return "BalanceDetailDTOEx [contents_cd=" + contents_cd
				+ ", sale_count=" + sale_count + "]";
	}
	
}
