package com.bsg.pcms.provision.contract.svc;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bsg.pcms.dto.CompanyDTO;
import com.bsg.pcms.dto.ContractContentsGroupDTO;
import com.bsg.pcms.dto.ContractDetailDTO;
import com.bsg.pcms.provision.contract.ContractDTOEx;
import com.bsg.pcms.provision.contract.ContractDao;
import com.bsg.pcms.provision.cp.CpService;

@Service
public class ContractServiceImpl implements ContractService {

	private Logger logger = LoggerFactory.getLogger(ContractServiceImpl.class);
	private final String Y = "Y"; 
	
	@Autowired
	private ContractDao contractDao;
	
	@Autowired
	private CpService cpService;

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.SERIALIZABLE, readOnly = false, rollbackFor = { SQLException.class })
	public int createContract(ContractDTOEx cde) throws SQLException {

		
		int result = 0;
		{ //CONTRACT
			result = contractDao.createContract(cde); 
		}
		//계약 생성 후 계약관리번호 생김.
		int contractMgmtno = cde.getContract_mgmtno();
		
		{ //CP은행정보 업데이트
			CompanyDTO bankDTO = new CompanyDTO();
			bankDTO.setCompany_mgmtno(cde.getCompany_mgmtno());
			bankDTO.setDeposit_bank(cde.getDeposit_bank());
			bankDTO.setAccount_no(cde.getAccount_no());
			bankDTO.setAccount_holder(cde.getAccount_holder());
			int bankUpdateResult = cpService.updateBank(bankDTO);
			logger.debug("bankUpdateResult " + bankUpdateResult);
		}
		
		{ //CONTRACT_CONTENTS_GROUP
			logger.info("ctd.getContract_mgmtno() {}", contractMgmtno);
			List<ContractContentsGroupDTO> contentList = new ArrayList<ContractContentsGroupDTO>();
			ContractContentsGroupDTO param = new ContractContentsGroupDTO();
			param.setSeries_mgmtno(cde.getSeries_mgmtno());
			param.setCate_id(cde.getCate_id());
			param.setContract_mgmtno(contractMgmtno);
			param.setContents_cd(String.valueOf(cde.getSeries_mgmtno()));
			contentList.add(param);
			int contentsGroupResult = contractDao.createContractContentsGroup(contentList);
			logger.debug("contentsGroupResult " + contentsGroupResult);
		}
		
		{
			List<ContractDetailDTO> detailList = new ArrayList<ContractDetailDTO>();
			//TODO saleType 코드화 한다면 수정필요
			for(String saleType : getContractTypeList(cde)) {
				ContractDetailDTO detailObj = new ContractDetailDTO();
				detailObj.setContract_mgmtno(contractMgmtno);
				detailObj.setSale_type(saleType);
				detailList.add(detailObj);
			}
			int detailResult = contractDao.createContractDetail(detailList);
			logger.debug("detailResult " + detailResult);
		}
		
		return result;
	}
	
	public int getContractListCount(ContractDTOEx contractDTOEx) {
		return contractDao.getContractListCount(contractDTOEx);
	}

	public List<ContractDTOEx> getContractList() {
		return this.getContractList(new ContractDTOEx());
	}

	public List<ContractDTOEx> getContractList(ContractDTOEx contractDTOEx) {
		return contractDao.getContractList(contractDTOEx);
	}
	
	public List<ContractDetailDTO> getContractDetailList(ContractDTOEx contractDTOEx) {
		return contractDao.getContractDetailList(contractDTOEx);
	}
	
	public List<ContractContentsGroupDTO> getContractContentsGroupList(ContractDTOEx contractDTOEx) {
		return contractDao.getContractContentsGroupList(contractDTOEx);
	}

	public ContractDTOEx getContract(ContractDTOEx contractDTOEx) {
		return contractDao.getContract(contractDTOEx);
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.SERIALIZABLE, readOnly = false, rollbackFor = { SQLException.class })
	public int deleteContract(ContractDTOEx cde) throws SQLException {
		String[] contractList = cde.getStrList().split(",");
		List<String> list = Arrays.asList(contractList);

		int result = 0;
		for (String contractMgmtno : list) {
			cde.setContract_mgmtno(Integer.valueOf(contractMgmtno));
			result = contractDao.deleteContract(cde);
		}
		return result;
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.SERIALIZABLE, readOnly = false, rollbackFor = { SQLException.class })
	public int updateContract(ContractDTOEx cde) throws SQLException {
		
		int result = 0;
		int contractMgmtno = cde.getContract_mgmtno();
		{ //CONTRACT
			result = contractDao.updateContract(cde);
		}
		
		{ //CP은행정보 업데이트
			CompanyDTO bankDTO = new CompanyDTO();
			bankDTO.setCompany_mgmtno(cde.getCompany_mgmtno());
			bankDTO.setDeposit_bank(cde.getDeposit_bank());
			bankDTO.setAccount_no(cde.getAccount_no());
			bankDTO.setAccount_holder(cde.getAccount_holder());
			int bankUpdateResult = cpService.updateBank(bankDTO);
			logger.debug("bankUpdateResult " + bankUpdateResult);
		}

		{ //CONTRACT_CONTENTS_GROUP
			List<ContractContentsGroupDTO> contentList = new ArrayList<ContractContentsGroupDTO>();
			ContractContentsGroupDTO param = new ContractContentsGroupDTO();
			param.setSeries_mgmtno(cde.getSeries_mgmtno());
			param.setCate_id(cde.getCate_id());
			param.setContract_mgmtno(contractMgmtno);
			param.setContents_cd(String.valueOf(cde.getSeries_mgmtno()));
			contentList.add(param);
			//컨텐츠 그룹테이블 삭제 후 재 생성
			int contentsDeletedCnt = contractDao.deleteContractContentsGroup(contractMgmtno);
			int contentsCreatedCnt = contractDao.createContractContentsGroup(contentList);
			logger.debug("contentsDeletedCnt " + contentsDeletedCnt);
			logger.debug("contentsCreatedCnt " + contentsCreatedCnt);
		}
		
		{ //CONTRACT_DETAIL
			List<ContractDetailDTO> detailList = new ArrayList<ContractDetailDTO>();
			//TODO saleType 코드화 한다면 수정필요
			for(String saleType : getContractTypeList(cde)) {
				ContractDetailDTO detailObj = new ContractDetailDTO();
				detailObj.setContract_mgmtno(cde.getContract_mgmtno());
				detailObj.setSale_type(saleType);
				detailList.add(detailObj);
			}
			int detailDeletedCnt = contractDao.deleteContractDetail(contractMgmtno);
			int detailCreatedCnt = contractDao.createContractDetail(detailList);
			logger.debug("detailDeletedCnt " + detailDeletedCnt);
			logger.debug("detailCreatedCnt " + detailCreatedCnt);
		}
		
		return result;
	}

	private List<String> getContractTypeList(ContractDTOEx cde) {
		// 계약타입 (이북,그림책,동영상,게임,기타)
		List<String> contractTypeList = new ArrayList<String>();
		if (Y.equals(cde.getIsPicturebook())) {
			contractTypeList.add("pb");
		}
		if (Y.equals(cde.getIsEbook())) {
			contractTypeList.add("ebook");
		}
		if (Y.equals(cde.getIs2d())) {
			contractTypeList.add("2d");
		}
		if (Y.equals(cde.getIs3d())) {
			contractTypeList.add("3d");
		}
		if (Y.equals(cde.getIsGame())) {
			contractTypeList.add("game");
		}
		return contractTypeList;
	}

}
