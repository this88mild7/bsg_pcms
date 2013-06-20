package com.bsg.pcms.installments.dao;

import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bsg.pcms.dto.InstallmentsDTO;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class InstallmentsDaoTest {

	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	InstallmentsDao installmentsDao;
	
	@Test
	public void testCreateInstallments() {

		InstallmentsDTO installmentsDTO = new InstallmentsDTO();
		installmentsDTO.setContract_mgmtno(87);
		
		List<InstallmentsDTO> list = new ArrayList<InstallmentsDTO>();
		list.add(installmentsDTO);
		int resultCnt = installmentsDao.createInstallments(list);
		
		logger.info("resultCnt : " + resultCnt);
		assertThat(resultCnt, is(not(0)));
	}
	
	@Test
	public void testGetInstallmentsList() {
		
		int contractMgmtno = 87;
		
		List<InstallmentsDTO> resultDtoList = installmentsDao.getInstallmentsList(contractMgmtno);
		
		logger.info(resultDtoList.toString());
		assertThat(resultDtoList.size(), is(not(0)));
	}
	
	@Test
	public void testDeleteInstallmentsAll() {
		
		int contractMgmtno = 87;

		int resultCnt = installmentsDao.deleteInstallmentsAll(contractMgmtno);
		
		logger.info("resultCnt : " + resultCnt);
		assertThat(resultCnt, is(not(0)));
	}

}
