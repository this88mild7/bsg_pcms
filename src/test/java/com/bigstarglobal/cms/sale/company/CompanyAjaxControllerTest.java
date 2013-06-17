package com.bigstarglobal.cms.sale.company;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.junit.Assert.*;

import java.util.List;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.servlet.ModelAndView;

import com.bigstarglobal.cms.dto.CompanyDTO;
import com.bigstarglobal.cms.provision.content.ContentDTOEx;
import com.bigstarglobal.cms.sale.company.dto.CompanyDTOEx;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class CompanyAjaxControllerTest {

	private MockHttpServletRequest request = null ;
	private MockHttpServletResponse response = null;
	private CompanyDTO customerDTO=null;
	private CompanyDTOEx companyDTOEx=null;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private CompanyAjaxController _saleCompanyAjaxController;

	@Before
	public void setUp() throws Exception {
		request = new MockHttpServletRequest();
		response = new MockHttpServletResponse();
		customerDTO = new CompanyDTO();
		companyDTOEx = new CompanyDTOEx();
	}

	@After
	public void tearDown() throws Exception {
		request = null;
		response = null;
		customerDTO = null;
	}

	@Test
	public void testSeriesList(){
		String seriesResult = _saleCompanyAjaxController.seriesList(null);
		logger.info("{}", seriesResult);
		assertNotNull(seriesResult);
	}
	
	@Test
	public void testCateList(){
		String cateResul3t = _saleCompanyAjaxController.cateList();
		logger.info("{}", cateResult);
		assertNotNull(cateResult);
	}
	
	@Test
	public void testContentsList(){
		String cateResult = _saleCompanyAjaxController.contentsList("38");
		logger.info("{}", cateResult);
		assertNotNull(cateResult);
	}
}
