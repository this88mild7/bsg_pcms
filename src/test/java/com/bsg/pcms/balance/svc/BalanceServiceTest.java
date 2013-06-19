package com.bsg.pcms.balance.svc;


import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.hamcrest.Matcher;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bsg.pcms.balance.dto.BalanceDTOEx;
import com.bsg.pcms.dto.BalanceDTO;
import com.bsg.pcms.utility.BsgDateUtils;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class BalanceServiceTest {
	
	
	
	@Autowired
	private BalanceService balanceService;
	
	private BalanceDTOEx balanceDto;
	

private BalanceDTOEx balanceDtoEx;
	
	private List<BalanceDTOEx> _balanceList;
	
	
	private List<Integer> companyMgmtList;

	private Random rand;
	
	@Before
	public void setUp() throws Exception {
		
		rand = new Random(System.currentTimeMillis());
		
		companyMgmtList = new ArrayList<Integer>();
		companyMgmtList.add(3);
		companyMgmtList.add(4);
		companyMgmtList.add(5);
		companyMgmtList.add(6);
		companyMgmtList.add(7);
		companyMgmtList.add(8);
		companyMgmtList.add(11);
		companyMgmtList.add(12);
		companyMgmtList.add(13);
		companyMgmtList.add(14);
		companyMgmtList.add(15);
		companyMgmtList.add(23);
		
		
		balanceDtoEx = new BalanceDTOEx();
		balanceDtoEx.setCompany_mgmtno(companyMgmtList.get(Math.abs(rand.nextInt(11))));
		balanceDtoEx.setCp_commission(Math.abs(rand.nextInt(900000000)));
		balanceDtoEx.setSale_commission(Math.abs(rand.nextInt(900000000)));
		balanceDtoEx.setOwner_profit(new Double(Math.abs(rand.nextInt(900000000))));
		balanceDtoEx.setSale_str_date(BsgDateUtils.getCurrentYyyymmdd());
		balanceDtoEx.setSale_end_date(BsgDateUtils.getCurrentYyyymmdd());
		balanceDtoEx.setTotal_sale_count(Math.abs(rand.nextInt(900000000)));
		balanceDtoEx.setTotal_sale_price(Math.abs(rand.nextInt(900000000)));
		
	}

	@After
	public void tearDown() throws Exception {
		
	}

	@Test
	public void testCreate() {
		// 세팅
		// setUp 메소드에서 setting
		
		// 기능
		balanceService.create(balanceDtoEx);
		
		// 검증
		BalanceDTOEx result = balanceService.detail(balanceDtoEx);
		assertThat(result, is(notNullValue()) );
		
	}
	
	@Test
	public void testList(){
		
		//세팅
		BalanceDTOEx result = balanceService.create(balanceDtoEx);
		
		// 기능
		List<BalanceDTOEx> testResult = balanceService.list();
		
		// 검증
		assertThat(testResult, is(testResult) );
		assertThat(testResult.size(), is(not(0)) );
		assertThat(result.getBalance_mgmtno(), 
				is(equalTo(testResult.get(testResult.size()-1).getBalance_mgmtno())));
	}
	
	@Test
	public void testModyfi() {

		// given 

		// when

		// then

		
	}
}
