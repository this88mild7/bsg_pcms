package com.bigstarglobal.cms.dto;

public class ContractContentsGroupDTO extends ContractDTO {

	private int group_seq;
	private String contents_cd;
	private int cate_id;
	private int series_mgmtno;
	
	public int getCate_id() {
		return cate_id;
	}
	public void setCate_id(int cate_id) {
		this.cate_id = cate_id;
	}
	public int getSeries_mgmtno() {
		return series_mgmtno;
	}
	public void setSeries_mgmtno(int series_mgmtno) {
		this.series_mgmtno = series_mgmtno;
	}
	public int getGroup_seq() {
		return group_seq;
	}
	public void setGroup_seq(int group_seq) {
		this.group_seq = group_seq;
	}
	public String getContents_cd() {
		return contents_cd;
	}
	public void setContents_cd(String contents_cd) {
		this.contents_cd = contents_cd;
	}
	
	@Override
	public String toString() {
		return "\nContractContentsGroup [group_seq=" + group_seq + ", contents_cd=" + contents_cd + ", cate_id=" + cate_id + ", series_mgmtno=" + series_mgmtno + "]\n";
	}
	
}
