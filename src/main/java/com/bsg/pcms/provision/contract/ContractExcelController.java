package com.bsg.pcms.provision.contract;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bsg.pcms.provision.contract.svc.ContractService;
import com.bsg.pcms.utility.PageUtil;

@Controller
@RequestMapping(value = "contract")
public class ContractExcelController {

	@Autowired
	private ContractService contractService;
	
	@Autowired
	private PageUtil pageUtil;

	@RequestMapping(value = "list.excel")
	public ModelAndView list(ContractDTOEx cde) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("contractExcelView");

		cde.setStartRownum((cde.getPageNum() - 1) * pageUtil.getPerPage());
		List<ContractDTOEx> contractList = contractService.getContractList(cde);
		mav.addObject("contractList",contractList);

		return mav;
	}

}
