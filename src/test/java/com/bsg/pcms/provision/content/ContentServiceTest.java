package com.bsg.pcms.provision.content;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertThat;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bsg.pcms.provision.content.ContentDTOEx;
import com.bsg.pcms.provision.content.svc.ContentService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class ContentServiceTest {

	@Autowired
	ContentService contentService;
	
	@Test
	public void testList() {
		
		ContentDTOEx contentDTOEx = new ContentDTOEx();
		//검색조건이 들어갈수 있음
		//contentDTO.setSearch("");
		//contentDTO.setQuery("");
		
		List<ContentDTOEx> resultDTO = contentService.getContentList(contentDTOEx);
		
		assertNotNull(resultDTO);
		assertThat(resultDTO.size(), not(0));
		
	}
	
	@Test
	public void testCreateAction(){
		ContentDTOEx contentDTOEx = new ContentDTOEx();
		contentDTOEx.setName("상남2인조");
		contentDTOEx.setCompany_mgmtno(13);
		contentDTOEx.setCate_id(75);
		contentDTOEx.setSeries_mgmtno(46);
		contentDTOEx.setContents_type("picturebook");
		
		assertThat(contentService.createContent(contentDTOEx), is(1) );
	}

}
