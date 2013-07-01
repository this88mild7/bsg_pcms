package com.bsg.pcms.stats.svc;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;
import static org.mockito.BDDMockito.*;
import static org.mockito.Mockito.*;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bsg.pcms.stats.dto.StatisticsDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class StatisticsServiceTest {
	
	private StatisticsDTO param = null;
	
	@Autowired
	private StatisticsService statService;

	@Before
	public void setUp() throws Exception {
		param = new StatisticsDTO();
	}

	@After
	public void tearDown() throws Exception {
	}

	
	
	@Test
	public void testList() {

		// given 

		// when
		List<StatisticsDTO> listResult = statService.list();

		// then
		assertThat(listResult.size(), is(not(0)));
		
	}
	
	@Test
	public void testSearchByQuery() {

		// given 
		String query = "지순";
		param.setQuery(query);

		// when
		List<StatisticsDTO> searchResult = statService.search(param);

		// then
		List<StatisticsDTO> listResult = statService.list();
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

		List<StatisticsDTO> listResult = statService.list();
		
		
		if(listResult.size() != 0){
			
		// given
			param.setSearchStrDate(listResult.get(0).getSale_str_date());
			param.setSearchEndDate(listResult.get(0).getSale_end_date());
		
		// when
			List<StatisticsDTO> searchResult = statService.search(param);
				
		// then
			assertThat(searchResult.size(), is(not(0)));					
			
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
		List<StatisticsDTO> pieGraphList = statService.pieGraph(null);

		// then
		List<StatisticsDTO> listResult = statService.list();
		
		if(listResult.size() > 0){
			assertThat(pieGraphList.size(), is(not(0)));
		}
		
	}

}
