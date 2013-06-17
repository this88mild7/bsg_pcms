package com.bsg.pcms.dto;

import java.sql.Date;

/**
 * @author jschoi
 *
 */
public class ContractDTO extends CommonDTO {

	private int contract_mgmtno;
	private int user_mgmtseq;
	private int company_mgmtno;
	private int sale_price;
	private int sale_profit_rate;
	private String sale_profit_type;
	private String sale_type;
	private String sale_type_detail;
	
	private String license_cd;
	private String license_cd_detail;
	private String license_country;
	private String license_country_detail;
	private String type;
	private String expi_yn;
	private String contract_type;
	private String contract_type_detail;
	private String etc;
	private String balance_type;
	private String balance_type_detail;
	private String del_yn;
	private String deposit_bank;
	private String account_no;
	private String account_holder;
	private Date str_date; // 계약일
	private Date end_date; // 계약종료일
	public int getContract_mgmtno() {
		return contract_mgmtno;
	}
	public void setContract_mgmtno(int contract_mgmtno) {
		this.contract_mgmtno = contract_mgmtno;
	}
	public int getUser_mgmtseq() {
		return user_mgmtseq;
	}
	public void setUser_mgmtseq(int user_mgmtseq) {
		this.user_mgmtseq = user_mgmtseq;
	}
	public int getCompany_mgmtno() {
		return company_mgmtno;
	}
	public void setCompany_mgmtno(int company_mgmtno) {
		this.company_mgmtno = company_mgmtno;
	}
	public int getSale_price() {
		return sale_price;
	}
	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}
	public int getSale_profit_rate() {
		return sale_profit_rate;
	}
	public void setSale_profit_rate(int sale_profit_rate) {
		this.sale_profit_rate = sale_profit_rate;
	}
	public String getSale_profit_type() {
		return sale_profit_type;
	}
	public void setSale_profit_type(String sale_profit_type) {
		this.sale_profit_type = sale_profit_type;
	}
	public String getSale_type() {
		return sale_type;
	}
	public void setSale_type(String sale_type) {
		this.sale_type = sale_type;
	}
	public String getSale_type_detail() {
		return sale_type_detail;
	}
	public void setSale_type_detail(String sale_type_detail) {
		this.sale_type_detail = sale_type_detail;
	}
	public String getLicense_cd() {
		return license_cd;
	}
	public void setLicense_cd(String license_cd) {
		this.license_cd = license_cd;
	}
	public String getLicense_cd_detail() {
		return license_cd_detail;
	}
	public void setLicense_cd_detail(String license_cd_detail) {
		this.license_cd_detail = license_cd_detail;
	}
	public String getLicense_country() {
		return license_country;
	}
	public void setLicense_country(String license_country) {
		this.license_country = license_country;
	}
	public String getLicense_country_detail() {
		return license_country_detail;
	}
	public void setLicense_country_detail(String license_country_detail) {
		this.license_country_detail = license_country_detail;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getExpi_yn() {
		return expi_yn;
	}
	public void setExpi_yn(String expi_yn) {
		this.expi_yn = expi_yn;
	}
	public String getContract_type() {
		return contract_type;
	}
	public void setContract_type(String contract_type) {
		this.contract_type = contract_type;
	}
	public String getContract_type_detail() {
		return contract_type_detail;
	}
	public void setContract_type_detail(String contract_type_detail) {
		this.contract_type_detail = contract_type_detail;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getBalance_type() {
		return balance_type;
	}
	public void setBalance_type(String balance_type) {
		this.balance_type = balance_type;
	}
	public String getBalance_type_detail() {
		return balance_type_detail;
	}
	public void setBalance_type_detail(String balance_type_detail) {
		this.balance_type_detail = balance_type_detail;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
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
	public Date getStr_date() {
		return str_date;
	}
	public void setStr_date(Date str_date) {
		this.str_date = str_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	@Override
	public String toString() {
		return "nContractDTO [contract_mgmtno=" + contract_mgmtno + ", user_mgmtseq=" + user_mgmtseq + ", company_mgmtno=" + company_mgmtno + ", sale_price=" + sale_price + ", sale_profit_rate=" + sale_profit_rate + ", sale_profit_type=" + sale_profit_type + ", sale_type=" + sale_type + ", sale_type_detail=" + sale_type_detail + ", license_cd=" + license_cd + ", license_cd_detail="
				+ license_cd_detail + ", license_country=" + license_country + ", license_country_detail=" + license_country_detail + ", type=" + type + ", expi_yn=" + expi_yn + ", contract_type=" + contract_type + ", contract_type_detail=" + contract_type_detail + ", etc=" + etc + ", balance_type=" + balance_type + ", balance_type_detail=" + balance_type_detail + ", del_yn=" + del_yn
				+ ", deposit_bank=" + deposit_bank + ", account_no=" + account_no + ", account_holder=" + account_holder + ", str_date=" + str_date + ", end_date=" + end_date + "]n";
	}
	
	

}
