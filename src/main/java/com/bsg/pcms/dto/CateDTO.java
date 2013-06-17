package com.bsg.pcms.dto;



public class CateDTO extends ContentDTO{

	private int cate_id;
	private int parent_id;
	private String cate_name;
	
	public int getCate_id() {
		return cate_id;
	}
	public void setCate_id(int cate_id) {
		this.cate_id = cate_id;
	}
	public int getParent_id() {
		return parent_id;
	}
	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	
	@Override
	public String toString() {
		return String.format("CateDTO [cate_id=%s, parent_id=%s, cate_name=%s, toString()=%s]", cate_id, parent_id, cate_name, super.toString());
	}
	
}
