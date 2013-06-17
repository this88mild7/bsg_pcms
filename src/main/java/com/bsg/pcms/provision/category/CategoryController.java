package com.bsg.pcms.provision.category;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bsg.pcms.dto.CateDTO;
import com.bsg.pcms.provision.category.svc.CategoryService;
import com.bsg.pcms.utility.BigstarConstant;
import com.bsg.pcms.utility.BigstarProperties;

@Controller
@RequestMapping( value = "category")
public class CategoryController {

	private Logger logger = LoggerFactory.getLogger(CategoryController.class);
	
	@Autowired
	private BigstarConstant bigstarConstant; 
	
	@Autowired
	private CategoryService categoryService; 
	
	@Resource
	private BigstarProperties bigstarProperties;
	
	@RequestMapping( value = "list.do", method = RequestMethod.GET )
	public ModelAndView list() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "category-list" );
		mav.addObject( "leftMenuSeq", bigstarConstant.getLEFT_CATEGORY() );
		mav.addObject( "navSeq", bigstarConstant.getHEADER_CP() );
		
		List<CateDTO> categoryList = categoryService.getCategoryList( null );
		mav.addObject( "categoryList", categoryList );
		return mav;
		
	}
	
}
