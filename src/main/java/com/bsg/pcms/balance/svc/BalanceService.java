package com.bsg.pcms.balance.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsg.pcms.balance.dao.BalanceDao;
import com.bsg.pcms.balance.dto.BalanceDTOEx;
import com.bsg.pcms.dto.BalanceDTO;

@Service
public class BalanceService {
	
	@Autowired
	private BalanceDao balanceDao;

	public void create(BalanceDTOEx balanceDto) {
		balanceDao.create(balanceDto);
	}
	public void list(BalanceDTOEx balanceDto) {
		balanceDao.list(balanceDto);
	}
	public void modify(BalanceDTOEx balanceDto) {
		balanceDao.modify(balanceDto);
	}
	public void searchByDate(BalanceDTOEx balanceDto) {
		balanceDao.create(balanceDto);
	}
	
	public void searchByWord(BalanceDTOEx balanceDto) {
		balanceDao.create(balanceDto);
	}

}
