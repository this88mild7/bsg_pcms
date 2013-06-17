package com.bigstarglobal.cms.utility;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.bigstarglobal.cms.dto.CommonDTO;
import com.bigstarglobal.cms.dto.PageLinkDTO;

@Component
public class PageUtil {

	private int pageSize = 10; // 한 화면에 보여질 페이지 갯수
	private int perPage = 10; // 한 페이지에 보여질 글 갯수

	public int getPerPage() {
		return perPage;
	}

	public int getTotalPageCnt(int totalCnt) {
		return ((totalCnt - 1) / perPage) + 1;
	}

	public int getFirstPageNum(int pageNum) {
		// ( (페이지 번호 -1) / 총 페이지 사이즈 ) * 총 페이지 사이즈 + 1
		return ((pageNum - 1) / pageSize) * pageSize + 1;
	}

	public int getLastPageNum(int fistPageNum) {
		// 시작 페이지 번호 + 페이지 총 사이즈 -1
		return (fistPageNum + pageSize) - 1;
	}

	public int getStartRowNum(int pageNum, int perPage) {
		return (pageNum - 1) * perPage;
	}

	public PageLinkDTO setPageLinkDTO(int totalCnt, int pageNum) {
		PageLinkDTO pageLink = new PageLinkDTO();
		int firstPageNum = this.getFirstPageNum(pageNum);
		int lastPageNum = this.getLastPageNum(firstPageNum);
		int totalPage = this.getTotalPageCnt(totalCnt);

		lastPageNum = totalPage < lastPageNum ? totalPage : lastPageNum;

		List<CommonDTO> pageList = new ArrayList<CommonDTO>();
		for (int pageNumSeq = firstPageNum; pageNumSeq <= lastPageNum; pageNumSeq++) {
			CommonDTO pageDTO = new CommonDTO();
			pageDTO.setPageNum(pageNumSeq);
			pageList.add(pageDTO);
		}

		pageLink.setTotalCnt(totalCnt);
		pageLink.setPageList(pageList);// 페이지 리스트
		pageLink.setPageNum(pageNum); // 현재 페이지 번호

		// 1페이지가 아니라면
		if (1 != firstPageNum) {
			pageLink.setPagePrev(firstPageNum - 1); // 이전
		}
		// 마지막 페이지 리스트가 아니라면
		if (totalPage != lastPageNum) {
			pageLink.setPageNext(lastPageNum + 1); // 다음
		}
		return pageLink;
	}
}
