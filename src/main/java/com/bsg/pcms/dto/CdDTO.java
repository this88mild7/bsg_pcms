package com.bsg.pcms.dto;

public class CdDTO extends CommonDTO {

	private int cdseq;
	private String cd;
	private String cd_detail;
	public int getCdseq() {
		return cdseq;
	}
	public void setCdseq(int cdseq) {
		this.cdseq = cdseq;
	}
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
		return "\nCdDTO [cdseq=" + cdseq + ", cd=" + cd + ", cd_detail=" + cd_detail + "]\n";
	}
	
}
