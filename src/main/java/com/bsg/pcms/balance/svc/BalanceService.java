package com.bsg.pcms.balance.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsg.pcms.balance.dao.BalanceDao;
import com.bsg.pcms.dto.BalanceDTO;

@Service
public class BalanceService {
	
	@Autowired
	private BalanceDao balanceDao;

	public void createSaleCompany(BalanceDTO balanceDto) {
		balanceDao.createSaleCompany(balanceDto);
	}

}
