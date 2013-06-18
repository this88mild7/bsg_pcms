package com.bsg.pcms.balance.svc;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bsg.pcms.dto.BalanceDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class BalanceServiceTest {
	
	@Autowired
	private BalanceService balanceService;
	
	private BalanceDTO balanceDto;
	

	@Before
	public void setUp() throws Exception {
		balanceDto = new BalanceDTO();
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() {
		balanceService.createSaleCompany(balanceDto);
		
	}

}
