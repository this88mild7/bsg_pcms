package com.bsg.pcms.balance.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.bsg.pcms.balance.dto.BalanceDTOEx;
import com.bsg.pcms.dto.BalanceDTO;
import com.bsg.pcms.dto.BalanceDetailDTO;
import com.bsg.pcms.sale.company.dto.CompanyContractDTOEx;

@Component
public class BalanceDao extends SqlSessionDaoSupport{

	public void create(BalanceDTOEx balanceDto) {
		getSqlSession().insert( "balanceQuery.createSaleCompany", balanceDto);
	}
	public void createDetail(BalanceDetailDTO balanceDto) {
		getSqlSession().insert( "balanceQuery.createDetail", balanceDto);
	}

	public List<BalanceDTOEx> cpList(BalanceDTOEx balanceDtoEx) {
		return (List<BalanceDTOEx>)getSqlSession().selectList("balanceQuery.cpList", balanceDtoEx);
	}
	
	public List<BalanceDTOEx> saleList(BalanceDTOEx balanceDtoEx) {
		return (List<BalanceDTOEx>)getSqlSession().selectList("balanceQuery.saleList", balanceDtoEx);
	}
	public List<String> contentsList(BalanceDTOEx balanceDtoEx) {
		return (List<String>)getSqlSession().selectList("balanceQuery.contentsList", balanceDtoEx);
	}
	public List<String> saleTypeList(BalanceDTOEx balanceDtoEx) {
		return (List<String>)getSqlSession().selectList("balanceQuery.saleTypeList", balanceDtoEx);
	}

	public void modify(BalanceDTOEx balanceDto) {
		getSqlSession().update("balanceQuery.modify", balanceDto);
		
	}

	public BalanceDTOEx detail(BalanceDTOEx balanceDto) {
		return (BalanceDTOEx)getSqlSession().selectOne("balanceQuery.detail", balanceDto);
	}

	public void delete(BalanceDTOEx balanceDto) {
		getSqlSession().update("balanceQuery.delete", balanceDto);
	}
	public List<Map> saleCompanyList() {
		return (List<Map>)getSqlSession().selectList("balanceQuery.saleCompanyList");
	}
	public List<Map> device(int company_mgmtno) {
		return (List<Map>)getSqlSession().selectList("balanceQuery.device", company_mgmtno);
	}
	public List<Map> saleType(int company_mgmtno, String sale_type) {
		Map<String, Object> daoParam = new HashMap<String, Object>();
		daoParam.put("company_mgmtno", company_mgmtno);
		if(StringUtils.isNotBlank(sale_type)){
			daoParam.put("sale_type", sale_type);
		}
		return (List<Map>)getSqlSession().selectList("balanceQuery.saleType", daoParam);
	}
	public List<Map> contents(CompanyContractDTOEx companyContractDTOEx) {
		return (List<Map>)getSqlSession().selectList("balanceQuery.contents", companyContractDTOEx);
	}
	public int cpsCount(BalanceDTOEx balanceDto) {
		return (Integer)getSqlSession().selectOne("balanceQuery.cpsCount", balanceDto);
	}
	public int salesCount(BalanceDTOEx balanceDto) {
		return (Integer)getSqlSession().selectOne("balanceQuery.salesCount", balanceDto);
	}
}
