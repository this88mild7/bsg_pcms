package com.bsg.pcms.sale.company;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bsg.pcms.sale.company.dao.CompanyContractDao;
import com.bsg.pcms.sale.company.dto.CompanyContentsDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyContractDTOEx;
import com.bsg.pcms.sale.company.svc.CompanyContractService;
import com.bsg.pcms.utility.PageUtil;

@Controller
@RequestMapping(value = "saleCompany/contract")
public class CompanyContractExcelController {

	@Autowired
	CompanyContractService _saleContractService;

	@Autowired
	CompanyContractDao _saleContractDao;
	
	@Autowired
	private PageUtil pageUtil;

	@RequestMapping(value = "list.excel")
	public ModelAndView list(CompanyContractDTOEx companyDTO) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("saleContractExcelView");

		companyDTO.setStartRownum((companyDTO.getPageNum() - 1) * pageUtil.getPerPage());
		List<CompanyContractDTOEx> saleCompanyContractList = _saleContractService.list(companyDTO);
		for(CompanyContractDTOEx cDTO : saleCompanyContractList){
			List<CompanyContentsDTOEx> contentsList = _saleContractDao.contractContentsList(cDTO.getContract_mgmtno());
			cDTO.setContentsList(contentsList);
		}
		mav.addObject("saleCompanyContractList", saleCompanyContractList);

		return mav;
	}

}
