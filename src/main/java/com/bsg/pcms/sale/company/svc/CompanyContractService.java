package com.bsg.pcms.sale.company.svc;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bsg.pcms.dto.InstallmentsDTO;
import com.bsg.pcms.provision.content.ContentDTOEx;
import com.bsg.pcms.sale.company.CompanyController;
import com.bsg.pcms.sale.company.dao.CompanyContractDao;
import com.bsg.pcms.sale.company.dto.CompanyContentsDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyContractDTOEx;

@Service
public class CompanyContractService {

	private Logger logger = LoggerFactory.getLogger(CompanyController.class);
	
	@Autowired
	private CompanyContractDao _saleContractDao;
	
	
	public List<CompanyContractDTOEx> list() {
		return list(null);      
	}
	
	public List<CompanyContractDTOEx> list(CompanyContractDTOEx saleCompany) {
		List<CompanyContractDTOEx> contractList  = _saleContractDao.contractList(saleCompany);
		for(CompanyContractDTOEx cDTO : contractList){
			List<CompanyContentsDTOEx> contentsList = _saleContractDao.contractContentsList(cDTO.getContract_mgmtno());
			cDTO.setContentsList(contentsList);
		}
		return contractList;      
	}
	
	
	

	public CompanyContractDTOEx detail(CompanyContractDTOEx saleCompany) {
		CompanyContractDTOEx companyContractDTOEx = _saleContractDao.contractDetail(saleCompany);
//		List<String> contractedDeviceList = _saleContractDao.contractedDeviceList(saleCompany.getContract_mgmtno());
//		companyContractDTOEx.setContractedDeviceList(contractedDeviceList);
		
		List<CompanyContentsDTOEx> contentsList = _saleContractDao.contractContentsList(saleCompany.getContract_mgmtno());
		companyContractDTOEx.setContentsList(contentsList);
		List<InstallmentsDTO> installmentList = _saleContractDao.installmentList(saleCompany.getContract_mgmtno());
		companyContractDTOEx.setInstallmentList(installmentList);
		
		return companyContractDTOEx;
	}
	
	
	public List<CompanyContractDTOEx> create(CompanyContractDTOEx paramContractDTOEx, 
			List<String> paramContentsList){
		
		List<CompanyContentsDTOEx> contentsList = generateContentList(paramContentsList);
		
		paramContractDTOEx.setContentsList(contentsList);
		
		return create(paramContractDTOEx);
	}
	
	public void delete(List<String> deleteContractList) {
		for(String contractMgmtno : deleteContractList){
			_saleContractDao.delete(contractMgmtno);
		}
		
	}

	public void modify(CompanyContractDTOEx companyDTO) {
		modifyContract(companyDTO);
	}
	public void modify(CompanyContractDTOEx companyDTO, List<String> paramContentsList) {
		List<CompanyContentsDTOEx> contentsList = generateContentList(paramContentsList);
		companyDTO.setContentsList(contentsList);
		modifyContract(companyDTO);
	}

	
	@Transactional( propagation = Propagation.REQUIRED,
			isolation = Isolation.SERIALIZABLE,
			readOnly = false,
			rollbackFor = { SQLException.class } )
	public List<CompanyContractDTOEx> create(
			CompanyContractDTOEx paramContractDTOEx) {
		try {
			
			// 계약 마스터 insert
			_saleContractDao.create(paramContractDTOEx);
			
			// 계약 상세
			createContractDetail(paramContractDTOEx);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("ContractCreate Exception : {}", e.getMessage());
		}
		
		return null;
	}


	
	
	private void createContractDetail(CompanyContractDTOEx paramContractDTOEx) {
		
		// Map list insert호 개선 필요
		List<String> selectedContentsCd = paramContractDTOEx.getSelectedContentsCd();
//		List<String> selectedContentsPrice = paramContractDTOEx.getSelectedContentsPrice();
//		List<String> selectedContentsCurrency = paramContractDTOEx.getSelectedContentsCurrency();
		for(int x=0;x<selectedContentsCd.size();x++){
			Map<String, Object> contentGroupParam = new HashMap<String, Object>();
			contentGroupParam.put("contract_mgmtno", paramContractDTOEx.getContract_mgmtno());
			contentGroupParam.put("contents_cd", selectedContentsCd.get(x));
//			contentGroupParam.put("sale_price", selectedContentsPrice.get(x));
//			contentGroupParam.put("currency", selectedContentsCurrency.get(x));
			_saleContractDao.createContentsGroup(contentGroupParam);
		}
		
//		for(String saleType : paramContractDTOEx.getDevice_cd_list()){
//			CompanyContractDTOEx tmpContractDto = new CompanyContractDTOEx();
//			tmpContractDto.setContract_mgmtno(paramContractDTOEx.getContract_mgmtno());
//			tmpContractDto.setSale_type(saleType);
//			_saleContractDao.createContractDetail(tmpContractDto);
//		}
		
		for(int x=0;x<paramContractDTOEx.getInstallments_dt().size();x++){
			InstallmentsDTO installnetsDTO = new InstallmentsDTO();
			installnetsDTO.setContract_mgmtno(paramContractDTOEx.getContract_mgmtno());
			installnetsDTO.setInstallments_dt(paramContractDTOEx.getInstallments_dt().get(x));
			installnetsDTO.setInstallments_price(paramContractDTOEx.getInstallments_price().get(x));
			_saleContractDao.createContractInstallments(installnetsDTO);
		}

	}
	
	private void modifyContract(CompanyContractDTOEx companyDTO) {
		_saleContractDao.deleteContractDetail(companyDTO.getContract_mgmtno());
		_saleContractDao.deleteContractContentsGroup(companyDTO.getContract_mgmtno());
		_saleContractDao.deleteInstallment(companyDTO.getContract_mgmtno());
		_saleContractDao.modify(companyDTO);
		createContractDetail(companyDTO);
	}

	private List<CompanyContentsDTOEx> generateContentList(
			List<String> paramContentsList) {
		List<CompanyContentsDTOEx> contentsList = new ArrayList<CompanyContentsDTOEx>();
		
		for(String contentsCd : paramContentsList){
			CompanyContentsDTOEx temp = new CompanyContentsDTOEx();
			temp.setContents_cd(contentsCd);
			contentsList.add(temp);
		}
		return contentsList;
	}

	public List<CompanyContractDTOEx> search(CompanyContractDTOEx companyDTO) {
		return list(companyDTO); 
	}

	public List<ContentDTOEx> contents(CompanyContractDTOEx saleCompany) {
		return _saleContractDao.contents(saleCompany);
	}
	
}
