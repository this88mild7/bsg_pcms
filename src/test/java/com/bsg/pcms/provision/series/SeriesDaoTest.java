package com.bsg.pcms.provision.series;

import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bsg.pcms.dto.CompanyDTO;
import com.bsg.pcms.dto.SeriesDTO;
import com.bsg.pcms.provision.series.SeriesDao;
import com.bsg.pcms.provision.series.SeriesDaoTest;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class SeriesDaoTest {

	private Logger logger = LoggerFactory.getLogger(SeriesDaoTest.class);
	
	@Autowired
	private SeriesDao seriesDao;
	
	@Test
	public void testCreateSeries() {
		SeriesDTO seriesDTO = new SeriesDTO();
		seriesDTO.setSeries_name("대원시리즈1");
		seriesDTO.setCate_id(32);
		
		int result = seriesDao.createSeries(seriesDTO);
		assertThat( result, is(1) );
		//체크: series_mgmtno 생성 여부
		logger.info(seriesDTO.toString());
	}
	
	@Test
	public void testUpdateSeries() {
		int seriesMgmtno = 40;
		SeriesDTO seriesDTO = new SeriesDTO();
		seriesDTO.setSeries_mgmtno(seriesMgmtno);
		seriesDTO.setSeries_name("대원시리즈7");
		seriesDTO.setCate_id(74);
		logger.info(seriesDTO.toString());
		
		int result = seriesDao.updateSeries(seriesDTO);
		assertThat( result, is(1) );
	}
	
	@Ignore //삭제 테스트 할때는 제거
	@Test
	public void testDeleteSeries() {
		int seriesMgmtno = 39;
		SeriesDTO seriesDTO = new SeriesDTO();
		seriesDTO.setSeries_mgmtno(seriesMgmtno);
		
		int result = seriesDao.deleteSeries(seriesDTO);
		assertThat( result, is(1) );
	}
	
	@Test
	public void testGetSeriesList() {
		
		int cateId = 0; 
		
		//검색 조건절
		String type = null;//"시리즈명"; //검색할 경우 null대신 { 회사명|CP코드|"" } 입력
		String query = "ㅁ"; //검색어
		
		SeriesDTO seriesDTO = new SeriesDTO();
		seriesDTO.setType(type);
		seriesDTO.setQuery(query);
		seriesDTO.setCate_id(cateId);
		
		logger.info(seriesDTO.toString());
		List<SeriesDTO> resultDTO = seriesDao.getSeriesList(seriesDTO);
		assertNotNull( resultDTO );
		assertThat( resultDTO.size(), not(0) );
		logger.info(resultDTO.toString());
	}
	
	@Test
	public void testGetSeriesListByCpMgmtno() {
		
		int cpMgmtno = 23; //솔맷컴패니 
		CompanyDTO cd = new CompanyDTO();
		cd.setCompany_mgmtno(cpMgmtno);
//		TODO 검색있을수 있어서 주석처리
//		seriesDTO.setType(type);
//		seriesDTO.setQuery(query);
//		seriesDTO.setCate_id(cateId);
		
		List<SeriesDTO> resultDTO = seriesDao.getSeriesListByCpMgmtno(cd);
		assertNotNull( resultDTO );
		assertThat( resultDTO.size(), not(0) );
		logger.info(resultDTO.toString());
	}
	
	@Test
	public void testGetSeries() {
		
		int seriesMgmtno = 38;
		SeriesDTO seriesDTO = new SeriesDTO();
		seriesDTO.setSeries_mgmtno(seriesMgmtno);
		
		SeriesDTO resultDTO = seriesDao.getSeries(seriesDTO);
		assertNotNull( resultDTO );
		logger.info("{}", resultDTO);
	}
	
	@Test
	public void testGetSeriesCount() {
		
		//검색 조건절
		String type = null; //검색할 경우 null대신 { 회사명|CP코드|"" } 입력
		String query = ""; //검색어
		
		SeriesDTO seriesDTO = new SeriesDTO();
		seriesDTO.setType(type);
		seriesDTO.setQuery(query);
		int seriesCnt = seriesDao.getSeriesCount(seriesDTO);
		assertThat(seriesCnt, not(0));
		logger.info("{}", seriesCnt);
	}

}
