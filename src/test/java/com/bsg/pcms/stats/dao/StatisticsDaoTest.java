package com.bsg.pcms.stats.dao;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;
import static org.mockito.BDDMockito.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

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

import com.bsg.pcms.sale.company.svc.CompanyService;
import com.bsg.pcms.stats.dto.StatisticsDTO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class StatisticsDaoTest {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	StatisticsDao statisDao; 
	
	private StatisticsDTO param = null;
	
	private SimpleDateFormat simDateFormat;

	@Before
	public void setUp() throws Exception {
		param = new StatisticsDTO();
		simDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testStatsList() {

		// given 

		// when
		List<StatisticsDTO> statDTO = statisDao.list(null);
			
		// then
		assertThat(statDTO.size(), is(not(0)));
		
		for(StatisticsDTO temp : statDTO){
			assertThat(temp.getTotal_sale_count(), is(not(0)));
			assertThat(temp.getTotal_sale_price(), is(not(0)));
			assertThat(temp.getCompany_name(), is(notNullValue()));
			assertThat(temp.getSale_device(), is(notNullValue()));
		}
	}
	
	@Test
	public void testSaleCompanyListOrderbyRegDt() {
		
		// given 
		param.setSortingType("1");
		
		// when
		List<StatisticsDTO> statDTO = statisDao.list(param);
		
		// then
		assertThat(statDTO.size(), is(not(0)));
		
		for(StatisticsDTO temp : statDTO){
			assertThat(temp.getTotal_sale_count(), is(not(0)));
			assertThat(temp.getTotal_sale_price(), is(not(0)));
			assertThat(temp.getCompany_name(), is(notNullValue()));
			assertThat(temp.getSale_device(), is(notNullValue()));
		}
	}
	@Test
	public void testSaleCompanyListOrderbySaleCount() {
		
		// given 
		param.setSortingType("2");
		
		// when
		List<StatisticsDTO> statDTO = statisDao.list(param);
		
		// then
		assertThat(statDTO.size(), is(not(0)));
		
		for(StatisticsDTO temp : statDTO){
			assertThat(temp.getTotal_sale_count(), is(not(0)));
			assertThat(temp.getTotal_sale_price(), is(not(0)));
			assertThat(temp.getCompany_name(), is(notNullValue()));
			assertThat(temp.getSale_device(), is(notNullValue()));
		}
	}
	
	@Test
	public void testSaleCompanyListByQuery() {
		
		// given 
		param.setSearchQuery("지순");
		
		// when
		List<StatisticsDTO> statDTO = statisDao.list(param);
		
		// then
		assertThat(statDTO.size(), is(not(0)));
		
		for(StatisticsDTO temp : statDTO){
			assertThat(temp.getTotal_sale_count(), is(not(0)));
			assertThat(temp.getTotal_sale_price(), is(not(0)));
			assertThat(temp.getCompany_name(), is(notNullValue()));
			assertThat(temp.getSale_device(), is(notNullValue()));
		}
	}
	@Test
	public void testSaleCompanyListBySearchDate() {
		
		// given 
		param.setSearchQuery("솔맷");
		param.setSortingType("1");
		param.setSearchStrDate("2013-06");
		param.setSearchEndDate("2013-07");
		
		// when
		List<StatisticsDTO> statDTO = statisDao.list(param);
		
		// then
		assertThat(statDTO.size(), is(not(0)));
		
		for(StatisticsDTO temp : statDTO){
			assertThat(temp.getTotal_sale_count(), is(not(0)));
			assertThat(temp.getTotal_sale_price(), is(not(0)));
			assertThat(temp.getCompany_name(), is(notNullValue()));
			assertThat(temp.getSale_device(), is(notNullValue()));
		}
	}
	
	@Test
	public void testProductLineGraphCompany() {
		
		// given 
		
		// when
		List<StatisticsDTO> statDTO = statisDao.list(null);
		
		// then
		assertThat(statDTO.size(), is(not(0)));
		
		for(StatisticsDTO temp : statDTO){
			assertThat(temp.getTotal_sale_count(), is(not(0)));
			assertThat(temp.getTotal_sale_price(), is(not(0)));
			assertThat(temp.getCompany_name(), is(notNullValue()));
			assertThat(temp.getSale_device(), is(notNullValue()));
		}
		
		
	}
	
	@Test
	public void testStatisSearchByQuery() {
		// given 
		String query = "지순";
		param.setQuery(query);

		// when
		List<StatisticsDTO> searchResult = statisDao.search(param);

		// then
		List<StatisticsDTO> listResult = statisDao.list(null);
		if(listResult.size() == 0){
			assertThat(searchResult.size(), is(0));
		}else{
			for(StatisticsDTO temp : listResult){
				
				for(StatisticsDTO search : searchResult){
					if(temp.getCompany_name().contains(query)){
						assertThat(searchResult.size(), is(not(0)));					
						assertThat(search.getTotal_sale_count(), is(not(0)));
						assertThat(search.getTotal_sale_price(), is(not(0)));
						assertThat(search.getCompany_name(), is(notNullValue()));
						assertThat(search.getSale_device(), is(notNullValue()));
					}else{
						assertThat(listResult.size() > searchResult.size(), is(true));					
					}
				}
			}
		}
	}
	
	@Test
	public void teststatisSearchByDate() {

		List<StatisticsDTO> listResult = statisDao.list(null);
		
		
		if(listResult.size() != 0){
			
		// given
			param.setSearchStrDate(listResult.get(0).getSale_str_date());
			param.setSearchEndDate(listResult.get(0).getSale_end_date());
		
		// when
			List<StatisticsDTO> searchResult = statisDao.search(param);
				
		// then
			assertThat(searchResult.size(), is(not(0)));					
			logger.info("search : {}", searchResult);
			
			for(StatisticsDTO search : searchResult){
				assertThat(searchResult.size(), is(not(0)));					
				assertThat(search.getTotal_sale_count(), is(not(0)));
				assertThat(search.getTotal_sale_price(), is(not(0)));
				assertThat(search.getCompany_name(), is(notNullValue()));
				assertThat(search.getSale_device(), is(notNullValue()));
			}
		}
	}
	
	@Test
	public void testPieGraphList() {

		// given 
		
		// when
		List<StatisticsDTO> pieGraphList = statisDao.pieGraph(null);

		// then
		List<StatisticsDTO> listResult = statisDao.list(null);
		
		if(listResult.size() > 0){
			assertThat(pieGraphList.size(), is(not(0)));
		}
		
	}
	
	@Test
	public void testPieGraphListInTargetDate() {
		
		// given
		param.setSearchEndDate("2013-06");
		
		// when
		List<StatisticsDTO> pieGraphList = statisDao.pieGraph(param);
		
		// then
		List<StatisticsDTO> listResult = statisDao.list(null);
		
		if(listResult.size() > 0){
			assertThat(pieGraphList.size(), is(not(0)));
		}
		
	}
	
	@Test
	public void testProductPieGraphList() {

		// given 
		
		// when
		List<StatisticsDTO> pieGraphList = statisDao.productPieGraph(null);

		// then
		List<StatisticsDTO> listResult = statisDao.productList(null);
		
		if(listResult.size() > 0){
			assertThat(pieGraphList.size(), is(not(0)));
		}
		
	}
	
	@Test
	public void testProductPieGraphListInTargetDate() {
		
		// given
		param.setSearchEndDate("2013-06");
		
		// when
		List<StatisticsDTO> pieGraphList = statisDao.productPieGraph(param);
		
		// then
		List<StatisticsDTO> listResult = statisDao.productList(null);
		
		if(listResult.size() > 0){
			assertThat(pieGraphList.size(), is(not(0)));
		}
		
	}
	
	@Test
	public void testLineGraphCompanyList() {
		
		// given 
		
		// when
		List<StatisticsDTO> lineGraphList = statisDao.lineGraphCompany();
		
		// then
		List<StatisticsDTO> listResult = statisDao.list(null);
		
		if(listResult.size() > 0){
			assertThat(lineGraphList.size(), is(not(0)));
		}
		
	}
	
	@Test
	public void testLineGraphMonthCount() {
		
		// given
		
		List<StatisticsDTO> listResult = statisDao.list(null);
		
		// when
		for(StatisticsDTO statDTO : listResult){
			statDTO.setSearchEndDate("2013");
			statDTO.setMonthSaleCount(statisDao.lineGraphMonthCount(statDTO));
		}
		
		logger.info("lineGraph Count : {}", listResult);
		logger.info("lineGraph Count : {}", listResult.get(0).getMonthSaleCount());
	}
	
	@Test
	public void testProductList() {
		
		// given
		
		List<StatisticsDTO> listResult = statisDao.productList(null);
		
		logger.info("lineGraph Count : {}", listResult);
	}
	
	
	
}
