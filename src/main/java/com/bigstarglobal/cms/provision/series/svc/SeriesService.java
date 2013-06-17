package com.bigstarglobal.cms.provision.series.svc;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bigstarglobal.cms.dto.CompanyDTO;
import com.bigstarglobal.cms.dto.SeriesDTO;

@Service
public interface SeriesService {

	public int createSeries(SeriesDTO seriesDTO) throws SQLException;

	public int getSeriesCount(SeriesDTO seriesDTO);

	public int deleteSeries(SeriesDTO seriesDTO) throws SQLException;

	public int updateSeries(SeriesDTO seriesDTO) throws SQLException;

	public SeriesDTO getSeries(SeriesDTO seriesDTO);

	/** 시리즈 목록을 조회함.
	 * @param seriesDTO 에 cate_id 셋팅
	 * @return List<SeriesDTO>
	 */
	public List<SeriesDTO> getSeriesList(SeriesDTO seriesDTO);

	public List<SeriesDTO> getSeriesListByCpMgmtno(CompanyDTO companyDTO);
}
