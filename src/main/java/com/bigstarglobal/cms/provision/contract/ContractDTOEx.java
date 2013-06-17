package com.bigstarglobal.cms.provision.contract;

import com.bigstarglobal.cms.dto.ContractDTO;

public class ContractDTOEx extends ContractDTO{
	
	private String cate_name;
	private String series_name;
	private String company_name;
	
	private int cate_id;
	private int series_mgmtno;
	private int series_cnt;

	// 'Y' or 'N'
	private String isPicturebook;
	private String isEbook;
	private String is2d;
	private String is3d;
	private String isGame;
	private String balance_detail;
	
	public int getSeries_cnt() {
		return series_cnt;
	}
	public void setSeries_cnt(int series_cnt) {
		this.series_cnt = series_cnt;
	}
	public int getCate_id() {
		return cate_id;
	}
	public void setCate_id(int cate_id) {
		this.cate_id = cate_id;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public int getSeries_mgmtno() {
		return series_mgmtno;
	}
	public void setSeries_mgmtno(int series_mgmtno) {
		this.series_mgmtno = series_mgmtno;
	}
	public String getIsPicturebook() {
		return isPicturebook;
	}
	public void setIsPicturebook(String isPicturebook) {
		this.isPicturebook = isPicturebook;
	}
	public String getIsEbook() {
		return isEbook;
	}
	public void setIsEbook(String isEbook) {
		this.isEbook = isEbook;
	}
	public String getIs2d() {
		return is2d;
	}
	public void setIs2d(String is2d) {
		this.is2d = is2d;
	}
	public String getBalance_detail() {
		return balance_detail;
	}
	public void setBalance_detail(String balance_detail) {
		this.balance_detail = balance_detail;
	}
	public String getIs3d() {
		return is3d;
	}
	public void setIs3d(String is3d) {
		this.is3d = is3d;
	}
	public String getIsGame() {
		return isGame;
	}
	public void setIsGame(String isGame) {
		this.isGame = isGame;
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
		return "\nContractDTOEx [cate_name=" + cate_name + ", series_name=" + series_name + ", company_name=" + company_name + ", cate_id=" + cate_id + ", series_mgmtno=" + series_mgmtno + ", series_cnt=" + series_cnt + ", isPicturebook=" + isPicturebook + ", isEbook=" + isEbook + ", is2d=" + is2d + ", is3d=" + is3d + ", isGame=" + isGame + ", balance_detail=" + balance_detail + "]\n";
	}
	
	
}
