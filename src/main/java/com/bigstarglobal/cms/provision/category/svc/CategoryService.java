package com.bigstarglobal.cms.provision.category.svc;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.bigstarglobal.cms.dto.CateDTO;

@Service
public interface CategoryService {

	public int createCategory(CateDTO categoryDTO);

	public int getCategoryCount(CateDTO categoryDTO);

	public int deleteCategory(CateDTO categoryDTO) throws SQLException;

	public int updateCategory(CateDTO categoryDTO);

	public CateDTO getCategory(CateDTO categoryDTO);

	/** 카테고리 목록을 조회함.
	 * @return List<CateDTO>
	 */
	public List<CateDTO> getCategoryList();
	
	/** 카테고리 목록을 조회함.
	 * @param categoryDTO 에 parent_id 셋팅시 해당 카테고리만 조회한다.
	 * @return List<CateDTO>
	 */
	public List<CateDTO> getCategoryList(CateDTO categoryDTO);

}
