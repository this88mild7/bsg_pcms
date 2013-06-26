//package com.bsg.pcms.balance.dao;
//
//import static org.junit.Assert.*;
//import static org.hamcrest.CoreMatchers.*;
////import static org.hamcrest.CoreMatchers.is;
////import static org.hamcrest.CoreMatchers.not;
////import static org.hamcrest.CoreMatchers.notNullValue;
//
//import java.nio.LongBuffer;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
//import java.util.Random;
//
//import org.apache.commons.lang.time.DateUtils;
//import org.junit.After;
//import org.junit.Before;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import com.bsg.pcms.balance.dto.BalanceDTOEx;
//import com.bsg.pcms.dto.BalanceDTO;
//import com.bsg.pcms.provision.contract.ContractDaoTest;
//import com.bsg.pcms.utility.BsgDateUtils;
//
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
//public class BalanceDaoTest {
//	
//	private Logger logger = LoggerFactory.getLogger(getClass());
//	
//	@Autowired
//	private BalanceDao balanceDao;
//	
//	private BalanceDTOEx balanceDtoEx;
//	
//	private List<BalanceDTOEx> _balanceList;
//	
//	
//	private List<Integer> companyMgmtList;
//
//	private Random rand;
//	
//	@Before
//	public void setUp() throws Exception {
//		
//		rand = new Random(System.currentTimeMillis());
//		
//		companyMgmtList = new ArrayList<Integer>();
//		companyMgmtList.add(3);
//		companyMgmtList.add(4);
//		companyMgmtList.add(5);
//		companyMgmtList.add(6);
//		companyMgmtList.add(7);
//		companyMgmtList.add(8);
//		companyMgmtList.add(11);
//		companyMgmtList.add(12);
//		companyMgmtList.add(13);
//		companyMgmtList.add(14);
//		companyMgmtList.add(15);
//		companyMgmtList.add(23);
//		
//		
//		balanceDtoEx = new BalanceDTOEx();
//		balanceDtoEx.setCompany_mgmtno(companyMgmtList.get(Math.abs(rand.nextInt(11))));
//		balanceDtoEx.setCp_commission(Math.abs(rand.nextInt(900000000)));
//		balanceDtoEx.setSale_commission(Math.abs(rand.nextInt(900000000)));
//		balanceDtoEx.setOwner_profit(new Double(Math.abs(rand.nextInt(900000000))));
//		balanceDtoEx.setSale_str_date(BsgDateUtils.getCurrentYyyymmdd());
//		balanceDtoEx.setSale_end_date(BsgDateUtils.getCurrentYyyymmdd());
//		balanceDtoEx.setTotal_sale_count(Math.abs(rand.nextInt(900000000)));
//		balanceDtoEx.setTotal_sale_price(Math.abs(rand.nextInt(900000000)));
//		
//	}
//
//	@After
//	public void tearDown() throws Exception {
//		
//	}
//	
//
//	@Test
//	public void testCreate() {
//		balanceDao.create(balanceDtoEx);
//	}
//	
//	@Test
//	public void testList(){
//		_balanceList = balanceDao.cpList(balanceDtoEx);
//		assertRegDtOrderBy(_balanceList);
//	}
//
//	
//	@Test
//	public void testListOrderByTotalSalePrice(){
//		balanceDtoEx.setPrintType("2");
//		_balanceList = balanceDao.cpList(balanceDtoEx);
//		assertThat(_balanceList, is(notNullValue()) );
//		assertTotalSalePriceOderby(_balanceList);
//		
//	}
//
//	
//	@Test
//	public void testListOrderByOwnerProfit(){
//		balanceDtoEx.setPrintType("3");
//		_balanceList = balanceDao.cpList(balanceDtoEx);
//		assertOwnerProfitOderby(_balanceList);
//		
//	}
//	
//
//	@Test
//	public void testListOrderByTotalSaleCount(){
//		balanceDtoEx.setPrintType("4");
//		_balanceList = balanceDao.cpList(balanceDtoEx);
//		assertTotalSaleCountOderby(_balanceList);
//		
//	}
//
//	
//	
//	@Test
//	public void testDateSearching(){
//		
//		String currencyYYYYMM = BsgDateUtils.getCurrentYyyymm();
//		balanceDtoEx.setDateSortingType("1");
//		balanceDtoEx.setSearchStrDate("20130601");
//		balanceDtoEx.setSearchEndDate(currencyYYYYMM+BsgDateUtils.getStringLastDayOfMon("201306"));
//		
//		
//		_balanceList = balanceDao.searchByDate(balanceDtoEx);
//		assertRegDtOrderBy(_balanceList);
//		
//		balanceDtoEx.setPrintType("2");
//		_balanceList = balanceDao.searchByDate(balanceDtoEx);
//		assertTotalSalePriceOderby(_balanceList);
//		
//		balanceDtoEx.setPrintType("3");
//		_balanceList = balanceDao.searchByDate(balanceDtoEx);
//		assertOwnerProfitOderby(_balanceList);
//		
//		balanceDtoEx.setPrintType("4");
//		_balanceList = balanceDao.searchByDate(balanceDtoEx);
//		assertTotalSaleCountOderby(_balanceList);
//		
//		
//	}
//	
//	@Test
//	public void testWordSearching(){
//		
//		String searchQeury = "한";
//		
//		balanceDtoEx.setDateSortingType("1");
//		balanceDtoEx.setSearchQuery(searchQeury);
//		
//		_balanceList = balanceDao.searchByWord(balanceDtoEx);
//		assertThat(_balanceList.get(0).getCompany_name().contains(searchQeury), is(true));
//		
//		assertRegDtOrderBy(_balanceList);
//		
//		balanceDtoEx.setPrintType("2");
//		_balanceList = balanceDao.searchByWord(balanceDtoEx);
//		assertTotalSalePriceOderby(_balanceList);
//		
//		balanceDtoEx.setPrintType("3");
//		_balanceList = balanceDao.searchByWord(balanceDtoEx);
//		assertOwnerProfitOderby(_balanceList);
//		
//		balanceDtoEx.setPrintType("4");
//		_balanceList = balanceDao.searchByWord(balanceDtoEx);
//		assertTotalSaleCountOderby(_balanceList);
//	}
//	
//	private void assertRegDtOrderBy(List<BalanceDTOEx> balanceList) {
//		
//		if(balanceList.size() > 2){
//			int firBalancoMgmtno = balanceList.get(0).getBalance_mgmtno();
//			int secBalancoMgmtno = balanceList.get(1).getBalance_mgmtno();
//			
//			assertThat(balanceList, is(notNullValue()) );
//			assertThat(firBalancoMgmtno < secBalancoMgmtno	,is(true) );
//		}
//		
//	}
//	
//	private void assertTotalSalePriceOderby(List<BalanceDTOEx> balanceList) {
//		assertThat(balanceList, is(notNullValue()) );
//		if(balanceList.size() > 2){
//			double firstPrice = balanceList.get(0).getTotal_sale_price();
//			double seconPrice = balanceList.get(1).getTotal_sale_price();
//			assertThat(firstPrice >= seconPrice	,is(true) );
//			logger.info("{} >= {}", firstPrice, seconPrice);
//		}
//		
//	}
//
//	private void assertOwnerProfitOderby(List<BalanceDTOEx> balanceList) {
//		assertThat(balanceList, is(notNullValue()) );
//		if(balanceList.size() > 2){
//			assertThat(balanceList, is(notNullValue()) );
//			double firstPrice = balanceList.get(0).getOwner_profit();
//			double seconPrice = balanceList.get(1).getOwner_profit();
//			assertThat(firstPrice >= seconPrice	,is(true) );
//			logger.info("{} >= {}", firstPrice, seconPrice);
//		}
//		
//	}
//	
//	private void assertTotalSaleCountOderby(List<BalanceDTOEx> balanceList) {
//		assertThat(balanceList, is(notNullValue()) );
//		if(balanceList.size() > 2){
//			assertThat(balanceList, is(notNullValue()) );
//			double firstPrice = balanceList.get(0).getTotal_sale_count();
//			double seconPrice = balanceList.get(1).getTotal_sale_count();
//			assertThat(firstPrice >= seconPrice	,is(true) );
//			logger.info("{} >= {}", firstPrice, seconPrice);
//		}
//		
//	}
//
//}
