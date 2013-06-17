package com.bigstarglobal.cms.provision.contract;

import static org.junit.Assert.*;

import static org.hamcrest.CoreMatchers.*;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bigstarglobal.cms.provision.contract.svc.ContractService;
import com.bigstarglobal.cms.utility.SearchDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class ContractServiceTest {

	private Logger logger = LoggerFactory.getLogger(ContractServiceTest.class);

	@Autowired
	ContractService contractService;
	
	
	@Test
	public void testGetContractSearch() {
		
		SearchDTO searchDTO = new SearchDTO();
		searchDTO.setType("CP업체");
		searchDTO.setQuery("대교");
		
		List<ContractDTO> resultDTO = contractService.getContractSearch(searchDTO);
		assertNotNull(resultDTO);
		assertThat(resultDTO.size(), not(0));
		
	}
	
	@Test
	public void testGetContract() {
		
		int contractId = 9;
		ContractDTO contractDTO = new ContractDTO();
		contractDTO.setContract_id(contractId);
		
		ContractDTO resultDTO = contractService.getContract(contractDTO);
		assertNotNull(resultDTO);
		
	}
	
	@Test
	public void testCreateContract() {
		ContractDTO ctd = new ContractDTO();
		ctd.setSale_company_mgmtno("1");
		ctd.setContract_license("1");
		ctd.setContract_license_detail("2");
		ctd.setContract_sdate(new Date(20130501));
		ctd.setContract_edate(new Date(20130501));
		ctd.setContract_price("1000");
		ctd.setContract_price_type("adsa");
		ctd.setContract_sale_type("1");
		ctd.setContract_type("1");
		ctd.setContract_type_detail("1");
		ctd.setContract_rate("50");
		
		List<String> tmpContestCd = new ArrayList<String>();
		
		tmpContestCd.add("CP04_CA33P0001_PB");
		tmpContestCd.add("CP04_CA33P0002_PB");
		tmpContestCd.add("CP04_CA33P0003_PB");
		
		ctd.setSaleContentsPakage(tmpContestCd);
		
		try {
			contractService.createSaleCompanyContract(ctd);
		} catch (Exception e) {
			// TODO: handle exception
		}
		logger.info("{}", ctd.getContract_mgmt_no());
		
		assertTrue(ctd.getContract_mgmt_no() > 1);
		
	}
	
	@Test
	public void getCpContractList() {
		
		List<ContractDTO> resultInfo = contractService.getCpContractList();
		logger.info("{}", resultInfo);
		
		assertNotNull(resultInfo);
		assertThat(resultInfo.size(), is(not(0)));
		
	}
	
	@Test
	public void getCustomerContractList() {
		
		List<ContractDTO> resultInfo = contractService.getCustomerContractList();
		logger.info("{}", resultInfo);
		
		assertNotNull(resultInfo);
		assertThat(resultInfo.size(), is(not(0)));
		
	}

}
