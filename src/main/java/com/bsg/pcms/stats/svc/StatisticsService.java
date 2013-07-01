package com.bsg.pcms.stats.svc;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsg.pcms.stats.dao.StatisticsDao;
import com.bsg.pcms.stats.dto.StatisticsDTO;

@Service
public class StatisticsService {
	
	@Autowired
	StatisticsDao statDao;
	
	public List<StatisticsDTO> list() {
		return statDao.list();
	}

	public List<StatisticsDTO> search(StatisticsDTO param) {
		return statDao.search(param);
	}

	public List<StatisticsDTO> pieGraph(StatisticsDTO param) {
		return statDao.pieGraph(param);
	}
	
	public List<StatisticsDTO> lineGraph(){
		List<String> companyList = statDao.lineGraphCompany();
		//statDao.lineGraphMonthCount(company_mgmtno, year, month);
		return null;
	}

	public List<Map> pieGraphForMap(StatisticsDTO param) {
		
		List<StatisticsDTO> pieGraphResult = pieGraph(param);
		
		List<Map> pieGraphGForMap = new ArrayList<Map>();
		for(StatisticsDTO temp : pieGraphResult){
			Map<String, Object> pieMap = new HashMap<String, Object>();
			pieMap.put("saleCompany", temp.getCompany_name());
			pieMap.put("saleCount", temp.getTotal_sale_count());
			pieGraphGForMap.add(pieMap);
		}
		return pieGraphGForMap;
	}

}
