package com.bsg.pcms.provision.content;

import com.bsg.pcms.dto.ContentDTO;

public class ContentDTOEx extends ContentDTO{
	
	private String cate_name;
	private String series_name;
	private String company_name;
	private String currency;
	private String file_path;
	
	private String contents_type_name;
	
	
	
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public String getSeries_name() {
		return series_name;
	}
	public void setSeries_name(String series_name) {
		this.series_name = series_name;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	
	@Override
	public String toString() {
		return "\nContentDTOEx [cate_name=" + cate_name + ", series_name=" + series_name + ", company_name=" + company_name + ", currency=" + currency + ", file_path=" + file_path + "]\n";
	}
	public String getContents_type_name() {
		return contents_type_name;
	}
	public void setContents_type_name(String contents_type_name) {
		this.contents_type_name = contents_type_name;
	}

	
}
