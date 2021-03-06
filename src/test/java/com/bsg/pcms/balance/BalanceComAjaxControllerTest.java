package com.bsg.pcms.balance;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;
import static org.mockito.BDDMockito.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bsg.pcms.sale.company.dto.CompanyContractDTOEx;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class BalanceComAjaxControllerTest {
	
	@Autowired
	BalanceComAjaxController balanceComAjaxController;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}
	
	
	@Test
	public void testSaleCompanyList() {

		// given 

		// when
		String jsonResult = balanceComAjaxController.list(); 

		// then
		assertThat(jsonResult, is(notNullValue()));
		
	}
	@Test
	public void testSaleCompanyContractType() {
		
		// given 
		
		// when
		String jsonResult = balanceComAjaxController.contractType(32, null); 
		
		// then
		assertThat(jsonResult, is(notNullValue()));
		
	}
	@Test
	public void testSaleCompanyDeviceType() {
		
		// given 
		
		// when
		String jsonResult = balanceComAjaxController.deviceType(32); 
		
		// then
		assertThat(jsonResult, is(notNullValue()));
		
	}
	
	@Test
	public void testSaleCompanyContents() {
		
		// given 
		CompanyContractDTOEx companyContractDTOEx = new CompanyContractDTOEx();
		
		companyContractDTOEx.setContract_type("CT002002");
		//companyContractDTOEx.setSale_type("DV001002");
		companyContractDTOEx.setCompany_mgmtno(32);
		
		
		// when
		String jsonResult = balanceComAjaxController.contents(companyContractDTOEx); 
		
		// then
		assertThat(jsonResult, is(notNullValue()));
		
	}
}
