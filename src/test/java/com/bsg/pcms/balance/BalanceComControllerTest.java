package com.bsg.pcms.balance;

import static org.junit.Assert.*;

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

import com.bsg.pcms.dto.BalanceDTO;
import com.bsg.pcms.sale.company.CompanyController;
import com.bsg.pcms.sale.company.dto.CompanyDTOEx;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class BalanceComControllerTest {

	private MockHttpServletRequest request = new MockHttpServletRequest();
	private MockHttpServletResponse response = new MockHttpServletResponse();
	private BalanceDTO balanceDto;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private BalanceComController _balanceComContr;

	@Before
	public void setUp() throws Exception {
		balanceDto = new BalanceDTO();
	}

	@After
	public void tearDown() throws Exception {
	}

//	@Test
//	public void testList() {
//		fail("Not yet implemented");
//	}

	@Test
	public void testCreate() {
		String result = _balanceComContr.create(balanceDto);
		assertNotNull(result);
		logger.info(result);
	}

//	@Test
//	public void testCreatView() {
//		fail("Not yet implemented");
//	}

}
