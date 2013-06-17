package com.bigstarglobal.cms.dto;

import java.sql.Date;



public class ProductDTO extends CommonDTO{
	
	private int product_id;
	private int member_id;
	private int group_id;
	
	private String product_sale_type;
	private String product_device_type;
	private String product_price;
	private String product_price_type;
	private String product_source_type;
	private String product_etc;
	private Date product_cdate;
	
	private int customer_id;
	private String customer_name;
	private String name;
	
	private String product_json;
	public String getProduct_json() {
		return product_json;
	}
	public void setProduct_json(String product_json) {
		this.product_json = product_json;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public String getProduct_sale_type() {
		return product_sale_type;
	}
	public void setProduct_sale_type(String product_sale_type) {
		this.product_sale_type = product_sale_type;
	}
	public String getProduct_device_type() {
		return product_device_type;
	}
	public void setProduct_device_type(String product_device_type) {
		this.product_device_type = product_device_type;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	public String getProduct_price_type() {
		return product_price_type;
	}
	public void setProduct_price_type(String product_price_type) {
		this.product_price_type = product_price_type;
	}
	public String getProduct_source_type() {
		return product_source_type;
	}
	public void setProduct_source_type(String product_source_type) {
		this.product_source_type = product_source_type;
	}
	public String getProduct_etc() {
		return product_etc;
	}
	public void setProduct_etc(String product_etc) {
		this.product_etc = product_etc;
	}
	public Date getProduct_cdate() {
		return product_cdate;
	}
	public void setProduct_cdate(Date product_cdate) {
		this.product_cdate = product_cdate;
	}
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	@Override
	public String toString() {
		return "Product [product_id=" + product_id + ", member_id=" + member_id
				+ ", group_id=" + group_id + ", product_sale_type="
				+ product_sale_type + ", product_device_type="
				+ product_device_type + ", product_price=" + product_price
				+ ", product_price_type=" + product_price_type
				+ ", product_source_type=" + product_source_type
				+ ", product_etc=" + product_etc + ", product_cdate="
				+ product_cdate + ", customer_id=" + customer_id
				+ ", customer_name=" + customer_name + ", name=" + name
				+ ", product_json=" + product_json + "]";
	}
	
	
	

}
