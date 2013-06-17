package com.bsg.pcms.provision.series.svc;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bsg.pcms.dto.CompanyDTO;
import com.bsg.pcms.dto.SeriesDTO;
import com.bsg.pcms.provision.content.ContentDTOEx;
import com.bsg.pcms.provision.content.svc.ContentService;
import com.bsg.pcms.provision.series.SeriesDao;

@Service
public class SeriesServiceImpl implements SeriesService {

	private Logger logger = LoggerFactory.getLogger(SeriesServiceImpl.class);

	@Autowired
	private SeriesDao seriesDao;

	@Autowired
	private ContentService contentService;

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.SERIALIZABLE, readOnly = false, rollbackFor = { SQLException.class })
	public int createSeries(SeriesDTO seriesDTO) throws SQLException {
		
		int result = seriesDao.createSeries(seriesDTO);
		
		ContentDTOEx cde = new ContentDTOEx();
		cde.setContents_cd(String.valueOf(seriesDTO.getSeries_mgmtno()));
		cde.setName(seriesDTO.getSeries_name());
		cde.setSeries_mgmtno(seriesDTO.getSeries_mgmtno());
		cde.setCate_id(seriesDTO.getCate_id());
		contentService.createContentBySeries(cde);
		
		return result;
	}

	public int getSeriesCount(SeriesDTO seriesDTO) {
		return seriesDao.getSeriesCount(seriesDTO);
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.SERIALIZABLE, readOnly = false, rollbackFor = { SQLException.class })
	public int deleteSeries(SeriesDTO seriesDTO) throws SQLException {
		String[] seriesList = seriesDTO.getStrList().split(",");
		List<String> list = Arrays.asList(seriesList);

		int result = 0;
		for (String series_id : list) {
			seriesDTO.setSeries_mgmtno(Integer.valueOf(series_id));
			result = seriesDao.deleteSeries(seriesDTO);
		}
		return result;
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.SERIALIZABLE, readOnly = false, rollbackFor = { SQLException.class })
	public int updateSeries(SeriesDTO seriesDTO) throws SQLException {
		
		int result = seriesDao.updateSeries(seriesDTO);
		
		ContentDTOEx cde = new ContentDTOEx();
		cde.setContents_cd(String.valueOf(seriesDTO.getSeries_mgmtno()));
		cde.setName(seriesDTO.getSeries_name());
		cde.setCate_id(seriesDTO.getCate_id());
		contentService.updateContent(cde);
		return result;
		
	}

	public SeriesDTO getSeries(SeriesDTO seriesDTO) {
		return seriesDao.getSeries(seriesDTO);
	}

	public List<SeriesDTO> getSeriesList(SeriesDTO seriesDTO) {
		return seriesDao.getSeriesList(seriesDTO);
	}
	
	public List<SeriesDTO> getSeriesListByCpMgmtno(CompanyDTO companyDTO) {
		return seriesDao.getSeriesListByCpMgmtno(companyDTO);
	}

}
