package com.bsg.pcms.provision.content.svc;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bsg.pcms.provision.category.svc.CategoryService;
import com.bsg.pcms.provision.content.ContentDTOEx;
import com.bsg.pcms.provision.content.ContentDao;

@Service
public class ContentServiceImpl implements ContentService {

	private Logger logger = LoggerFactory.getLogger(CategoryService.class);

	@Autowired
	private ContentDao contentDao;

	public ContentDTOEx getContent(ContentDTOEx content) {
		return contentDao.getContent(content);
	}

	public int getContentCount(ContentDTOEx content) {
		return contentDao.getContentCount(content);
	}
	
	public int getContentCountBySeriesMgmtno(int seriesMgmtno) {
		return contentDao.getContentCountBySeriesMgmtno(seriesMgmtno);
	}

	public List<ContentDTOEx> getContentList(ContentDTOEx content) {
		return contentDao.getContentList(content);
	}
	
	public List<ContentDTOEx> getContentCodeListBySeriesMgmtno(ContentDTOEx cde) {
		return contentDao.getContentCodeListBySeriesMgmtno(cde);
	}
	
	public List<ContentDTOEx> getContentCodeListByCateId(ContentDTOEx cde) {
		return contentDao.getContentCodeListByCateId(cde);
	}

	public int createContent(ContentDTOEx content) {
		content.setContents_cd(this.makeContentCode(content));
		return contentDao.createContent(content);
	}
	
	public int createContentBySeries(ContentDTOEx content) {
		return contentDao.createContent(content);
	}


	public int updateContent(ContentDTOEx content) {
		return contentDao.updateContent(content);
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.SERIALIZABLE, readOnly = false, rollbackFor = { SQLException.class })
	public int deleteContent(ContentDTOEx content) throws SQLException {
		String[] contentList = content.getStrList().split(",");
		List<String> list = Arrays.asList(contentList);

		int result = 0;
		for (String contents_cd : list) {
			content.setContents_cd(contents_cd);
			result = contentDao.deleteContent(content);
		}
		return result;
	}

	private String makeContentCode(ContentDTOEx contentDTO) {

		ContentDTOEx resultDTO = contentDao.getContentCodeBy(contentDTO);

		// 컨텐츠 시퀀스 생성
		int seq = 1;
		if (resultDTO != null) {
			String contentsCode = resultDTO.getContents_cd();
			int i = Integer.valueOf(contentsCode.substring(contentsCode.length() - 7, contentsCode.length() - 3));
			seq = ++i;
		}

		// 컨텐츠 접미사 생성
		String suffix = "";
		String contentType = contentDTO.getContents_type();
		if (contentType.equalsIgnoreCase("pb")) {
			suffix = "PB";
		} else if (contentType.equalsIgnoreCase("ebook")) {
			suffix = "EB";
		} else if (contentType.equalsIgnoreCase("2d")) {
			suffix = "2D";
		} else if (contentType.equalsIgnoreCase("3d")) {
			suffix = "3D"; // 3d
		} else {
			suffix = "GA"; // game
		}

		// 컨텐츠 코드 CP[cpId(2자리)]_SE[seriesId(2자리)P[콘텐츠시퀀스(4자리)_접미사]]
		String contentCode = String.format("CP%02d_SE%02dP%04d_%s", contentDTO.getCompany_mgmtno(), contentDTO.getSeries_mgmtno(), seq, suffix);
		return contentCode.toString();
	}

}