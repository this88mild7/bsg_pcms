package com.bsg.pcms.stats.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.bsg.pcms.stats.dto.StatisticsDTO;

@Repository
public class StatisticsDao extends SqlSessionDaoSupport{
	
	public List<StatisticsDTO> list(StatisticsDTO requestParam) {
		return (List<StatisticsDTO>)getSqlSession().selectList("statisQuery.list", requestParam);
		
	}

	public List<StatisticsDTO> search(StatisticsDTO param) {
		return (List<StatisticsDTO>)getSqlSession().selectList("statisQuery.search", param);
	}

	public List<StatisticsDTO> pieGraph(StatisticsDTO param) {
		return (List<StatisticsDTO>)getSqlSession().selectList("statisQuery.pieGraph", param);
	}
	public List<StatisticsDTO> productPieGraph(StatisticsDTO param) {
		return (List<StatisticsDTO>)getSqlSession().selectList("statisQuery.productPieGraph", param);
	}

	public List<StatisticsDTO> lineGraphCompany() {
		return (List<StatisticsDTO>)getSqlSession().selectList("statisQuery.lineGraphCompany");
	}

	public Map<String, String> lineGraphMonthCount(StatisticsDTO param) {
		return (Map<String, String>)getSqlSession().selectOne("statisQuery.lineGraphMonthCount", param);
	}


	public List<StatisticsDTO> productList(StatisticsDTO requestParam) {
		return (List<StatisticsDTO>)getSqlSession().selectList("statisQuery.productList", requestParam);
	}

	public List<StatisticsDTO> productLineGraphContent() {
		return (List<StatisticsDTO>)getSqlSession().selectList("statisQuery.productLineGraphContent");
	}

	public Map productLineGraphMonthCount(StatisticsDTO param) {
		return (Map<String, String>)getSqlSession().selectOne("statisQuery.productLineGraphMonthCount", param);
	}

}
