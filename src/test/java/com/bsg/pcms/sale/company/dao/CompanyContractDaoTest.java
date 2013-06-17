package com.bsg.pcms.sale.company.dao;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bsg.pcms.sale.company.dao.CompanyContractDao;
import com.bsg.pcms.sale.company.dto.CompanyContractDTOEx;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class CompanyContractDaoTest {

	
	@Autowired
	private CompanyContractDao contracDao;
	
	private CompanyContractDTOEx testContractDTOEx;

	@Before
	public void setUp() throws Exception {
		testContractDTOEx = new CompanyContractDTOEx();
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testCreate() {
		testContractDTOEx.setCompany_mgmtno(1);
		testContractDTOEx.setLicense_cd("sdf");
		testContractDTOEx.setLicense_cd_detail("license_detail");
//		testContractDTOEx.setStr_date("2013-06-01");
//		testContractDTOEx.setStr_date("2013-06-30");
		testContractDTOEx.setSale_price(12313);
		testContractDTOEx.setSale_profit_rate(12313);
		testContractDTOEx.setSale_profit_type("1");
		testContractDTOEx.setEtc("1");
		testContractDTOEx.setContract_type("1");
		testContractDTOEx.setContract_type_detail("1");
		
		contracDao.create(testContractDTOEx);
	}

}
