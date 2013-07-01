package com.bsg.pcms.stats.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.bsg.pcms.stats.dto.StatisticsDTO;

@Repository
public class StatisticsDao extends SqlSessionDaoSupport{
	
	public List<StatisticsDTO> list() {
		return (List<StatisticsDTO>)getSqlSession().selectList("statisQuery.list");
		
	}

	public List<StatisticsDTO> search(StatisticsDTO param) {
		return (List<StatisticsDTO>)getSqlSession().selectList("statisQuery.search", param);
	}

	public List<StatisticsDTO> pieGraph(StatisticsDTO param) {
		return (List<StatisticsDTO>)getSqlSession().selectList("statisQuery.pieGraph", param);
	}

	public List<String> lineGraphCompany() {
		return (List<String>)getSqlSession().selectList("statisQuery.lineGraphCompany");
	}

	public List<Map> lineGraphMonthCount() {
		return (List<Map>)getSqlSession().selectList("statisQuery.lineGraphMonthCount");
	}

	public int lineGraphMonthCount(String company_mgmtno, String year, String month) {
		Map<String, String> yearAndMonth = new HashMap<String, String>();
		yearAndMonth.put("company_mgmtno", company_mgmtno);
		yearAndMonth.put("year", year);
		yearAndMonth.put("month", month);
		return (Integer)getSqlSession().selectOne("statisQuery.lineGraphMonthCount", yearAndMonth);
	}

}
