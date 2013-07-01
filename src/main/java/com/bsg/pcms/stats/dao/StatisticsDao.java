package com.bsg.pcms.stats.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;
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

	public List<StatisticsDTO> pieGraph() {
		return (List<StatisticsDTO>)getSqlSession().selectList("statisQuery.pieGraph");
	}

	public List<StatisticsDTO> lineGraphCompany() {
		return (List<StatisticsDTO>)getSqlSession().selectList("statisQuery.lineGraphCompany");
	}

	public List<StatisticsDTO> lineGraphMonthCount() {
		return (List<StatisticsDTO>)getSqlSession().selectList("statisQuery.lineGraphMonthCount");
	}

}
