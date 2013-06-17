package com.bsg.pcms.provision.cp;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.bsg.pcms.dto.CommonDTO;
import com.bsg.pcms.dto.CompanyDTO;
import com.bsg.pcms.dto.PageLinkDTO;
import com.bsg.pcms.utility.BigstarConstant;
import com.bsg.pcms.utility.BigstarProperties;
import com.bsg.pcms.utility.PageUtil;

@Controller
@RequestMapping(value = "cp")
public class CpController {

	private Logger logger = LoggerFactory.getLogger(CpController.class);

	@Autowired
	BigstarConstant bigstarConstant;

	@Autowired
	private CpService cpService;

	@Resource
	private BigstarProperties bigstarProperties;

	@Autowired
	private PageUtil pageUtil;

	@RequestMapping(value = "list.do")
	public ModelAndView list(CompanyDTO companyDTO) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cp-list");
		mav.addObject("leftMenuSeq", bigstarConstant.getLEFT_CP());
		mav.addObject("navSeq", bigstarConstant.getHEADER_CP());

		companyDTO.setStartRownum((companyDTO.getPageNum() - 1) * pageUtil.getPerPage());
		List<CompanyDTO> cpList = cpService.getCpList(companyDTO);
		mav.addObject("cpList", cpList);

		int totalCnt = cpService.getCpCount(companyDTO);
		int pageNum = companyDTO.getPageNum();

		PageLinkDTO pageLink = pageUtil.setPageLinkDTO(totalCnt, pageNum);
		mav.addObject("pageLink", pageLink);

		//페이징 prev/next 버튼 parameter
		if (companyDTO.getType() != null) {
			companyDTO.setSearch("&type=" + companyDTO.getType() + "&query=" + companyDTO.getQuery());
		}
		mav.addObject("search", companyDTO);

		return mav;
	}


	@RequestMapping(value = "detail.do")
	public ModelAndView detail(CompanyDTO companyDTO) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cp-info");
		mav.addObject("leftMenuSeq", bigstarConstant.getLEFT_CP());
		mav.addObject("navSeq", bigstarConstant.getHEADER_CP());

		CompanyDTO _cp = cpService.getCp(companyDTO);
		mav.addObject("cp", _cp);

		return mav;
	}

	@RequestMapping(value = "deleteAction.do")
	public ModelAndView deleteAction(CompanyDTO companyDTO) {
		// rv.setExposeModelAttributes(false);
		ModelAndView mav = new ModelAndView(new RedirectView("list.do"));

		// cp_id로 삭제
		int result;
		try {
			result = cpService.deleteCp(companyDTO);
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		mav.addObject("result", result);

		return mav;
	}

	@RequestMapping(value = "create.do", method = RequestMethod.GET)
	public ModelAndView create() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("cp-info");
		mav.addObject("leftMenuSeq", bigstarConstant.getLEFT_CP());
		mav.addObject("navSeq", bigstarConstant.getHEADER_CP());
		mav.addObject("isNew", true);
		return mav;

	}

	@RequestMapping(value = "updateAction.do", method = RequestMethod.POST)
	public ModelAndView update(CompanyDTO companyDTO) {

		ModelAndView mav = new ModelAndView(new RedirectView("list.do"));

		int result = cpService.updateCp(companyDTO);
		mav.addObject("result", result);

		return mav;

	}

	@RequestMapping(value = "createAction.do", method = RequestMethod.POST)
	public ModelAndView createAction(CompanyDTO companyDTO) {

		ModelAndView mav = new ModelAndView(new RedirectView("list.do"));

		int result = cpService.createCp(companyDTO);

		String resultMsg = "CP 업체등록에 성공하였습니다.";
		if (result != 1) {
			resultMsg = "CP 업체등록에 실패하였습니다.";
		}
//		mav.addObject("resultMsg", resultMsg);
		
		return mav;

	}

}
