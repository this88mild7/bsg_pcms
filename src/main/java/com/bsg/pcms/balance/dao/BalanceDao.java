package com.bsg.pcms.balance.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.bsg.pcms.balance.dto.BalanceDTOEx;
import com.bsg.pcms.dto.BalanceDTO;

@Component
public class BalanceDao extends SqlSessionDaoSupport{

	public void create(BalanceDTOEx balanceDto) {
		getSqlSession().insert( "balanceQuery.createSaleCompany", balanceDto);
	}

	public List<BalanceDTOEx> list(BalanceDTOEx balanceDtoEx) {
		return (List<BalanceDTOEx>)getSqlSession().selectList("balanceQuery.list", balanceDtoEx);
	}

	public List<BalanceDTOEx> searchByDate(BalanceDTOEx balanceDtoEx) {
		return (List<BalanceDTOEx>)getSqlSession().selectList("balanceQuery.searchByDate", balanceDtoEx);
	}

	public List<BalanceDTOEx> searchByWord(BalanceDTOEx balanceDtoEx) {
		return (List<BalanceDTOEx>)getSqlSession().selectList("balanceQuery.searchByWord", balanceDtoEx);
	}

	public void modify(BalanceDTOEx balanceDto) {
		// TODO Auto-generated method stub
		
	}

}
