package com.bsg.pcms.provision.contract;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import com.bsg.pcms.dto.ContractContentsGroupDTO;
import com.bsg.pcms.dto.ContractDTO;
import com.bsg.pcms.dto.ContractDetailDTO;

@Component
public class ContractDao extends SqlSessionDaoSupport {


	public ContractDTOEx getContract(ContractDTOEx contractDTOEx) {
		return (ContractDTOEx) getSqlSession().selectOne("contractQuery.getContract", contractDTOEx);
	}

	public List<ContractDTOEx> getContractList(ContractDTOEx contractDTOEx) {
		return (List<ContractDTOEx>) getSqlSession().selectList("contractQuery.getContractList", contractDTOEx);
	}
	
	public int getContractListCount(ContractDTOEx contractDTOEx) {
		return (Integer) getSqlSession().selectOne("contractQuery.getContractListCount", contractDTOEx);
	}
	
	public List<ContractDetailDTO> getContractDetailList(ContractDTOEx contractDTOEx) {
		return (List<ContractDetailDTO>) getSqlSession().selectList("contractQuery.getContractDetailList", contractDTOEx);
	}
	
	public List<ContractContentsGroupDTO> getContractContentsGroupList(ContractDTOEx contractDTOEx) {
		return (List<ContractContentsGroupDTO>) getSqlSession().selectList("contractQuery.getContractContentsGroupList", contractDTOEx);
	}

	public int createContract(ContractDTOEx contractDTOEx) {
		return getSqlSession().insert("contractQuery.createContract", contractDTOEx);
	}
	
	public int createContractContentsGroup(List<ContractContentsGroupDTO> ccgList) {
		return getSqlSession().insert("contractQuery.createContractContentsGroup", ccgList);
	}
	
	public int createContractDetail(List<ContractDetailDTO> cdList) {
		return getSqlSession().insert("contractQuery.createContractDetail", cdList);
	}
	
	public int deleteContractDetail(int contractMgmtno) {
		return getSqlSession().delete("contractQuery.deleteContractDetail", contractMgmtno);
	}
	
	public int deleteContractContentsGroup(int contractMgmtno) {
		return getSqlSession().delete("contractQuery.deleteContractContentsGroup", contractMgmtno);
	}
	
	public int deleteContract(ContractDTO contract) {
		return getSqlSession().update("contractQuery.deleteContract", contract);
	}

	public int updateContract(ContractDTO contract) {
		return getSqlSession().update("contractQuery.updateContract", contract);
	}


}
