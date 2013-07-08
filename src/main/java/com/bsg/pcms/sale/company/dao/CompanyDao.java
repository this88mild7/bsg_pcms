package com.bsg.pcms.sale.company.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import com.bsg.pcms.dto.CompanyDTO;
import com.bsg.pcms.sale.company.dto.CompanyContractDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyDTOEx;


@Component
public class CompanyDao extends SqlSessionDaoSupport {

	public void create( CompanyDTOEx saleCompany ) {
		getSqlSession().insert( "saleCompanyQuery.createCompany", saleCompany );
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
	
	public List<CompanyContractDTOEx> salProductList() {
		return (List<CompanyContractDTOEx>)getSqlSession().selectList( "saleCompanyQuery.salProductList");
	}
	
	
	
	public CompanyDTOEx detail(CompanyDTOEx saleCompany) {
		return (CompanyDTOEx)getSqlSession().selectOne( "saleCompanyQuery.companyDetail", saleCompany );
	}
	
	public void modify(CompanyDTOEx saleCompany) {
		getSqlSession().update( "saleCompanyQuery.modifyCompany", saleCompany);
	}
	
	public void delete(CompanyDTOEx saleCompany) {
		getSqlSession().update( "saleCompanyQuery.deleteCompany", saleCompany);
	}

	public void createCompanyAdministor(CompanyDTOEx compDto) {
		getSqlSession().insert("saleCompanyQuery.createCompanyAdministor", compDto);
		
	}
	
	public void modifyCompanyAdministor(CompanyDTOEx saleCompany) {
		getSqlSession().update( "saleCompanyQuery.modifyCompanyAdministor", saleCompany);
	}

	public int totalCount(CompanyDTOEx saleCompany) {
		return (Integer)getSqlSession().selectOne("saleCompanyQuery.companyTotalCount", saleCompany);
	}

	
}
