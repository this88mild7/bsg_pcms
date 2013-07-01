/**
 * 
 */
package com.bsg.pcms.stats;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bsg.pcms.stats.dto.StatisticsDTO;

/**
 * @author Administrator
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class StatisticsAjaxControllerTest {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	StatisticsAjaxController statisticsAjaxController;

	
	private StatisticsDTO param = null;
	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
		param = new StatisticsDTO();
	}

	/**
	 * @throws java.lang.Exception
	 */
	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testPieGraphForJsonThisMonth() {
		String result = statisticsAjaxController.pieGraph(null);
		assertThat(result, is(notNullValue()));
		logger.info("pie json : {}", result);
	}
	@Test
	public void testPieGraphForJsonTargetMonth() {
		param.setSearchEndDate("2013");
		String result = statisticsAjaxController.pieGraph(param);
		assertThat(result, is(notNullValue()));
		logger.info("pie json : {}", result);
	}

}
