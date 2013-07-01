package com.bsg.pcms.code.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsg.pcms.code.dao.CodeDao;
import com.bsg.pcms.code.dto.CodeDTO;
import com.bsg.pcms.sale.company.dto.CompanyContractDTOEx;


@Service
public class CodeService {
	
	@Autowired
	private CodeDao _codeDao;
	
	
	public List<CodeDTO> deviceList() {
		return _codeDao.deviceList();
	}

	public List<CodeDTO> saleTypeList() {
		return _codeDao.saleTypeList();
	}
	
	public List<CodeDTO> licenseList() {
		return _codeDao.licenseList();
	}

	public List<CodeDTO> contentTypeList() {
		return _codeDao.contentTypeList();
	}

	public List<CodeDTO> contractTypeList() {
		return _codeDao.contractTypeList();
	}

}
