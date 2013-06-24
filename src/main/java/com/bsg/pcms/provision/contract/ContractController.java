package com.bsg.pcms.provision.contract;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.bsg.pcms.dto.ContractContentsGroupDTO;
import com.bsg.pcms.dto.ContractDetailDTO;
import com.bsg.pcms.dto.SeriesDTO;
import com.bsg.pcms.installments.svc.InstallmentsService;
import com.bsg.pcms.provision.content.svc.ContentService;
import com.bsg.pcms.provision.contract.svc.ContractService;
import com.bsg.pcms.provision.cp.CpService;
import com.bsg.pcms.provision.series.svc.SeriesService;
import com.bsg.pcms.utility.BankListMaker;
import com.bsg.pcms.utility.BigstarConstant;
import com.bsg.pcms.utility.PageUtil;

@Controller
@RequestMapping(value = "contract")
public class ContractController {
	
	Logger logger = LoggerFactory.getLogger(getClass());

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
	private InstallmentsService installmentsService;

	@Autowired
	private BankListMaker bankListMaker;
	
	@Autowired
	private PageUtil pageUtil;

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
		ContractDTOEx resultDTO = contractService.getContract(cde);
		mav.addObject("contract", resultDTO);
		//분납이라면
		if(null != resultDTO.getPayments_type() && resultDTO.getPayments_type().equalsIgnoreCase("installments")) {
			mav.addObject("installmentsList", installmentsService.getInstallmentsList(resultDTO.getContract_mgmtno()));
		}
		
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
		mav.addObject("isCreate", 1);

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
		mav.addObject("result", contractService.updateContract(cde));
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
