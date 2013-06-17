package com.bigstarglobal.cms.provision.content;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertThat;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class ContentDaoTest {

	private Logger logger = LoggerFactory.getLogger(ContentDaoTest.class);

	@Autowired
	ContentDao contentDao;
	
	@Test
	public void testGetContent() {
		
		String contentCode = "CP03_CA40P0001_PB";
		ContentDTOEx contentDTOEx = new ContentDTOEx();
		contentDTOEx.setContents_cd(contentCode);
		
		ContentDTOEx resultDTO = contentDao.getContent(contentDTOEx);
		assertNotNull("this is null", resultDTO);
		logger.info(resultDTO.toString());
		
	}
	
	@Test
	public void testGetContentCount() {
		
		ContentDTOEx contentDTOEx = new ContentDTOEx();
		//검색조건이 들어갈수 있음
		//contentDTOEx.setSearch("");
		//contentDTOEx.setQuery("");
		
		int contentCnt = contentDao.getContentCount(contentDTOEx);
		assertThat(contentCnt, not(0));
		logger.info("cnt is {}", contentCnt);
		
	}
	
	@Test
	public void testGetContentList() {
		
		ContentDTOEx contentDTOExEx = new ContentDTOEx();
		//검색조건이 들어갈수 있음
		//contentDTOExEx.setSearch("");
		//contentDTOExEx.setQuery("");
		
		List<ContentDTOEx> resultDTO = contentDao.getContentList(contentDTOExEx);
		
		assertNotNull(resultDTO);
		assertThat(resultDTO.size(), not(0));
		logger.info("{}", resultDTO);
		
	}
	
	@Test
	public void testGetContentCodeListBySeriesMgmtno() {
		
		ContentDTOEx cde = new ContentDTOEx();
		cde.setSeries_mgmtno(46);
		//검색조건이 들어갈수 있음
		//contentDTOExEx.setSearch("");
		//contentDTOExEx.setQuery("");
		
		List<ContentDTOEx> resultDTO = contentDao.getContentCodeListBySeriesMgmtno(cde);
		
		assertNotNull(resultDTO);
		assertThat(resultDTO.size(), not(0));
		logger.info("{}", resultDTO);
		
	}
	
	@Test
	public void testGetContentCodeListByCateId() {
		
		ContentDTOEx cde = new ContentDTOEx();
		cde.setCate_id(38);
		//검색조건이 들어갈수 있음
		//contentDTOExEx.setSearch("");
		//contentDTOExEx.setQuery("");
		
		List<ContentDTOEx> resultDTO = contentDao.getContentCodeListByCateId(cde);
		
		assertNotNull(resultDTO);
		assertThat(resultDTO.size(), not(0));
		logger.info("{}", resultDTO);
		
	}
	
	@Test
	public void testGetContentCodeBy() {
		
		int cpMgmtno = 3;
		int seriesMgmtno = 0;
		ContentDTOEx contentDTOEx = new ContentDTOEx();
		contentDTOEx.setCompany_mgmtno(cpMgmtno);
		contentDTOEx.setSeries_mgmtno(seriesMgmtno);
		//검색조건이 들어갈수 있음
		//contentDTOEx.setSearch("");
		//contentDTOEx.setQuery("");
		
		ContentDTOEx resultDTO = contentDao.getContentCodeBy(contentDTOEx);
		
		assertNotNull(resultDTO);
		logger.info(resultDTO.toString());
		
	}
	
	@Test
	public void testCreateContent(){
		
		ContentDTOEx contentDTOEx = new ContentDTOEx();
		contentDTOEx.setName("테스트");
		contentDTOEx.setAge(1);
		contentDTOEx.setContents_cd("aaa");
		contentDTOEx.setCate_id(1);
		contentDTOEx.setSeries_mgmtno(1);
		contentDTOEx.setCompany_mgmtno(1);
		contentDTOEx.setSale_price(1000);
		
		int result = contentDao.createContent(contentDTOEx);
		assertThat( result, is(1) );
	}
	
	
	@Test
	public void testUpdateContent() {
		
		String contentCd = "aaa";
		ContentDTOEx contentDTOEx = new ContentDTOEx();
		contentDTOEx.setContents_cd(contentCd);
		contentDTOEx.setName("대원시리즈7");
		logger.info(contentDTOEx.toString());
		
		int result = contentDao.updateContent(contentDTOEx);
		assertThat( result, is(1) );
	}
	
//	@Ignore //삭제 테스트 할때는 제거
	@Test
	public void testDeleteContent() {
		String contentCd = "aaa";
		ContentDTOEx contentDTOEx = new ContentDTOEx();
		contentDTOEx.setContents_cd(contentCd);
		
		int result = contentDao.deleteContent(contentDTOEx);
		assertThat( result, is(1) );
	}
	
	
//	@Test
//	public void testGetContentListByGroupId() {
//		
//		int groupId = 79;
//		List<ContentDTOEx> resultDTO = contentService.getContentListByGroupId(groupId);
//		
//		assertNotNull(resultDTO);
//		assertThat(resultDTO.size(), not(0));
//		
//	}

}
