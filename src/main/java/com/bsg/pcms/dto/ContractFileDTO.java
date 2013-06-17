package com.bsg.pcms.dto;

public class ContractFileDTO extends ContractDTO{

	private int contract_file_seq; //FK
	private int contract_mgmtno;
	private String file_name;
	private String file_size;
	private String file;
	private String file_path;
	
	public int getContract_file_seq() {
		return contract_file_seq;
	}
	public void setContract_file_seq(int contract_file_seq) {
		this.contract_file_seq = contract_file_seq;
	}
	public int getContract_mgmtno() {
		return contract_mgmtno;
	}
	public void setContract_mgmtno(int contract_mgmtno) {
		this.contract_mgmtno = contract_mgmtno;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_size() {
		return file_size;
	}
	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	
	@Override
	public String toString() {
		return "\nContractFileDTO [contract_file_seq=" + contract_file_seq + ", contract_mgmtno=" + contract_mgmtno + ", file_name=" + file_name + ", file_size=" + file_size + ", file=" + file + ", file_path=" + file_path + "]\n";
	}
	
}
