package com.bsg.pcms.sale.company.svc;

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
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bsg.pcms.dto.CompanyDTO;
import com.bsg.pcms.dto.DeviceDTO;
import com.bsg.pcms.sale.company.dto.CompanyContentsDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyContractDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyDTOEx;
import com.bsg.pcms.sale.company.dto.DeviceDTOEx;
import com.bsg.pcms.sale.company.svc.CompanyContractService;
import com.bsg.pcms.sale.company.svc.CompanyService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class CompanyContractServiceTest {


	private Logger _logger = LoggerFactory.getLogger(CompanyService.class);

	@Autowired
	private CompanyContractService _saleContractService;
	
	private CompanyContractDTOEx testContractDTOEx;

	@Before
	public void setUp() throws Exception {
		testContractDTOEx = new CompanyContractDTOEx();
	}


//	
	@Test
	public void testCreateContract(){
		
		// 1. 계약 마스터 insert
		// 2. 판매 Contents Group insert
		// 3. 계약 상세 insert
		
		testContractDTOEx = generateContractDto();
		_saleContractService.create(testContractDTOEx);
	}
	
	@Test
	public void testContractList(){
		List<CompanyContractDTOEx> contractList = _saleContractService.list();
		assertThat(contractList.size(), is(not(0)));
		_logger.info("{}", contractList);
		_logger.info("{}", contractList.get(0).getContentsList());
	}
	
	@Test
	public void testContractDeviceList(){
//		List<DeviceDTOEx> contractList = _saleContractService.deviceList();
//		assertThat(contractList.size(), is(not(0)));
//		_logger.info("{}", contractList);
	}
	
	@Test
	public void testContractDetail(){
		CompanyContractDTOEx temp = generateContractDtoForDetail();
		
		CompanyContractDTOEx contractDetail = _saleContractService.detail(temp);
		assertNotNull(contractDetail);
		_logger.info("{}", contractDetail);
	}
	
	private CompanyContractDTOEx generateContractDtoForDetail(){
		CompanyContractDTOEx retVal = new CompanyContractDTOEx();
		retVal.setContract_mgmtno(1);
		return retVal;
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
	

}
