package com.bigstarglobal.cms.provision.category.svc;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bigstarglobal.cms.dto.CateDTO;
import com.bigstarglobal.cms.provision.category.CategoryDao;

@Service
public class CategoryServiceImpl implements CategoryService{

	private Logger logger = LoggerFactory.getLogger(CategoryServiceImpl.class);
	
	@Autowired
	private CategoryDao categoryDao;

	public int createCategory(CateDTO categoryDTO) {
		return categoryDao.createCategory(categoryDTO);
	}

	public int getCategoryCount(CateDTO categoryDTO) {
		return categoryDao.getCategoryCount(categoryDTO);
	}

	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.SERIALIZABLE, readOnly = false, rollbackFor = { SQLException.class })
	public int deleteCategory(CateDTO categoryDTO) throws SQLException {
		String[] categoryList = categoryDTO.getStrList().split(",");
		List<String> list = Arrays.asList(categoryList);

		int result = 0;
		for (String category_id : list) {
			categoryDTO.setCate_id(Integer.valueOf(category_id));
			result = categoryDao.deleteCategory(categoryDTO);
		}
		return result;
	}

	public int updateCategory(CateDTO categoryDTO) {
		return categoryDao.updateCategory(categoryDTO);
	}

	public CateDTO getCategory(CateDTO categoryDTO) {
		return categoryDao.getCategory(categoryDTO);
	}

	public List<CateDTO> getCategoryList() {
		return categoryDao.getCategoryList(new CateDTO());
	}
	
	public List<CateDTO> getCategoryList(CateDTO categoryDTO) {
		return categoryDao.getCategoryList(categoryDTO);
	}

}
