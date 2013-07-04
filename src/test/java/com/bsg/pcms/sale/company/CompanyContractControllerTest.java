package com.bsg.pcms.sale.company;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertThat;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.Before;
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

import com.bsg.pcms.sale.company.dto.CompanyContentsDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyContractDTOEx;

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
			ModelAndView resView = _saleCompanyController.detail(_companyContractDTOEx, request);
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
		retVal.setCompany_mgmtno(39);
		retVal.setLicense_cd("LS001001");
		retVal.setSale_price(15000648);
		retVal.setSale_price_type("0");
		retVal.setSale_price_currency("USD");
		retVal.setSale_profit_rate(50);
		retVal.setContract_type("CT002002");
		
		// Contents Group Generate
		List<String> contentsList = new ArrayList<String>();
		contentsList.add("85");
		contentsList.add("84");
		retVal.setSelectedContentsCd(contentsList);
		
//		// Contents Price
//		List<String> contentsPriceList = new ArrayList<String>();
//		contentsPriceList.add("50");
//		contentsPriceList.add("100");
//		retVal.setSelectedContentsPrice(contentsPriceList);
//		
//		// Contents Currency
//		List<String> selectedContentsCurrency = new ArrayList<String>();
//		selectedContentsCurrency.add("USD");
//		selectedContentsCurrency.add("KRW");
//		retVal.setSelectedContentsCurrency(selectedContentsCurrency);
		
		
		// installments
		List<String> installments_dt = new ArrayList<String>();
		installments_dt.add("2013-07-01");
		retVal.setInstallments_dt(installments_dt);
		
		List<String> installments_price = new ArrayList<String>();
		installments_price.add("123123");
		retVal.setInstallments_price(installments_price);
		
		retVal.setStr_date(new Date(System.currentTimeMillis()));
		retVal.setEnd_date(new Date(System.currentTimeMillis()));
		
		retVal.setPayments(123123);
		retVal.setPayments_currency("USD");
		retVal.setPayments_type("분납지급");
		
		return retVal;
	}

}
