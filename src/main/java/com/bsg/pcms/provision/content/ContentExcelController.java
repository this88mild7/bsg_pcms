package com.bsg.pcms.provision.content;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.bsg.pcms.code.dto.CodeDTO;
import com.bsg.pcms.code.svc.CodeService;
import com.bsg.pcms.dto.CateDTO;
import com.bsg.pcms.dto.CompanyDTO;
import com.bsg.pcms.provision.category.svc.CategoryService;
import com.bsg.pcms.provision.content.svc.ContentService;
import com.bsg.pcms.provision.cp.CpService;
import com.bsg.pcms.utility.BigstarConstant;
import com.bsg.pcms.utility.PageUtil;

@Controller
@RequestMapping(value = "content")
public class ContentExcelController {

	@Autowired
	private CpService cpService;

	@Autowired
	private BigstarConstant bigstarConstant;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ContentService contentService;
	
	@Autowired
	private CodeService codeSerivce;

	@Autowired
	private PageUtil pageUtil;

	@RequestMapping(value = "list.excel")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("excelView");

		ContentDTOEx cde = new ContentDTOEx();
		List<ContentDTOEx> contentList = contentService.getContentList(cde);
		mav.addObject("contentList",contentList);

		// CP 리스트
		CompanyDTO cpd = new CompanyDTO();
		cpd.setPageNum(0); // 0 넣어주면 CP전체리스트
		List<CompanyDTO> cpList = cpService.getCpList(cpd);
		mav.addObject("cpList", cpList);

		return mav;
	}

}
