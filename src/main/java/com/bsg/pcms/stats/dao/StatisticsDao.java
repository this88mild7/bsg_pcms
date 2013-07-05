package com.bsg.pcms.stats.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.bsg.pcms.stats.dto.StatisticsDTO;

@Repository
public class StatisticsDao extends SqlSessionDaoSupport{
	
	public List<StatisticsDTO> saleCompanys(StatisticsDTO requestParam) {
		return (List<StatisticsDTO>)getSqlSession().selectList("statisQuery.saleCompanys", requestParam);
		
	}

	public List<StatisticsDTO> saleCompanysPieGraph(StatisticsDTO param) {
		return (List<StatisticsDTO>)getSqlSession().selectList("statisQuery.saleCompanysPieGraph", param);
	}
	public List<StatisticsDTO> productsPieGraph(StatisticsDTO param) {
		return (List<StatisticsDTO>)getSqlSession().selectList("statisQuery.productsPieGraph", param);
	}

	public List<StatisticsDTO> saleCompanysLineGraph() {
		return (List<StatisticsDTO>)getSqlSession().selectList("statisQuery.saleCompanysLineGraph");
	}

	public Map<String, String> saleCompanysLineGraphMonthCount(StatisticsDTO param) {
		return (Map<String, String>)getSqlSession().selectOne("statisQuery.saleCompanysLineGraphMonthCount", param);
	}


	public List<StatisticsDTO> products(StatisticsDTO requestParam) {
		return (List<StatisticsDTO>)getSqlSession().selectList("statisQuery.products", requestParam);
	}

	public List<StatisticsDTO> productsLineGraph() {
		return (List<StatisticsDTO>)getSqlSession().selectList("statisQuery.productsLineGraph");
	}

	public Map productsLineGraphMonthCount(StatisticsDTO param) {
		return (Map<String, String>)getSqlSession().selectOne("statisQuery.productsLineGraphMonthCount", param);
	}

	public int saleCompanysCount(StatisticsDTO requestParam) {
		return (Integer)getSqlSession().selectOne("statisQuery.saleCompanysCount", requestParam);
	}

	public int productsCount(StatisticsDTO requestParam) {
		return (Integer)getSqlSession().selectOne("statisQuery.productsCount", requestParam);
	}

}
