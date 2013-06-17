package com.bigstarglobal.cms.provision.content;

import com.bigstarglobal.cms.dto.ContentDTO;

public class ContentDTOEx extends ContentDTO{
	
	private String cate_name;
	private String series_name;
	private String company_name;
	
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
		return String.format("\n\nContentDTOEx [cate_name=%s, series_name=%s, company_name=%s, toString()=%s]\n\n", cate_name, series_name, company_name, super.toString());
	}

	
}
