package com.bigstarglobal.cms.dto;



public class ContentDTO extends CompanyDTO{
	
	// CONTENTS TABLE COLUMN
	private int company_mgmtno;
	private int cate_id;
	private int series_mgmtno;
	private int age;
	private int sale_price;
	private String contents_cd;
	private String contents_type;
	private String name;
	
	public String getContents_type() {
		return contents_type;
	}
	public void setContents_type(String contents_type) {
		this.contents_type = contents_type;
	}
	public int getCompany_mgmtno() {
		return company_mgmtno;
	}
	public void setCompany_mgmtno(int company_mgmtno) {
		this.company_mgmtno = company_mgmtno;
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
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getSale_price() {
		return sale_price;
	}
	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}
	public String getContents_cd() {
		return contents_cd;
	}
	public void setContents_cd(String contents_cd) {
		this.contents_cd = contents_cd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "\nContentDTO [company_mgmtno=" + company_mgmtno + ", cate_id=" + cate_id + ", series_mgmtno=" + series_mgmtno + ", age=" + age + ", sale_price=" + sale_price + ", contents_cd=" + contents_cd + ", contents_type=" + contents_type + ", name=" + name + "]\n";
	}
}
