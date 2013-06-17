package com.bigstarglobal.cms.sale.company.dto;

import com.bigstarglobal.cms.dto.ContentDTO;

public class CompanyContentsDTOEx extends ContentDTO{
	
	private String sale_type;
	
	private String contract_dev_type;

	/**
	 * @return the sale_type
	 */
	public String getSale_type() {
		return sale_type;
	}

	/**
	 * @param sale_type the sale_type to set
	 */
	public void setSale_type(String sale_type) {
		this.sale_type = sale_type;
	}

	/**
	 * @return the contract_dev_type
	 */
	public String getContract_dev_type() {
		return contract_dev_type;
	}

	/**
	 * @param contract_dev_type the contract_dev_type to set
	 */
	public void setContract_dev_type(String contract_dev_type) {
		this.contract_dev_type = contract_dev_type;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "CompanyContentsDTOEx [sale_type=" + sale_type
				+ ", contract_dev_type=" + contract_dev_type + ", toString()="
				+ super.toString() + "]";
	}
	
}
