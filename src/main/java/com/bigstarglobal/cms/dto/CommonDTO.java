//
// * 공통으로 사용되는 데이터 담는 객체
//
// 규칙 1. 테이블 컬럼은 컬럼명과 동일하게
// 규칙 2. 파라미터는 헝가리안 표기법 사용
package com.bigstarglobal.cms.dto;

import java.sql.Date;

public class CommonDTO {

	private Date reg_dt;
	private Date mod_dt;

	private int startRownum = 0;
	private int pageNum = 1; // 현재 페이지
	private int pageSize = 10; // 보여질 페이지 갯수
	private int perPage = 10; // 한 페이지에 보여질 게시물 갯수
	private int totCnt; // 총 갯수
	private String type;
	private String query;
	private String search;
	private String strList; // 멀티값 받을 시 콤마(,)로 구분지어서 넘어옴

	public Date getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}

	public Date getMod_dt() {
		return mod_dt;
	}

	public void setMod_dt(Date mod_dt) {
		this.mod_dt = mod_dt;
	}

	public int getStartRownum() {
		return startRownum;
	}

	public void setStartRownum(int startRownum) {
		this.startRownum = startRownum;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getTotCnt() {
		return totCnt;
	}

	public void setTotCnt(int totCnt) {
		this.totCnt = totCnt;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getStrList() {
		return strList;
	}

	public void setStrList(String strList) {
		this.strList = strList;
	}

	@Override
	public String toString() {
		return "\nCommonDTO [reg_dt=" + reg_dt + ", mod_dt=" + mod_dt + ", startRownum=" + startRownum + ", pageNum=" + pageNum + ", pageSize=" + pageSize + ", perPage=" + perPage + ", totCnt=" + totCnt + ", type=" + type + ", query=" + query + ", search=" + search + ", strList=" + strList + "]\n";
	}

}
