package com.bsg.pcms.provision.cp;

import java.util.List;

import com.bsg.pcms.dto.CompanyDTO;

public class CpDTOEx extends CompanyDTO{
	
	private List<String> pdNameList;
	
	private String pd_name;

	public List<String> getPdNameList() {
		return pdNameList;
	}

	public void setPdNameList(List<String> pdNameList) {
		this.pdNameList = pdNameList;
	}

	public String getPd_name() {
		return pd_name;
	}

	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}

	@Override
	public String toString() {
		return "\nCpDTOEx [pdNameList=" + pdNameList + ", pd_name=" + pd_name + "]\n";
	}
	
}
