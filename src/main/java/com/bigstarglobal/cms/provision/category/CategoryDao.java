package com.bigstarglobal.cms.provision.category;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import com.bigstarglobal.cms.dto.CateDTO;

@Component
public class CategoryDao extends SqlSessionDaoSupport{
	
	public int createCategory(CateDTO categoryDTO) {
		return getSqlSession().insert("categoryQuery.createCategory", categoryDTO);
	}
	
	public int updateCategory(CateDTO categoryDTO) {
		return getSqlSession().update("categoryQuery.updateCategory", categoryDTO);
	}
	
	public int deleteCategory(CateDTO categoryDTO) {
		return getSqlSession().delete("categoryQuery.deleteCategory", categoryDTO);
	}

	public CateDTO getCategory(CateDTO categoryDTO) {
		return (CateDTO)getSqlSession().selectOne("categoryQuery.getCategory", categoryDTO); 
	}
	
	public List<CateDTO> getCategoryList(CateDTO categoryDTO) {
		return getSqlSession().selectList("categoryQuery.getCategoryList", categoryDTO);
	}
	
	public int getCategoryCount(CateDTO categoryDTO) {
		return (Integer) getSqlSession().selectOne("categoryQuery.getCategoryCount", categoryDTO);
	}
	
}
