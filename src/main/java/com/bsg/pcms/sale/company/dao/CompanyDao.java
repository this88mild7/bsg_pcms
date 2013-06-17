package com.bsg.pcms.sale.company.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import com.bsg.pcms.dto.CompanyDTO;
import com.bsg.pcms.sale.company.dto.CompanyDTOEx;


@Component
public class CompanyDao extends SqlSessionDaoSupport {

	public Integer create( CompanyDTOEx saleCompany ) {
		return getSqlSession().insert( "saleCompanyQuery.createCompany", saleCompany );
	}
	
	public List<CompanyDTOEx> list(CompanyDTOEx saleCompany) {
		// 판매처 상세 정보 쿼리와 리스트 쿼리카 
		// 다이나믹 쿼리로 같이 사용 하기 때문에 
		// sale_company_mgmtno 를 0 으로 주어 list 를 조회 할 수 있도록
		if(saleCompany == null){
			saleCompany = new CompanyDTOEx();
		}
		saleCompany.setCompany_mgmtno(0);
		return getSqlSession().selectList( "saleCompanyQuery.companyList", saleCompany);
	}
	
	public CompanyDTOEx detail(CompanyDTOEx saleCompany) {
		return (CompanyDTOEx)getSqlSession().selectOne( "saleCompanyQuery.companyList", saleCompany );
	}
	

//	public List<CompanyDTO> getSaleCompantDeviceList(int sale_company_mgmtno) {
//		return getSqlSession().selectList( "saleCompanyQuery.getSaleCompantDeviceList", sale_company_mgmtno );
//	}
//	public int updateSaleCompany(CompanyDTOEx customer) {
//		return getSqlSession().update( "saleCompanyQuery.updateCustomer", customer);
//	}
//	
//	public Integer deleteCustomer( int customer_id ) {
//		return getSqlSession().delete( "saleCompanyQuery.deleteCustomer", customer_id );
//	}

	public void modify(CompanyDTOEx saleCompany) {
		getSqlSession().update( "saleCompanyQuery.modifyCompany", saleCompany);
	}
	
	public void delete(CompanyDTOEx saleCompany) {
		getSqlSession().update( "saleCompanyQuery.deleteCompany", saleCompany);
	}
}
