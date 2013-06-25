package com.bsg.pcms.balance.svc;


import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;
import static org.mockito.BDDMockito.*;
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
	
	private BalanceDTOEx balanceDtoEx;
	
	private List<Integer> companyMgmtList;

	private Random rand;
	
	private List<String> contentList;
	private List<Integer> salePriceList;
	
	@Before
	public void setUp() throws Exception {
		
		rand = new Random(System.currentTimeMillis());
		contentList = new ArrayList<String>();
		salePriceList = new ArrayList<Integer>();
		
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
		balanceDtoEx.setContract_mgmtno(rand.nextInt(80));
		balanceDtoEx.setCompany_mgmtno(companyMgmtList.get(Math.abs(rand.nextInt(11))));
		balanceDtoEx.setCp_commission(Math.abs(rand.nextInt(900000000)));
		balanceDtoEx.setSale_commission(Math.abs(rand.nextInt(900000000)));
		balanceDtoEx.setOwner_profit(new Double(Math.abs(rand.nextInt(900000000))));
		balanceDtoEx.setSale_str_date(BsgDateUtils.getCurrentYyyymmdd());
		balanceDtoEx.setSale_end_date(BsgDateUtils.getCurrentYyyymmdd());
		balanceDtoEx.setTotal_sale_count(Math.abs(rand.nextInt(900000000)));
		balanceDtoEx.setTotal_sale_price(Math.abs(rand.nextInt(900000000)));
		
		
		// 판매상품 리스트
		contentList.add("CP15_SE81P0031_PB");
		contentList.add("CP15_SE81P0032_PB");
		contentList.add("CP15_SE81P0033_PB");
		contentList.add("CP15_SE81P0034_PB");
		contentList.add("CP15_SE81P0035_PB");
		contentList.add("CP15_SE81P0036_PB");
		contentList.add("CP15_SE81P0037_PB");
		contentList.add("CP15_SE81P0038_PB");
		contentList.add("CP15_SE81P0039_PB");
		contentList.add("CP15_SE81P0040_PB");
		contentList.add("CP15_SE81P0041_PB");
		
		balanceDtoEx.setContentList(contentList);
		//
		salePriceList.add(Math.abs(rand.nextInt(9999)));
		salePriceList.add(Math.abs(rand.nextInt(9999)));
		salePriceList.add(Math.abs(rand.nextInt(9999)));
		salePriceList.add(Math.abs(rand.nextInt(9999)));
		salePriceList.add(Math.abs(rand.nextInt(9999)));
		salePriceList.add(Math.abs(rand.nextInt(9999)));
		salePriceList.add(Math.abs(rand.nextInt(9999)));
		salePriceList.add(Math.abs(rand.nextInt(9999)));
		salePriceList.add(Math.abs(rand.nextInt(9999)));
		salePriceList.add(Math.abs(rand.nextInt(9999)));
		salePriceList.add(Math.abs(rand.nextInt(9999)));
		
		balanceDtoEx.setSaleCount(salePriceList);
		
	}

	@After
	public void tearDown() throws Exception {
		
	}

	@Test
	public void testCreate() {
		// 세팅
		int preCreateBalanceMgmtno = balanceDtoEx.getBalance_mgmtno();
		
		// 기능
		balanceService.create(balanceDtoEx);
		
		// 검증
		BalanceDTOEx resultOfCreate = balanceService.detail(balanceDtoEx);
		assertThat(resultOfCreate, is(notNullValue()) );
		assertThat(resultOfCreate.getBalance_mgmtno() > preCreateBalanceMgmtno, is(true));
		
	}
	
	@Test
	public void testModyfi() {

		// given 
		BalanceDTOEx resultOfCreate = balanceService.create(balanceDtoEx);
		resultOfCreate.setTotal_sale_count(1);
		resultOfCreate.setTotal_sale_price(1);

		// when
		balanceService.modify(balanceDtoEx);

		// then
		BalanceDTOEx resultOfDetail = balanceService.detail(balanceDtoEx);
		assertThat(resultOfDetail, is(notNullValue()));
		assertThat(resultOfDetail.getTotal_sale_count(), is(1));
		assertThat(resultOfDetail.getTotal_sale_price(), is(new Double(1)));
	}
	
	@Test
	public void testDelete() {

		// given 
		int preCreateBalanceMgmtno = balanceDtoEx.getBalance_mgmtno();
		BalanceDTOEx resultOfCreate = balanceService.create(balanceDtoEx);
		assertThat(resultOfCreate.getBalance_mgmtno(), is(notNullValue()));
		assertThat(resultOfCreate.getBalance_mgmtno() > preCreateBalanceMgmtno, is(true));

		// when
		balanceService.delete(resultOfCreate);

		// then
		BalanceDTOEx resultOfDetail = balanceService.detail(resultOfCreate);
		assertThat(resultOfDetail, is(nullValue()));
	}
	
}
