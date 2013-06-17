package com.bsg.pcms.provision.cp;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import com.bsg.pcms.dto.CompanyDTO;

@Component
public class CpDao extends SqlSessionDaoSupport {

	public Integer createCp(CompanyDTO companyDTO) {
		return getSqlSession().insert("cpQuery.createCp", companyDTO);
	}

	public Integer deleteCp(CompanyDTO companyDTO) {
		// 이름은 deleteCp이지만 del_yn컬럼을 'N' => 'Y' 업데이트
		return getSqlSession().update("cpQuery.deleteCp", companyDTO);
	}

	public List<CompanyDTO> getCpList(CompanyDTO companyDTODTO) {

		return getSqlSession().selectList("cpQuery.getCpList", companyDTODTO);
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
