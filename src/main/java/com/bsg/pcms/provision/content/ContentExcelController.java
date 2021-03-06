package com.bsg.pcms.provision.content;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bsg.pcms.provision.content.svc.ContentService;
import com.bsg.pcms.utility.PageUtil;

@Controller
@RequestMapping(value = "content")
public class ContentExcelController {

	@Autowired
	private ContentService contentService;
	
	@Autowired
	private PageUtil pageUtil;

	@RequestMapping(value = "list.excel")
	public ModelAndView list(ContentDTOEx cde) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("contentExcelView");

		cde.setStartRownum((cde.getPageNum() - 1) * pageUtil.getPerPage());
		List<ContentDTOEx> contentList = contentService.getContentList(cde);
		mav.addObject("contentList",contentList);

		return mav;
	}

}
