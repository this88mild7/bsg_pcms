package com.bsg.pcms.sale.company;

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
import org.springframework.web.servlet.mvc.annotation.AnnotationMethodHandlerAdapter;

import com.bsg.pcms.sale.company.CompanyContractController;
import com.bsg.pcms.sale.company.dto.CompanyContentsDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyContractDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyDTOEx;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class CompanyContractControllerTest {
	
	private MockHttpServletRequest request = new MockHttpServletRequest();
	private MockHttpServletResponse response = new MockHttpServletResponse();
	private CompanyContractDTOEx _companyContractDTOEx;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private CompanyContractController _saleCompanyController;

	@Before
	public void setUp() throws Exception {
		_companyContractDTOEx = new CompanyContractDTOEx();
	}

	@After
	public void tearDown() throws Exception {
	}

	
	
	@Test
	public void testSaleContractList() {
		try {
			ModelAndView resView = _saleCompanyController.list();
			List<CompanyContractDTOEx>  resultcode = (List<CompanyContractDTOEx>)resView.getModel().get("saleContractList");
			assertNotNull(resultcode);
			assertThat(resultcode.size(), is(not(0)));
			
			
			for(CompanyContractDTOEx cdtex : resultcode){
				for(CompanyContentsDTOEx ccd : cdtex.getContentsList()){
					assertNotNull(ccd);
					logger.info("{}", ccd);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("{}", e.getMessage());
		}
	}
	
	@Test
	public void testSaleContractDetail() {
		try {
			_companyContractDTOEx.setContract_mgmtno(1);
			ModelAndView resView = _saleCompanyController.contractDetail(_companyContractDTOEx, request);
			CompanyContractDTOEx  resultcode = (CompanyContractDTOEx)resView.getModel().get("saleContractDetail");
			assertNotNull(resultcode);
			logger.info("{}", resultcode);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("{}", e.getMessage());
		}
	}
	
	@Test
	public void testCreateContract(){
		_saleCompanyController.create(generateContractDto(), request);
	}
	
	private CompanyContractDTOEx generateContractDto(){
		CompanyContractDTOEx retVal = new CompanyContractDTOEx();
		retVal.setUser_mgmtseq(1);
		retVal.setCompany_mgmtno(1);
		retVal.setLicense_cd("sdf");
		retVal.setLicense_cd_detail("license_detail");
		retVal.setSale_price(12313);
		retVal.setSale_profit_rate(12313);
		retVal.setSale_profit_type("1");
		retVal.setEtc("1");
		retVal.setContract_type("1");
		retVal.setContract_type_detail("1");
		
		List<String> saleTypeList = new ArrayList<String>();
		saleTypeList.add("ios");
		saleTypeList.add("android");
		saleTypeList.add("web");
		retVal.setDevice_cd_list(saleTypeList);
		
		// Contents Group Generate
		List<CompanyContentsDTOEx> contentsList = new ArrayList<CompanyContentsDTOEx>();
		
		for(int x=1;x<3;x++){
			CompanyContentsDTOEx temp = new CompanyContentsDTOEx();
			temp.setContents_cd("CP03_CA40P000"+x+"_PB");
			contentsList.add(temp);
		}
		retVal.setContentsList(contentsList);
		
		return retVal;
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
