package com.bsg.pcms.sale.company.dto;

import java.util.List;

import com.bsg.pcms.dto.CompanyDTO;

public class CompanyDTOEx extends CompanyDTO {
	
	
    private String deposit_bank;
    private String account_no;
    private String account_holder;
    
    private List<String> deleteCompany;
	
    
	private String searchType;
	private String searchQuery;
	
	private String pd_name;
	
	
	public String getPd_name() {
		return pd_name;
	}

	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}

	public String getSearchQuery() {
		return searchQuery;
	}

	public void setSearchQuery(String searchQuery) {
		this.searchQuery = searchQuery;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getDeposit_bank() {
		return deposit_bank;
	}

	public void setDeposit_bank(String deposit_bank) {
		this.deposit_bank = deposit_bank;
	}

	public String getAccount_no() {
		return account_no;
	}

	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}

	public String getAccount_holder() {
		return account_holder;
	}

	public void setAccount_holder(String account_holder) {
		this.account_holder = account_holder;
	}

	public List<String> getDeleteCompany() {
		return deleteCompany;
	}

	public void setDeleteCompany(List<String> deleteCompany) {
		this.deleteCompany = deleteCompany;
	}

	@Override
	public String toString() {
		return "CompanyDTOEx [deposit_bank=" + deposit_bank + ", account_no="
				+ account_no + ", account_holder=" + account_holder
				+ ", deleteCompany=" + deleteCompany + ", searchType="
				+ searchType + ", toString()=" + super.toString() + "]";
	}

	
	

}
