package com.bsg.pcms.dto;


public class BankDTO {
	
	private String bank_name;

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

	@Override
	public String toString() {
		return "Bank [bank_name=" + bank_name + "]";
	}
	
}
