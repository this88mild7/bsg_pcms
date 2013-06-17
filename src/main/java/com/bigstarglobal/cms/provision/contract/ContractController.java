package com.bigstarglobal.cms.provision.contract;

import java.sql.SQLException;
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

import com.bigstarglobal.cms.dto.ContractContentsGroupDTO;
import com.bigstarglobal.cms.dto.ContractDetailDTO;
import com.bigstarglobal.cms.dto.SeriesDTO;
import com.bigstarglobal.cms.provision.content.svc.ContentService;
import com.bigstarglobal.cms.provision.contract.svc.ContractService;
import com.bigstarglobal.cms.provision.cp.CpService;
import com.bigstarglobal.cms.provision.series.svc.SeriesService;
import com.bigstarglobal.cms.utility.BankListMaker;
import com.bigstarglobal.cms.utility.BigstarConstant;
import com.bigstarglobal.cms.utility.BigstarProperties;
import com.bigstarglobal.cms.utility.PageUtil;

@Controller
@RequestMapping(value = "contract")
public class ContractController {

	private Logger logger = LoggerFactory.getLogger(ContractController.class);

	@Autowired
	private CpService cpService;

	@Autowired
	private BigstarConstant bigstarConstant;

	@Autowired
	private ContractService contractService;
	
	@Autowired
	private SeriesService seriesService;
	
	@Autowired
	private ContentService contentService;

	@Autowired
	private BankListMaker bankListMaker;
	
	@Autowired
	private PageUtil pageUtil;

	@Resource
	private BigstarProperties bigstarProperties;

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(ContractDTOEx contractDTOEx) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("contract-list");
		mav.addObject("leftMenuSeq", bigstarConstant.getLEFT_CONTRACTS());
		mav.addObject("navSeq", bigstarConstant.getHEADER_CP());

		contractDTOEx.setStartRownum((contractDTOEx.getPageNum() - 1) * pageUtil.getPerPage());
		mav.addObject("contractList", contractService.getContractList(contractDTOEx));
		mav.addObject("bankList", bankListMaker.getBankList());
		
		int totalCnt = contractService.getContractListCount(contractDTOEx);
		int pageNum = contractDTOEx.getPageNum();
		mav.addObject("pageLink", pageUtil.setPageLinkDTO(totalCnt, pageNum));
		//페이징 prev/next 버튼 parameter
		if (contractDTOEx.getType() != null) {
			contractDTOEx.setSearch("&type=" + contractDTOEx.getType() + "&query=" + contractDTOEx.getQuery());
		}
		mav.addObject("search", contractDTOEx);

		return mav;
	}

	@RequestMapping(value = "detail")
	public ModelAndView detail(ContractDTOEx cde) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("contract-info");
		mav.addObject("leftMenuSeq", bigstarConstant.getLEFT_CONTRACTS());
		mav.addObject("navSeq", bigstarConstant.getHEADER_CP());
		
		//시리즈 이름 얻기 위하여
		ContractContentsGroupDTO ccg = contractService.getContractContentsGroupList(cde).get(0);
		SeriesDTO sd = new SeriesDTO();
		sd.setSeries_mgmtno(ccg.getSeries_mgmtno());

		mav.addObject("series", seriesService.getSeries(sd));
		mav.addObject("seriesCnt", contentService.getContentCountBySeriesMgmtno(ccg.getSeries_mgmtno()));
		mav.addObject("contract", contractService.getContract(cde));
		
		mav.addObject("publishing_type", getPublishingTypeStr(cde));
		mav.addObject("cpList", cpService.getCpListAll());
		mav.addObject("bankList", bankListMaker.getBankList());

		return mav;

	}


	@RequestMapping(value = "deleteAction")
	public ModelAndView deleteAction(ContractDTOEx cde) {
		// rv.setExposeModelAttributes(false);
		ModelAndView mav = new ModelAndView(new RedirectView("list.do"));

		// contract_id로 삭제
		int result;
		try {
			result = contractService.deleteContract(cde);
		} catch (SQLException e) {
			result = 0;
			e.printStackTrace();
		}
		mav.addObject( "result", result );

		return mav;
	}

	@RequestMapping(value = "create", method = RequestMethod.GET)
	public ModelAndView create() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("contract-info");
		mav.addObject("leftMenuSeq", bigstarConstant.getLEFT_CONTRACTS());
		mav.addObject("navSeq", bigstarConstant.getHEADER_CP());
		mav.addObject("isNew", true);

		mav.addObject("cpList", cpService.getCpListAll());
		mav.addObject("bankList", bankListMaker.getBankList());

		return mav;

	}

	@RequestMapping(value = "createAction", method = RequestMethod.POST)
	public ModelAndView createAction(ContractDTOEx cde) throws SQLException{

		ModelAndView mav = new ModelAndView(new RedirectView("list.do"));

		mav.addObject("result", contractService.createContract(cde));

		return mav;

	}

	@RequestMapping(value = "updateAction")
	public ModelAndView updateAction(ContractDTOEx cde) throws SQLException {
		ModelAndView mav = new ModelAndView(new RedirectView("list.do"));

		int result = contractService.updateContract(cde);
		mav.addObject("result", result);
		mav.addObject("contract_mgmtno", cde.getContract_mgmtno());

		return mav;
	}
	

	/** 출판형태 리스트를 String으로 변환
	 * @param cde
	 * @return 예 "ebook,pb,2d"
	 */
	private String getPublishingTypeStr(ContractDTOEx cde) {
		List<ContractDetailDTO> detailList = contractService.getContractDetailList(cde);
		StringBuilder sb = new StringBuilder();
		for(ContractDetailDTO detail : detailList){
			sb.append(detail.getSale_type() + ",");
		}
		String cts = sb.toString();
		return cts.substring(0, (cts.length()-1)); //,(콤마) 제거 후 반환
	}

}
