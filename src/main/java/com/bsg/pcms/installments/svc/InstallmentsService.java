package com.bsg.pcms.installments.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsg.pcms.dto.InstallmentsDTO;
import com.bsg.pcms.installments.dao.InstallmentsDao;

@Service
public class InstallmentsService {
	
	@Autowired
	InstallmentsDao installmentsDao;
	
	/** contractMgmtno 목록을 가져온다. ORDER BY installments_dt DESC
	 * @param contractMgmtno
	 * @return
	 */
	public List<InstallmentsDTO> getInstallmentsList(int contractMgmtno) {
		return installmentsDao.getInstallmentsList(contractMgmtno);
	}


}
