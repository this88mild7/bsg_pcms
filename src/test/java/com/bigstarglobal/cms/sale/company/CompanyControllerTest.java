package com.bigstarglobal.cms.sale.company;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.junit.Assert.*;

import java.util.ArrayList;
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

import com.bigstarglobal.cms.sale.company.dto.CompanyDTOEx;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class CompanyControllerTest {
	
	private MockHttpServletRequest request = new MockHttpServletRequest();
	private MockHttpServletResponse response = new MockHttpServletResponse();
	private CompanyDTOEx companyDTOEx;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private CompanyController _saleCompanyController;

	@Before
	public void setUp() throws Exception {
		companyDTOEx = new CompanyDTOEx();
	}

	@After
	public void tearDown() throws Exception {
	}

	
	
	@Test
	public void testSaleCompanyCreate() {
		try {
			companyDTOEx = generateCompanyDto();
			ModelAndView resView = _saleCompanyController.create(companyDTOEx);
			List<CompanyDTOEx>  resultcode = (List<CompanyDTOEx> )resView.getModel().get("salCompanyList");
			assertThat(resultcode.size(), is(not(0)));
			logger.info("{}", resultcode);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("{}", e.getMessage());
		}
	}
	
	@Test
	public void testSaleCompanyModify() {
		try {
			companyDTOEx = generateCompanyDtoForModify();
			String resView = _saleCompanyController.modify(companyDTOEx);
			assertNotNull(resView);
			logger.info("{}", resView);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("{}", e.getMessage());
		}
	}
	
	@Test
	public void testSaleCompanyDelete() {
		try {
			companyDTOEx = generateCompanyDtoForDelete();
			String resView = _saleCompanyController.delete(companyDTOEx);
			assertNotNull(resView);
			logger.info("{}", resView);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("{}", e.getMessage());
		}
	}
	
	@Test
	public void testSaleCompanyList() {
		try {
			ModelAndView resView = _saleCompanyController.list(companyDTOEx);
			List<CompanyDTOEx>  resultcode = (List<CompanyDTOEx> )resView.getModel().get("salCompanyList");
			assertThat(resultcode.size(), is(not(0)));
			logger.info("{}", resultcode);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("{}", e.getMessage());
		}
	}
	
	@Test
	public void testSaleCompanyDetail() {
		try {
			companyDTOEx.setCompany_mgmtno(7);
			ModelAndView resView = _saleCompanyController.detail(companyDTOEx);
			CompanyDTOEx  resultcode = (CompanyDTOEx)resView.getModel().get("saleCompany");
			assertNotNull(resultcode);
			logger.info("{}", resultcode);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("{}", e.getMessage());
		}
	}
	
	@Test
	public void testSaleCompanyCreateView() {
		try {
			ModelAndView resView = _saleCompanyController.createView();
			assertNotNull(resView);
			logger.info("{}", resView.getViewName());
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("{}", e.getMessage());
		}
	}
	
	private CompanyDTOEx generateCompanyDto(){
		CompanyDTOEx retval = new CompanyDTOEx();
		retval.setCompany_name("최지순");
		retval.setAddr("경기도 ...");
		retval.setPhoneno("123-1234-1234");
		retval.setMaster("마스터 지순");
		retval.setMaster_email("master@master.com");
		retval.setCompany_no("1234-456-7897");
		retval.setDeposit_bank("기업은행");
		retval.setAccount_no("133-4564-4564-45");
		retval.setAccount_holder("최지순");
		return retval;
	}
	
	private CompanyDTOEx generateCompanyDtoForModify(){
		CompanyDTOEx retval = new CompanyDTOEx();
		retval.setCompany_mgmtno(1);
		retval.setCompany_name("최지순-mod");
		retval.setAddr("경기도 ...mod");
		retval.setPhoneno("010-0000-0000");
		retval.setMaster("마스터 지순mod");
		retval.setMaster_email("modmaster@master.com");
		retval.setCompany_no("000-0000-0000");
		retval.setDeposit_bank("mod_기업은행");
		retval.setAccount_no("000-0000-0000-00");
		retval.setAccount_holder("mod최지순");
		return retval;
	}
	
	private CompanyDTOEx generateCompanyDtoForDelete(){
		CompanyDTOEx retval = new CompanyDTOEx();
		List<String> delCompany = new ArrayList<String>();
		delCompany.add("1");
		delCompany.add("2");
		retval.setDeleteCompany(delCompany);
		return retval;
	}
	
	
//	@Test
//	public void testCreateCustomerView() {
//		try {
//			ModelAndView resView = customerController.createSaleCompanyContractView();
//			List<CompanyDTOEx>  resultcode = (List<CompanyDTOEx> )resView.getModel().get("customerList");
//			assertThat(resultcode.size(), is(not(0)));
//			logger.info("{}", resultcode);
//		} catch (Exception e) {
//			e.printStackTrace();
//			logger.error("{}", e.getMessage());
//		}
//	}
	
//	@Test
//	public void testCreateContractAction() {
//		try {
//			ModelAndView resView = customerController.createContractAction(companyDTOEx, request);
//			List<CompanyDTOEx>  resultcode = (List<CompanyDTOEx> )resView.getModel().get("customerList");
//			assertThat(resultcode.size(), is(not(0)));
//			logger.info("{}", resultcode);
//		} catch (Exception e) {
//			e.printStackTrace();
//			logger.error("{}", e.getMessage());
//		}
//	}

}
