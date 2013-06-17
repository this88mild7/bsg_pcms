package com.bigstarglobal.cms.provision.content.svc;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bigstarglobal.cms.provision.content.ContentDTOEx;

@Service
public interface ContentService {

	public ContentDTOEx getContent(ContentDTOEx cde);

	public int getContentCount(ContentDTOEx cde);
	
	public int getContentCountBySeriesMgmtno(int seriesMgmtno);

	public List<ContentDTOEx> getContentList(ContentDTOEx cde);

	/** 콘텐츠 목록을 조회함.
	 * @param ContentDTOEx 에 series_mgmtno 셋팅
	 * @return List<ContentDTOEx>
	 */
	public List<ContentDTOEx> getContentCodeListBySeriesMgmtno(ContentDTOEx cde);

	/** 콘텐츠 목록을 조회함.
	 * @param ContentDTOEx 에 cate_id 셋팅
	 * @return List<ContentDTOEx>
	 */
	public List<ContentDTOEx> getContentCodeListByCateId(ContentDTOEx cde);

	public int createContent(ContentDTOEx cde);

	/** 시리즈 관리번호로 컨텐츠를 생성
	 * @param cde
	 * @return
	 */
	public int createContentBySeries(ContentDTOEx cde);

	public int updateContent(ContentDTOEx cde);

	public int deleteContent(ContentDTOEx cde) throws SQLException;

}
