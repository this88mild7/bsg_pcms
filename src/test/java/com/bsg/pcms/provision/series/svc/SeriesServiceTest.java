package com.bsg.pcms.provision.series.svc;

import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

import java.sql.SQLException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bsg.pcms.dto.SeriesDTO;
import com.bsg.pcms.provision.series.SeriesDaoTest;
import com.bsg.pcms.provision.series.svc.SeriesService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class SeriesServiceTest {

	private Logger logger = LoggerFactory.getLogger(SeriesDaoTest.class);
	
	@Autowired
	SeriesService seriesService;
	
	@Test
	public void testCreateSeries() throws SQLException {
		SeriesDTO sd = new SeriesDTO();
		sd.setCate_id(75);
		sd.setSeries_name("시리즈 테스트");
		seriesService.createSeries(sd);
	}
	
	@Test
	public void testUpdateSeries() throws SQLException {
		SeriesDTO sd = new SeriesDTO();
		sd.setSeries_mgmtno(50);
		sd.setSeries_name("시리즈 테스트1");
		seriesService.updateSeries(sd);
	}

}
