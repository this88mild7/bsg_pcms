package com.bsg.pcms.sale.company.svc;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bsg.pcms.dto.ContentDTO;
import com.bsg.pcms.dto.ContractDTO;
import com.bsg.pcms.dto.DeviceDTO;
import com.bsg.pcms.dto.InstallmentsDTO;
import com.bsg.pcms.sale.company.CompanyController;
import com.bsg.pcms.sale.company.dao.CompanyContractDao;
import com.bsg.pcms.sale.company.dto.CompanyContentsDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyContractDTOEx;
import com.bsg.pcms.sale.company.dto.DeviceDTOEx;

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
		List<CompanyContentsDTOEx> contentsList = _saleContractDao.contractContentsList(saleCompany.getContract_mgmtno());
		List<String> contractedDeviceList = _saleContractDao.contractedDeviceList(saleCompany.getContract_mgmtno());
		List<String> deviceList = _saleContractDao.deviceList();
		List<InstallmentsDTO> installmentList = _saleContractDao.installmentList(saleCompany.getContract_mgmtno());
		companyContractDTOEx.setDevice_cd_list(deviceList);
		companyContractDTOEx.setContractedDeviceList(contractedDeviceList);
		companyContractDTOEx.setContentsList(contentsList);
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


	/** 
	 * 1. 판매 Contents Group insert
	 * 2. 계약 상세 - 판매형태 insert
	 * 여러가지 판매 형태가 있을 수 있어서
	 * 테이블을 분리 했고 루프를 이용해서 insert 한다.
	 * 판매처에서 판매형태는 디바이스를 말한다.
	 * @param paramContractDTOEx
	 */
	

	public List<String> deviceList() {
		return _saleContractDao.deviceList();
	}

	public List<CompanyContractDTOEx> saleTypeList() {
		return _saleContractDao.saleTypeList();
	}
	
	private void createContractDetail(CompanyContractDTOEx paramContractDTOEx) {
		for(CompanyContentsDTOEx tmpContents : paramContractDTOEx.getContentsList()  ){
			CompanyContractDTOEx tmpContractDto = new CompanyContractDTOEx();
			tmpContractDto.setContract_mgmtno(paramContractDTOEx.getContract_mgmtno());
			tmpContractDto.setContents_cd(tmpContents.getContents_cd());
			_saleContractDao.createContentsGroup(tmpContractDto);
		}
		
		
		for(String saleType : paramContractDTOEx.getDevice_cd_list()){
			CompanyContractDTOEx tmpContractDto = new CompanyContractDTOEx();
			tmpContractDto.setContract_mgmtno(paramContractDTOEx.getContract_mgmtno());
			tmpContractDto.setSale_type(saleType);
			_saleContractDao.createContractDetail(tmpContractDto);
		}
		
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
	
}
