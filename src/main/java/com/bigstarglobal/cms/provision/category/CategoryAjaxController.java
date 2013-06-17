package com.bigstarglobal.cms.provision.category;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bigstarglobal.cms.dto.CateDTO;
import com.bigstarglobal.cms.provision.category.svc.CategoryService;
import com.bigstarglobal.cms.utility.BigstarConstant;
import com.bigstarglobal.cms.utility.BigstarProperties;
import com.bigstarglobal.cms.utility.JsonResponseMaker;

@Controller
@RequestMapping(value = "category")
public class CategoryAjaxController {

	private Logger logger = LoggerFactory.getLogger(CategoryAjaxController.class);

	@Autowired
	private BigstarConstant bigstarConstant;

	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private JsonResponseMaker jsonResponseMaker;

	@Resource
	private BigstarProperties bigstarProperties;
	
	

	@RequestMapping(value = "list.ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody String list() {
		List<CateDTO> resultDTO = categoryService.getCategoryList();
		
		return null;
	}
	
	
	@RequestMapping(value = "createAction.ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody
	String CreateAction(CateDTO cateDTO) {

		int rst = categoryService.createCategory(cateDTO);

		CateDTO resultDTO = categoryService.getCategory(cateDTO);
		
		
		String jsonResponse = jsonResponseMaker.generateCreateCatetoryJson(resultDTO, rst);
		
		return jsonResponse;

	}

	@RequestMapping(value ="deleteAction.ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody
	String categoryDeleteAction(CateDTO cateDTO) throws SQLException {

		int rst = categoryService.deleteCategory(cateDTO);

		String jsonResponse = jsonResponseMaker.generateDefaultJson(rst);

		return jsonResponse;

	}

	@RequestMapping(value ="updateAction.ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody
	String categoryUpdateAction(CateDTO cateDTO) {

		int rst = categoryService.updateCategory(cateDTO);

		String jsonResponse = jsonResponseMaker.generateDefaultJson(rst);

		return jsonResponse;

	}
}
