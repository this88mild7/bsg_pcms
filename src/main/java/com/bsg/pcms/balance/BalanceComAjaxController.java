package com.bsg.pcms.balance;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bsg.pcms.balance.dto.BalanceDTOEx;
import com.bsg.pcms.balance.svc.BalanceService;
import com.bsg.pcms.dto.BalanceDTO;
import com.bsg.pcms.sale.company.dto.CompanyContractDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyDTOEx;
import com.bsg.pcms.sale.company.svc.CompanyService;
import com.bsg.pcms.utility.BankListMaker;
import com.bsg.pcms.utility.BigstarConstant;
import com.bsg.pcms.utility.JsonResponseMaker;
import com.bsg.pcms.view.PmsView;

@Controller
@RequestMapping( value = "balance/sale-company" )
public class BalanceComAjaxController {

	private Logger logger = LoggerFactory.getLogger(BalanceComAjaxController.class);
	
	@Autowired
	BigstarConstant bigstarConstant;
	
	@Autowired
	private BalanceService balanceService;
	
	@Autowired
	private CompanyService _saleCompanyService; 
	
	@Autowired
	private JsonResponseMaker _jsonResponseMaker;
	
	/**
	 * RESULT SAMPLE
	 * {
		"companyList": [{
			"company_name": "LG전자 주식회사",
			"company_mgmtno": 28
		}],
		"code": 200,
		"msg": "OK"
		}
	 * 
	 * @return
	 */
	@RequestMapping(value = "list.ajax", produces = "application/json;charset=UTF-8")
	public @ResponseBody 
	String list() {
		
		List<Map> companyList = balanceService.saleCompanyList();
		
		
		String jsonString = _jsonResponseMaker.generateMapList(companyList);
		
		
		return jsonString;
		
	}
	
	/**
	 * @param company_mgmtno
	 * RESULT SAMPLE
	 * {
			"contractTypeList": [{
				"contract_type": "개별판매"
			}],
			"deviceList": [{
				"sale_type": "android"
			},
			{
				"sale_type": "ios"
			}],
			"code": 200,
			"msg": "OK"
		}
	 * @return
	 */
	@RequestMapping(value = "info.ajax", produces = "application/json;charset=UTF-8")
	public @ResponseBody 
	String info(int company_mgmtno) {
		
		List<Map> saleDeviceList = balanceService.device(company_mgmtno);
		
		List<Map> saleTypeleList = balanceService.saleType(company_mgmtno);
		
		
		String jsonString = _jsonResponseMaker.generateBalanceSaleCompanyInfo(saleDeviceList, saleTypeleList);
		
		return jsonString;
		
	}
	
	/**
	 * @param company_mgmtno, sale_type, contract_type
	 * {
			"companyList": [{
				"NAME": "Alphabet book",
				"SALE_COMPANY_RATE": 10,
				"CONTENTS_CD": "CP04_SE33P0001_PB",
				"CP_RATE": 30
			},
			{
				"NAME": "I wash",
				"SALE_COMPANY_RATE": 0,
				"CONTENTS_CD": "CP04_SE33P0002_PB",
				"CP_RATE": 30
			},
			{
				"NAME": "철학동화",
				"SALE_COMPANY_RATE": 0,
				"CONTENTS_CD": "35",
				"CP_RATE": 0
			}],
			"code": 200,
			"msg": "OK"
		}
	 * @return
	 */
	@RequestMapping(value = "contents.ajax", produces = "application/json;charset=UTF-8")
	public @ResponseBody 
	String contents(CompanyContractDTOEx companyContractDTOEx) {
		
		List<Map> contentsList = balanceService.contents(companyContractDTOEx);
		
		String jsonString = _jsonResponseMaker.generateMapList(contentsList);
		
		return jsonString;
		
	}
	
}
