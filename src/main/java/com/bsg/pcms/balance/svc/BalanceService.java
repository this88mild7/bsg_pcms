package com.bsg.pcms.balance.svc;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsg.pcms.balance.BalanceComController;
import com.bsg.pcms.balance.dao.BalanceDao;
import com.bsg.pcms.balance.dto.BalanceDTOEx;
import com.bsg.pcms.dto.BalanceDTO;
import com.bsg.pcms.dto.BalanceDetailDTO;
import com.bsg.pcms.sale.company.dto.CompanyContractDTOEx;

@Service
public class BalanceService {
	
	@Autowired
	private BalanceDao balanceDao;
	
	private Logger logger = LoggerFactory.getLogger(BalanceComController.class);

	public BalanceDTOEx create(BalanceDTOEx balanceDto) {
		
		// 정산 마스터 insert
		balanceDao.create(balanceDto);
		
		// 정산 detail insert
		for(int x=0;x< balanceDto.getContentList().size();x++){
			BalanceDetailDTO detail = new BalanceDetailDTO();
			detail.setBalance_mgmtno(balanceDto.getBalance_mgmtno());
			detail.setContents_cd(balanceDto.getContentList().get(x));
			detail.setSale_count(balanceDto.getSaleCount().get(x));
			detail.setContentsCpProfit(balanceDto.getContentCpProfit().get(x));
			detail.setContentsSaleProfit(balanceDto.getContentSaleProfit().get(x));
			detail.setContentsSalePrice(balanceDto.getContentSalePrice().get(x));
			balanceDao.createDetail(detail);
		}
		
		
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
	public List<BalanceDTOEx> cpList(BalanceDTOEx balanceDto) {
		if(balanceDto == null){
			balanceDto = new BalanceDTOEx();
		}
		
		if(StringUtils.isBlank(balanceDto.getSortingType())){
			balanceDto.setSortingType("1");
		}
		return balanceDao.cpList(balanceDto);
	}
	public void delete(BalanceDTOEx balanceDto) {
		balanceDao.delete(balanceDto);
	}
	public List<BalanceDTOEx> saleList(BalanceDTOEx balanceDTOEx) {
		if(balanceDTOEx == null){
			balanceDTOEx = new BalanceDTOEx();
		}
		
		if(StringUtils.isBlank(balanceDTOEx.getSortingType())){
			balanceDTOEx.setSortingType("1");
		}
		
		return  balanceDao.saleList(balanceDTOEx);
	}
	public List<Map> saleCompanyList() {
		return balanceDao.saleCompanyList();
	}
	public List<Map> device(int company_mgmtno) {
		return balanceDao.device(company_mgmtno);
	}
	public List<Map> saleType(int company_mgmtno, String sale_type) {
		return balanceDao.saleType(company_mgmtno, sale_type);
	}
	public List<Map> contents(CompanyContractDTOEx companyContractDTOEx) {
		return balanceDao.contents(companyContractDTOEx);
	}
	
	public int cpsCount(BalanceDTOEx balanceDto) {
		return balanceDao.cpsCount(balanceDto);
	}
	public int salesCount(BalanceDTOEx balanceDto) {
		return balanceDao.salesCount(balanceDto);
	}

}
