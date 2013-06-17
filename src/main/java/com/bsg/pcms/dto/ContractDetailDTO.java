package com.bsg.pcms.dto;


/**
 * @author jschoi
 *
 */
public class ContractDetailDTO extends ContractDTO {

	private int contract_detail_seq;
	private String sale_type;
	public int getContract_detail_seq() {
		return contract_detail_seq;
	}
	public void setContract_detail_seq(int contract_detail_seq) {
		this.contract_detail_seq = contract_detail_seq;
	}
	public String getSale_type() {
		return sale_type;
	}
	public void setSale_type(String sale_type) {
		this.sale_type = sale_type;
	}
	@Override
	public String toString() {
		return "\nContractDetailDTO [contract_detail_seq=" + contract_detail_seq + ", sale_type=" + sale_type + "]\n";
	}
	
}
