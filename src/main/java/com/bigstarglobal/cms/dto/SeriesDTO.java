package com.bigstarglobal.cms.dto;



public class SeriesDTO extends ContentDTO{

	private int series_mgmtno; 		//시리즈 관리번호
	private String series_name;		//시리즈 이름
	private int cate_id; 			//카테고리 아이디
	
	@Override
	public String toString() {
		return String.format("SeriesDTO [series_mgmtno=%s, series_name=%s, cate_id=%s, toString()=%s]", series_mgmtno, series_name, cate_id, super.toString());
	}
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
	public String getSeries_name() {
		return series_name;
	}
	public void setSeries_name(String series_name) {
		
		this.series_name = series_name;
	}
}
