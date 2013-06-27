package com.bsg.pcms.provision.content;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

@Component
public class ContentDao extends SqlSessionDaoSupport {

	public ContentDTOEx getContent(ContentDTOEx contentDTOEx) {
		return (ContentDTOEx) getSqlSession().selectOne("contentQuery.getContent", contentDTOEx);
	}

	public int getContentCount(ContentDTOEx contentDTOEx) {
		return (Integer) getSqlSession().selectOne("contentQuery.getContentCount", contentDTOEx);
	}
	
	public int getContentCountBySeriesMgmtno(int seriesMgmtno) {
		return (Integer) getSqlSession().selectOne("contentQuery.getContentCountBySeriesMgmtno", seriesMgmtno);
	}

	public ContentDTOEx getContentCodeBy(ContentDTOEx contentDTOEx) {
		return (ContentDTOEx) getSqlSession().selectOne("contentQuery.getContentCodeBy", contentDTOEx);
	}
	
	public List<ContentDTOEx> getContentCodeListBySeriesMgmtno(ContentDTOEx contentDTOEx) {
		return (List<ContentDTOEx>) getSqlSession().selectList("contentQuery.getContentCodeListBySeriesMgmtno", contentDTOEx);
	}
	
	public List<ContentDTOEx> getContentCodeListByCateId(ContentDTOEx contentDTOEx) {
		return (List<ContentDTOEx>) getSqlSession().selectList("contentQuery.getContentCodeListByCateId", contentDTOEx);
	}

	public List<ContentDTOEx> getContentList(ContentDTOEx contentDTOEx) {
		return (List<ContentDTOEx>) getSqlSession().selectList("contentQuery.getContentList", contentDTOEx);
	}

	public int createContent(ContentDTOEx contentDTOEx) {
		return getSqlSession().insert("contentQuery.createContent", contentDTOEx);
	}

	public int deleteContent(ContentDTOEx contentDTOEx) {
		return getSqlSession().delete("contentQuery.deleteContent", contentDTOEx);
	}

	public int updateContent(ContentDTOEx contentDTOEx) {
		return getSqlSession().update("contentQuery.updateContent", contentDTOEx);
	}
	
	/** 컨텐츠 생성시 시리즈에 company_mgmtno 업데이트
	 * @param cde[company_mgmtno, series_mgmtno, series_name에다가 series_mgmtno 넣어주기 mybatis type error나기 때문]
	 * @return
	 */
	public int updateContentForSeries(ContentDTOEx contentDTOEx) {
		return getSqlSession().update("contentQuery.updateContentForSeries", contentDTOEx);
	}

}
