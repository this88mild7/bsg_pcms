package com.bigstarglobal.cms.provision.category;

import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bigstarglobal.cms.dto.CateDTO;
import com.bigstarglobal.cms.provision.category.CategoryDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class CategoryDaoTest {

	private Logger logger = LoggerFactory.getLogger(CategoryDaoTest.class);
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Test
	public void testCreateCategory() {
		
		int parentId = 0; //상위 카테고리 존재시 cate_id 넣어줘야함  
		CateDTO categoryDTO = new CateDTO();
		categoryDTO.setCate_name("대원카테고리1");
		categoryDTO.setParent_id(parentId); 
		
		int result = categoryDao.createCategory(categoryDTO);
		assertThat( result, is(1) );
		//체크: category_mgmtno 생성 여부
		logger.info(categoryDTO.toString());
	}
	
	@Test
	public void testUpdateCategory() {
		
		int cateId = 74;
		int parentId = 0; //상위 카테고리 존재시 cate_id 넣어줘야함  
		
		CateDTO categoryDTO = new CateDTO();
		categoryDTO.setCate_id(cateId);
		categoryDTO.setParent_id(parentId); 
		categoryDTO.setCate_name("대원카테고리3");
		logger.info(categoryDTO.toString());
		
		int result = categoryDao.updateCategory(categoryDTO);
		assertThat( result, is(1) );
	}
	
//	@Ignore //삭제 테스트 할때는 제거
	@Test
	public void testDeleteCategory() {
		int cateId = 73;
		CateDTO categoryDTO = new CateDTO();
		categoryDTO.setCate_id(cateId);
		
		int result = categoryDao.deleteCategory(categoryDTO);
		assertThat( result, is(1) );
	}
	
	@Test
	public void testGetCategoryList() {
		
		//parent_id를 가진 하위카테고리 조회
		int parentId = 0;
		
		//검색 조건절
		String type = null; //검색할 경우 null대신 { 카테고리명 } 입력
		String query = "대원"; //검색어
		
		CateDTO categoryDTO = new CateDTO();
		categoryDTO.setType(type);
		categoryDTO.setQuery(query);
		categoryDTO.setParent_id(parentId);
		
		logger.info(categoryDTO.toString());
		List<CateDTO> resultDTO = categoryDao.getCategoryList(categoryDTO);
		assertNotNull( resultDTO );
		assertThat( resultDTO.size(), not(0) );
		logger.info(resultDTO.toString());
	}
	
	@Test
	public void testGetCategory() {
		
		int cateId = 74;
		CateDTO categoryDTO = new CateDTO();
		categoryDTO.setCate_id(cateId);
		
		CateDTO resultDTO = categoryDao.getCategory(categoryDTO);
		assertNotNull( resultDTO );
		logger.info("{}", resultDTO);
	}
	
	@Test
	public void testGetCategoryCount() {
		
		//검색 조건절
		String type = null; //검색할 경우 null대신 { 회사명|CP코드|"" } 입력
		String query = ""; //검색어
		
		CateDTO categoryDTO = new CateDTO();
		categoryDTO.setType(type);
		categoryDTO.setQuery(query);
		int categoryCnt = categoryDao.getCategoryCount(categoryDTO);
		assertThat(categoryCnt, not(0));
		logger.info("{}", categoryCnt);
	}

}
