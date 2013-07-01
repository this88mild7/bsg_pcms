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
public class ContentController {

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

	@RequestMapping(value = "list.do", method = RequestMethod.GET)
	public ModelAndView list(ContentDTOEx content) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("content-list");
		mav.addObject("leftMenuSeq", bigstarConstant.LEFT_CONTENTS);
		mav.addObject("navSeq", bigstarConstant.HEADER_CP);

		// 컨텐츠 가져오기
		content.setStartRownum((content.getPageNum() - 1) * pageUtil.getPerPage());
		List<ContentDTOEx> contentList = contentService.getContentList(content);
		mav.addObject("contentList", contentList);

		int totalCnt = contentService.getContentCount(content);
		int pageNum = content.getPageNum();
		
		mav.addObject("pageLink", pageUtil.setPageLinkDTO(totalCnt, pageNum));

		//페이징 prev/next 버튼 parameter
		if (content.getType() != null) {
			content.setSearch("&type=" + content.getType() + "&query=" + content.getQuery());
		}
		mav.addObject("search", content);

		return mav;
	}

	@RequestMapping(value = "detail.do")
	public ModelAndView detail(ContentDTOEx content) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("content-info");
		mav.addObject("leftMenuSeq", bigstarConstant.LEFT_CONTENTS);
		mav.addObject("navSeq", bigstarConstant.HEADER_CP);

		ContentDTOEx _content = contentService.getContent(content);
		mav.addObject("content", _content);

		// CP 리스트
		CompanyDTO cpd = new CompanyDTO();
		cpd.setPageNum(0); // 0 넣어주면 CP전체리스트
		List<CompanyDTO> cpList = cpService.getCpList(cpd);
		mav.addObject("cpList", cpList);

		// 최상위 카테고리
		List<CateDTO> categoryList = categoryService.getCategoryList();
		mav.addObject("categoryList", categoryList);
		
		List<CodeDTO> contentTypeList = codeSerivce.contentTypeList();
		mav.addObject(bigstarConstant.OB_CONTENT_TYPE_LIST, contentTypeList);

		return mav;
	}

	@RequestMapping(value = "deleteAction.do")
	public ModelAndView deleteAction(ContentDTOEx content) {
		// rv.setExposeModelAttributes(false);
		ModelAndView mav = new ModelAndView(new RedirectView("list.do"));

		// cp_id로 삭제
		int result;
		try {
			result = contentService.deleteContent(content);
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		mav.addObject("result", result);

		return mav;
	}

	@RequestMapping(value = "updateAction.do")
	public ModelAndView updateAction(ContentDTOEx cde) throws SQLException  {
		ModelAndView mav = new ModelAndView(new RedirectView("list.do"));

		// cp_id로 삭제
		int result = contentService.updateContent(cde);
		mav.addObject("result", result);

		return mav;
	}

	@RequestMapping(value = "create.do", method = RequestMethod.GET)
	public ModelAndView create() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("content-info");
		mav.addObject("leftMenuSeq", bigstarConstant.LEFT_CONTENTS);
		mav.addObject("navSeq", bigstarConstant.HEADER_CP);
		mav.addObject("isNew", true);

		// CP 리스트
		CompanyDTO cpd = new CompanyDTO();
		cpd.setPageNum(0); // 0 넣어주면 CP전체리스트
		List<CompanyDTO> cpList = cpService.getCpList(cpd);
		mav.addObject("cpList", cpList);

		// 카테고리
		List<CateDTO> categoryList = categoryService.getCategoryList(new CateDTO());
		mav.addObject("categoryList", categoryList);
		
		List<CodeDTO> contentTypeList = codeSerivce.contentTypeList();
		mav.addObject(bigstarConstant.OB_CONTENT_TYPE_LIST, contentTypeList);

		return mav;

	}

	@RequestMapping(value = "createAction.do", method = RequestMethod.POST)
	public ModelAndView createAction(ContentDTOEx cde) throws SQLException {

		ModelAndView mav = new ModelAndView(new RedirectView("list.do"));

		int result = contentService.createContent(cde);
		// logger.debug( "result :" + result );
		// String resultMsg = "콘텐츠 등록에 성공하였습니다.";
		// if( result != 1 ) {
		// resultMsg = "콘텐츠 등록에 실패하였습니다.";
		// }
		// mav.addObject( "resultMsg", resultMsg );
		return mav;

	}

}
