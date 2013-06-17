package com.bsg.pcms.dto;

public class CompanyDTO extends CommonDTO {

	private int company_mgmtno;
	private String company_name;
	private String addr;
	private String phoneno;
	private String company_no;
	private String master;
	private String master_email;
	private String master_phoneno;
	private String company_type;

	private String deposit_bank;
	private String account_no;
	private String account_holder;

	public String getCompany_type() {
		return company_type;
	}

	public void setCompany_type(String company_type) {
		this.company_type = company_type;
	}

	private String del_yn;

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public int getCompany_mgmtno() {
		return company_mgmtno;
	}

	public void setCompany_mgmtno(int company_mgmtno) {
		this.company_mgmtno = company_mgmtno;
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

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}

	public String getCompany_no() {
		return company_no;
	}

	public void setCompany_no(String company_no) {
		this.company_no = company_no;
	}

	public String getMaster() {
		return master;
	}

	public void setMaster(String master) {
		this.master = master;
	}

	public String getMaster_email() {
		return master_email;
	}

	public void setMaster_email(String master_email) {
		this.master_email = master_email;
	}

	public String getMaster_phoneno() {
		return master_phoneno;
	}

	public void setMaster_phoneno(String master_phoneno) {
		this.master_phoneno = master_phoneno;
	}

	@Override
	public String toString() {
		return "\nCompanyDTO [company_mgmtno=" + company_mgmtno + ", company_name=" + company_name + ", addr=" + addr + ", phoneno=" + phoneno + ", company_no=" + company_no + ", master=" + master + ", master_email=" + master_email + ", master_phoneno=" + master_phoneno + ", company_type=" + company_type + ", deposit_bank=" + deposit_bank + ", account_no=" + account_no + ", account_holder="
				+ account_holder + ", del_yn=" + del_yn + "]\n";
	}

}
