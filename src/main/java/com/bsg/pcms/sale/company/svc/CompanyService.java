package com.bsg.pcms.sale.company.svc;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsg.pcms.dto.CompanyDTO;
import com.bsg.pcms.sale.company.dao.CompanyDao;
import com.bsg.pcms.sale.company.dto.CompanyDTOEx;

@Service
public class CompanyService {

	private Logger _logger = LoggerFactory.getLogger(CompanyService.class);
	
	@Autowired
	private CompanyDao _saleCompanyDao;
	
	public int create( CompanyDTOEx compDto ){
		return _saleCompanyDao.create( compDto );
	}
	
	public List<CompanyDTOEx> list() {
		return _saleCompanyDao.list(null);      
	}
	
	public List<CompanyDTOEx> searchlist(CompanyDTOEx saleCompanyDto) {
		return _saleCompanyDao.list(saleCompanyDto);      
	}
	
	public CompanyDTOEx detail(CompanyDTOEx saleCompany) {
		return _saleCompanyDao.detail(saleCompany);
	}
	
	public void modify(CompanyDTOEx saleCompany) {
		_saleCompanyDao.modify(saleCompany);
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

	public List<CompanyDTOEx> search(CompanyDTOEx saleCompany) {
		return _saleCompanyDao.list(saleCompany);  
	}

	
}
