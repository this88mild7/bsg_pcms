package com.bigstarglobal.cms.sale.company.service;

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
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bigstarglobal.cms.dto.CompanyDTO;
import com.bigstarglobal.cms.dto.ContractDTO;
import com.bigstarglobal.cms.sale.company.dto.CompanyDTOEx;
import com.bigstarglobal.cms.sale.company.service.CompanyService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class CompanyServiceTest {
	
	private Logger logger = LoggerFactory.getLogger(CompanyService.class);
	private CompanyDTO testParam = null;
	private CompanyDTOEx testParamEx = null;

	@Autowired
	CompanyService _companyService;
	
	@Before
	public void setUp() throws Exception {
		testParam = new CompanyDTO();
		testParamEx = new CompanyDTOEx();
		
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testGetCustomerListDefault(){
		List<CompanyDTOEx> customerList = _companyService.list();
		assertThat(customerList.size(), is(not(0)));
		logger.info("{}", customerList);
	}
	
//	@Test
//	public void testGetCustomerListBySaleCompanyMgmtNo(){
//		testParamEx.setSale_company_mgmtno(1);
//		List<CompanyDTO> customerList = _companyService.getSaleCompany(testParamEx);
//		assertThat(customerList.size(), is(not(0)));
//		logger.info("{}", customerList);
//	}
//	@Test
//	public void testGetCustomerListByName(){
//		testParamEx.setType("판매처명");
//		testParamEx.setQuery("엘");
//		List<CompanyDTO> customerList = _companyService.getSaleCompany(testParamEx);
//		assertThat(customerList.size(), is(not(0)));
//		logger.info("{}", customerList);
//	}
//	@Test
//	public void testGetCustomerContractList(){
//		List<ContractDTO> customerContractList = contractService.getCustomerContractList();
////		assertThat(customerContractList.size(), is(not(0)));
////		logger.info("{}", customerContractList);
////		assertThat(customerContractList.get(0).getContentsList().size(), is(not(0)));
////		logger.info("{}", customerContractList.get(0).getContentsList());
//	}

}
