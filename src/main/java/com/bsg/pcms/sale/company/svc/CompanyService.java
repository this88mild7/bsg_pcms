package com.bsg.pcms.sale.company.svc;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsg.pcms.dto.CompanyDTO;
import com.bsg.pcms.sale.company.dao.CompanyDao;
import com.bsg.pcms.sale.company.dto.CompanyContractDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyDTOEx;

@Service
public class CompanyService {

	private Logger _logger = LoggerFactory.getLogger(CompanyService.class);
	
	@Autowired
	private CompanyDao _saleCompanyDao;
	
	public void create( CompanyDTOEx compDto ){
		
		// 마스터 테이블 insert
		_saleCompanyDao.create( compDto );
		
		// 업체 관리자 테이블 insert
		_saleCompanyDao.createCompanyAdministor(compDto);
	}
	
	public int totalCount(CompanyDTOEx saleCompanyDto){
		return _saleCompanyDao.totalCount(saleCompanyDto);
	}
	
	public List<CompanyDTOEx> list(CompanyDTOEx saleCompanyDto) {
		if(saleCompanyDto == null){
			saleCompanyDto = new CompanyDTOEx();
		}
		saleCompanyDto.setStartRownum((saleCompanyDto.getPageNum() - 1) * saleCompanyDto.getPerPage());
		return _saleCompanyDao.list(saleCompanyDto);      
	}
	
	public CompanyDTOEx detail(CompanyDTOEx saleCompany) {
		return _saleCompanyDao.detail(saleCompany);
	}
	
	public void modify(CompanyDTOEx saleCompany) {
		_saleCompanyDao.modify(saleCompany);
		
		// 업체 관리자 테이블 update
		_saleCompanyDao.modifyCompanyAdministor(saleCompany);
	}

	public List<CompanyDTOEx> getSaleCompanyList() {
		return _saleCompanyDao.list(null);
	}


	public void delete(CompanyDTOEx saleCompany) {
		for(String delMgmtno : saleCompany.getDeleteCompany()){
			saleCompany.setCompany_mgmtno(Integer.parseInt(delMgmtno));
			_saleCompanyDao.delete(saleCompany);
		}
	}
}
