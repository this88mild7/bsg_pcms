package com.bsg.pcms.balance.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.bsg.pcms.dto.BalanceDTO;

@Component
public class BalanceDao extends SqlSessionDaoSupport{

	public void createSaleCompany(BalanceDTO balanceDto) {
		getSqlSession().insert( "balanceQuery.createSaleCompany", balanceDto);
	}

}
