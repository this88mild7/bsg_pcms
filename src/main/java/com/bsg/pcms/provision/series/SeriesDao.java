package com.bsg.pcms.provision.series;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import com.bsg.pcms.dto.CompanyDTO;
import com.bsg.pcms.dto.SeriesDTO;

@Component
public class SeriesDao extends SqlSessionDaoSupport{
	
	public int createSeries(SeriesDTO seriesDTO) {
		return getSqlSession().insert("seriesQuery.createSeries", seriesDTO);
	}
	
	public int updateSeries(SeriesDTO seriesDTO) {
		return getSqlSession().update("seriesQuery.updateSeries", seriesDTO);
	}
	
	public int deleteSeries(SeriesDTO seriesDTO) {
		return getSqlSession().delete("seriesQuery.deleteSeries", seriesDTO);
	}

	public SeriesDTO getSeries(SeriesDTO seriesDTO) {
		return (SeriesDTO)getSqlSession().selectOne("seriesQuery.getSeries", seriesDTO); 
	}

	//cp_mgmt에 해당하는 시리즈 목록만 호출
	public List<SeriesDTO> getSeriesListByCpMgmtno(CompanyDTO companyDTO) {
		return getSqlSession().selectList("seriesQuery.getSeriesListByCpMgmtno", companyDTO); 
	}
	
	public List<SeriesDTO> getSeriesList(SeriesDTO seriesDTO) {
		return getSqlSession().selectList("seriesQuery.getSeriesList", seriesDTO);
	}
	
	public int getSeriesCount(SeriesDTO seriesDTO) {
		return (Integer) getSqlSession().selectOne("seriesQuery.getSeriesCount", seriesDTO);
	}
}
