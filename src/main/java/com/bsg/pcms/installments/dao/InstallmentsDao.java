package com.bsg.pcms.installments.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import com.bsg.pcms.dto.InstallmentsDTO;

@Component
public class InstallmentsDao extends SqlSessionDaoSupport{
	
	/** INSTALLMENTS 테이블에 List<InstallmentsDTO> INSERT
	 * @param installmentsList
	 * @return
	 */
	public int createInstallments(List<InstallmentsDTO> installmentsList) {
		return getSqlSession().insert("installmentsQuery.createInstallments", installmentsList);
	}

	/** contractMgmtno 목록을 가져온다. ORDER BY installments_dt DESC
	 * @param contractMgmtno
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<InstallmentsDTO> getInstallmentsList(int contractMgmtno) {
		return (List<InstallmentsDTO>)getSqlSession().selectList("installmentsQuery.getInstallmentsList", contractMgmtno);
	}

	/** contractMgmtno 에 해당하는 데이터 전부 삭제
	 * @param contractMgmtno
	 * @return
	 */
	public int deleteInstallmentsAll(int contractMgmtno) {
		return getSqlSession().delete("installmentsQuery.deleteInstallmentsAll", contractMgmtno);
	}

}
