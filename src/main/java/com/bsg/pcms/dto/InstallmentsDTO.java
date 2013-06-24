package com.bsg.pcms.dto;

public class InstallmentsDTO extends CommonDTO{
	
	private int contract_mgmtno;
	
	private int installments_seq;
	
	private String installments_price;
	
	private String installments_detail;
	
	private String installments_dt;

	public int getContract_mgmtno() {
		return contract_mgmtno;
	}

	public void setContract_mgmtno(int contract_mgmtno) {
		this.contract_mgmtno = contract_mgmtno;
	}

	public int getInstallments_seq() {
		return installments_seq;
	}

	public void setInstallments_seq(int installments_seq) {
		this.installments_seq = installments_seq;
	}


	public String getInstallments_detail() {
		return installments_detail;
	}

	public void setInstallments_detail(String installments_detail) {
		this.installments_detail = installments_detail;
	}

	public String getInstallments_dt() {
		return installments_dt;
	}

	public void setInstallments_dt(String installments_dt) {
		this.installments_dt = installments_dt;
	}

	@Override
	public String toString() {
		return "InstallmentsDTO [contract_mgmtno=" + contract_mgmtno
				+ ", installments_seq=" + installments_seq
				+ ", installments_price=" + installments_price
				+ ", installments_detail=" + installments_detail
				+ ", installments_dt=" + installments_dt + "]";
	}

	public String getInstallments_price() {
		return installments_price;
	}

	public void setInstallments_price(String installments_price) {
		this.installments_price = installments_price;
	}

	

}
