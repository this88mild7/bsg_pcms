package com.bsg.pcms.balance.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.bsg.pcms.balance.dto.BalanceDTOEx;
import com.bsg.pcms.dto.BalanceDTO;
import com.bsg.pcms.dto.BalanceDetailDTO;

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

	public List<BalanceDTOEx> searchByDate(BalanceDTOEx balanceDtoEx) {
		return (List<BalanceDTOEx>)getSqlSession().selectList("balanceQuery.searchByDate", balanceDtoEx);
	}

	public List<BalanceDTOEx> searchByWord(BalanceDTOEx balanceDtoEx) {
		return (List<BalanceDTOEx>)getSqlSession().selectList("balanceQuery.searchByWord", balanceDtoEx);
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
	

	

	

}
