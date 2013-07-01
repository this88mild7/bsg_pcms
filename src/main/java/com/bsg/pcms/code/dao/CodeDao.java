package com.bsg.pcms.code.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.bsg.pcms.code.dto.CodeDTO;
import com.bsg.pcms.dto.ContentDTO;
import com.bsg.pcms.dto.ContractDTO;
import com.bsg.pcms.dto.DeviceDTO;
import com.bsg.pcms.dto.InstallmentsDTO;
import com.bsg.pcms.provision.content.ContentDTOEx;
import com.bsg.pcms.sale.company.CompanyContractController;
import com.bsg.pcms.sale.company.dto.CompanyContentsDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyContractDTOEx;
import com.bsg.pcms.sale.company.dto.DeviceDTOEx;

@Component
public class CodeDao extends SqlSessionDaoSupport {
	
	private Logger _logger = LoggerFactory.getLogger(getClass());
	
	public List<CodeDTO> deviceList() {
		return (List<CodeDTO>)getSqlSession().selectList( "codeQuery.deviceList");
	}

	public List<CodeDTO> saleTypeList() {
		return (List<CodeDTO>)getSqlSession().selectList( "codeQuery.saleTypeList");
	}

	public List<CodeDTO> licenseList() {
		return (List<CodeDTO>)getSqlSession().selectList( "codeQuery.licenseList");
	}

	public List<CodeDTO> contentTypeList() {
		return (List<CodeDTO>)getSqlSession().selectList( "codeQuery.contentTypeList");
	}

	public List<CodeDTO> contractTypeList() {
		return (List<CodeDTO>)getSqlSession().selectList( "codeQuery.contractTypeList");
	}
}
