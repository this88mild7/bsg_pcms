package com.bsg.pcms.dto;



public class SeriesDTO extends ContentDTO{

	private int series_mgmtno; 		//시리즈 관리번호
	private String series_name;		//시리즈 이름
	
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
	
	@Override
	public String toString() {
		return "SeriesDTO [series_mgmtno=" + series_mgmtno + ", series_name="
				+ series_name + "]";
	}
	
	
}
