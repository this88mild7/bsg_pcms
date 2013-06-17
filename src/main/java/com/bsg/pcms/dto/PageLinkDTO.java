package com.bsg.pcms.dto;

import java.util.List;



public class PageLinkDTO {
	
	private int totalCnt = 0;
	private int pageNum = 1;
	private int pagePrev;
	private int pageNext;
	private List<CommonDTO> pageList;
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPagePrev() {
		return pagePrev;
	}
	public void setPagePrev(int pagePrev) {
		this.pagePrev = pagePrev;
	}
	public int getPageNext() {
		return pageNext;
	}
	public void setPageNext(int pageNext) {
		this.pageNext = pageNext;
	}
	public List<CommonDTO> getPageList() {
		return pageList;
	}
	public void setPageList(List<CommonDTO> pageList) {
		this.pageList = pageList;
	}
	@Override
	public String toString() {
		return String.format("PageLinkDTO [totalCnt=%s, pageNum=%s, pagePrev=%s, pageNext=%s, pageList=%s]", totalCnt, pageNum, pagePrev, pageNext, pageList);
	}
	
	
}
