package com.bsg.pcms.provision.contract.svc;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bsg.pcms.dto.ContractContentsGroupDTO;
import com.bsg.pcms.dto.ContractDetailDTO;
import com.bsg.pcms.provision.contract.ContractDTOEx;

@Service
public interface ContractService {

	public ContractDTOEx getContract(ContractDTOEx contractDTOEx);

	public List<ContractDTOEx> getContractList();
	
	public List<ContractDTOEx> getContractList(ContractDTOEx contractDTOEx);
	
	public int getContractListCount(ContractDTOEx contractDTOEx);

	public List<ContractDetailDTO> getContractDetailList(ContractDTOEx contractDTOEx);
	
	public List<ContractContentsGroupDTO> getContractContentsGroupList(ContractDTOEx contractDTOEx);

	public int createContract(ContractDTOEx contractDTOEx) throws SQLException;

	public int updateContract(ContractDTOEx contractDTOEx) throws SQLException;

	public int deleteContract(ContractDTOEx contractDTOEx) throws SQLException;
	
}
