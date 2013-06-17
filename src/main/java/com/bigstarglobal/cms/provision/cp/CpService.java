package com.bigstarglobal.cms.provision.cp;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bigstarglobal.cms.dto.CompanyDTO;

@Service
public class CpService {

	@Autowired
	private CpDao cpDao;

	public int createCp(CompanyDTO companyDTO) {
		return cpDao.createCp(companyDTO);
	}

	public int getCpCount(CompanyDTO companyDTO) {
		return cpDao.getCpCount(companyDTO);
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.SERIALIZABLE, readOnly = false, rollbackFor = { SQLException.class })
	public int deleteCp(CompanyDTO companyDTO) throws SQLException {
		String[] companyDTOList = companyDTO.getStrList().split(",");
		List<String> list = Arrays.asList(companyDTOList);

		int result = 0;
		for (String companyDTO_id : list) {
			companyDTO.setCompany_mgmtno(Integer.valueOf(companyDTO_id));
			result = cpDao.deleteCp(companyDTO);
		}
		return result;
	}

	public int updateCp(CompanyDTO companyDTO) {
		return cpDao.updateCp(companyDTO);
	}
	
	public int updateBank(CompanyDTO companyDTO) {
		return cpDao.updateBank(companyDTO);
	}

	public CompanyDTO getCp(CompanyDTO companyDTO) {
		return cpDao.getCp(companyDTO);
	}

	public List<CompanyDTO> getCpList() {
		return this.getCpList(new CompanyDTO());
	}
	
	/** CP업체 전체 목록을 가져온다.
	 * @return List<CompanyDTO>
	 */
	public List<CompanyDTO> getCpListAll() {
		CompanyDTO cd = new CompanyDTO();
		cd.setPageNum(0); //0을 주면 NO LIMIT 
		return this.getCpList(cd);
	}

	public List<CompanyDTO> getCpList(CompanyDTO companyDTODTO) {
		return cpDao.getCpList(companyDTODTO);
	}

}
