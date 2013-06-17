package com.bigstarglobal.cms.sale.company.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import com.bigstarglobal.cms.dto.ContentDTO;
import com.bigstarglobal.cms.dto.ContractDTO;
import com.bigstarglobal.cms.dto.DeviceDTO;
import com.bigstarglobal.cms.sale.company.dto.CompanyContentsDTOEx;
import com.bigstarglobal.cms.sale.company.dto.CompanyContractDTOEx;
import com.bigstarglobal.cms.sale.company.dto.DeviceDTOEx;

@Component
public class CompanyContractDao extends SqlSessionDaoSupport {
	
	public List<CompanyContractDTOEx> contractList(CompanyContractDTOEx contractDTO) {
		return (List<CompanyContractDTOEx>)getSqlSession().selectList( "saleCompanyQuery.contractList", contractDTO);
	}

	public List<CompanyContentsDTOEx> contractContentsList(
			int contract_mgmtno) {
		return (List<CompanyContentsDTOEx>)getSqlSession().selectList( "saleCompanyQuery.contractContensList", contract_mgmtno);
	}

	public CompanyContractDTOEx contractDetail(CompanyContractDTOEx saleCompany) {
		return (CompanyContractDTOEx)getSqlSession().selectOne( "saleCompanyQuery.contractDetail", saleCompany);
	}

	public int create(CompanyContractDTOEx contractDTOEx) {
		return getSqlSession().insert( "saleCompanyQuery.createContract", contractDTOEx );
	}

	public void createContentsGroup(CompanyContractDTOEx paramContractDTOEx) {
		getSqlSession().insert( "saleCompanyQuery.createContentsGroup", paramContractDTOEx );
	}

	public void createContractDetail(CompanyContractDTOEx paramContractDTOEx) {
		getSqlSession().insert( "saleCompanyQuery.createContractDetail", paramContractDTOEx );
	}

	public List<String> deviceList() {
		return (List<String>)getSqlSession().selectList( "saleCompanyQuery.deviceList");
	}

	public List<CompanyContractDTOEx> saleTypeList() {
		return (List<CompanyContractDTOEx>)getSqlSession().selectList( "saleCompanyQuery.saleTypeList");
	}

	public void delete(String deleteContractList) {
		getSqlSession().update( "saleCompanyQuery.deleteContract", deleteContractList);
	}

	public List<String> contractedDeviceList(int contract_mgmtno) {
		return (List<String>)getSqlSession().selectList( "saleCompanyQuery.contractedDeviceList", contract_mgmtno);
	}

	public void deleteContractDetail(int contract_mgmtno) {
		getSqlSession().delete( "saleCompanyQuery.deleteContractDetail", contract_mgmtno);
		
	}

	public void deleteContractContentsGroup(int contract_mgmtno) {
		getSqlSession().delete( "saleCompanyQuery.deleteContractContentsGroup", contract_mgmtno);
		
	}

	public void modify(CompanyContractDTOEx companyDTO) {
		getSqlSession().delete( "saleCompanyQuery.modifyContract", companyDTO);
		
	}


//	public int updateContract(ContractDTO contract) {
//		return getSqlSession().insert( "saleCompanyQuery.updateContract", contract );
//	}
//
//	public void createContractDetail(ContractDTO contract) {
//		getSqlSession().insert( "saleCompanyQuery.createContractDetail", contract );
//	}

	
}
