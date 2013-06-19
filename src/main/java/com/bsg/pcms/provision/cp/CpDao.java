package com.bsg.pcms.provision.cp;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import com.bsg.pcms.dto.CompanyDTO;

@Component
public class CpDao extends SqlSessionDaoSupport {

	/** 업체 생성
	 * @param companyDTO
	 * @return
	 */
	public Integer createCp(CompanyDTO companyDTO) {
		return getSqlSession().insert("cpQuery.createCp", companyDTO);
	}
	
	/** 업체 담당PD 생성
	 * @param companyAdminDTO
	 * @return
	 */
	public Integer createPd(List<Map<String, String>> pdList) {
		return getSqlSession().insert("cpQuery.createPd", pdList);
	}

	/** 업체 COMPANY.del_yn 컬럼을 'Y' 로 변경
	 * @param companyDTO
	 * @return
	 */
	public Integer deleteCp(CompanyDTO companyDTO) {
		return getSqlSession().update("cpQuery.deleteCp", companyDTO);
	}
	
	/** 담당PD 전체 삭제
	 * @param companyDTO
	 * @return
	 */
	public Integer deletePdAll(int companyMgmtno) {
		return getSqlSession().delete("cpQuery.deletePdAll", companyMgmtno);
	}

	/** 업체 목록 가져오기
	 * @param companyDTODTO
	 * @return
	 */
	public List<CompanyDTO> getCpList(CompanyDTO companyDTODTO) {
		return getSqlSession().selectList("cpQuery.getCpList", companyDTODTO);
	}
	
	/** 담당PD 목록 가져오기
	 * @param companyMgmtno
	 * @return
	 */
	public List<CpDTOEx> getPdList(int companyMgmtno) {
		return getSqlSession().selectList("cpQuery.getPdList", companyMgmtno);
	}

	public int getCpCount(CompanyDTO companyDTO) {
		return (Integer) getSqlSession().selectOne("cpQuery.getCpCount", companyDTO);
	}

	public CompanyDTO getCp(CompanyDTO companyDTO) {

		return (CompanyDTO) getSqlSession().selectOne("cpQuery.getCp", companyDTO);
	}

	public int updateCp(CompanyDTO companyDTO) {
		return getSqlSession().update("cpQuery.updateCp", companyDTO);
	}
	
	public int updateBank(CompanyDTO companyDTO) {
		return getSqlSession().update("cpQuery.updateBank", companyDTO);
	}

}
