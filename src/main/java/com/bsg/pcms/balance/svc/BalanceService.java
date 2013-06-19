package com.bsg.pcms.balance.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsg.pcms.balance.dao.BalanceDao;
import com.bsg.pcms.balance.dto.BalanceDTOEx;
import com.bsg.pcms.dto.BalanceDTO;

@Service
public class BalanceService {
	
	@Autowired
	private BalanceDao balanceDao;

	public BalanceDTOEx create(BalanceDTOEx balanceDto) {
		balanceDao.create(balanceDto);
		return balanceDto;
	}
	public void list(BalanceDTOEx balanceDto) {
		
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
	public BalanceDTOEx detail(BalanceDTOEx balanceDto) {
		return balanceDao.detail(balanceDto);
	}
	public List<BalanceDTOEx> list() {
		BalanceDTOEx balanceDto = new BalanceDTOEx();
		return balanceDao.list(balanceDto);
	}

}
