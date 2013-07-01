package com.bsg.pcms.code.dto;

public class CodeDTO {
	
	private String cd;
	
	private String cd_detail;

	public String getCd() {
		return cd;
	}

	public void setCd(String cd) {
		this.cd = cd;
	}

	public String getCd_detail() {
		return cd_detail;
	}

	public void setCd_detail(String cd_detail) {
		this.cd_detail = cd_detail;
	}

	@Override
	public String toString() {
		return "CodeDTO [cd=" + cd + ", cd_detail=" + cd_detail + "]";
	}
	
}
