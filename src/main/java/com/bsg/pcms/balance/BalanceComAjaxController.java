package com.bsg.pcms.balance;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bsg.pcms.balance.svc.BalanceService;
import com.bsg.pcms.sale.company.dto.CompanyContractDTOEx;
import com.bsg.pcms.sale.company.svc.CompanyService;
import com.bsg.pcms.utility.BigstarConstant;
import com.bsg.pcms.utility.JsonResponseMaker;

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
		String jsonString = _jsonResponseMaker.generateMapList("companyList", companyList);
		logger.info(jsonString);
		return jsonString;
	}
	
	/**
	 * @param company_mgmtno, sale_type
	 * RESULT SAMPLE
	 * {
			"contractTypeList": [{
				"contract_type": "CT002001",
				"contract_type_name": "개별"
			}],
			"code": 200,
			"msg": "OK"
		}
	 * @return
	 */
	@RequestMapping(value = "contractType.ajax", produces = "application/json;charset=UTF-8")
	public @ResponseBody 
	String contractType(int company_mgmtno, String sale_type) {
		List<Map> saleTypeleList = balanceService.saleType(company_mgmtno, sale_type);
		String jsonString = _jsonResponseMaker.generateMapList("contractTypeList", saleTypeleList);
		logger.info(jsonString);
		return jsonString;
		
	}
	/**
	 * @param company_mgmtno
	 * RESULT SAMPLE
	 * {
			"deviceTypeList": [{
				"sale_type_name": "ios",
				"sale_type": "DV001001"
			},
			{
				"sale_type_name": "android",
				"sale_type": "DV001002"
			},
			{
				"sale_type_name": "web",
				"sale_type": "DV001003"
			}],
			"code": 200,
			"msg": "OK"
		}
	 * @return
	 */
	@RequestMapping(value = "deviceType.ajax", produces = "application/json;charset=UTF-8")
	public @ResponseBody 
	String deviceType(int company_mgmtno) {
		List<Map> saleDeviceList = balanceService.device(company_mgmtno);
		String jsonString = _jsonResponseMaker.generateMapList("deviceTypeList", saleDeviceList);
		logger.info(jsonString);
		return jsonString;
	}
	
	/**
	 * @param company_mgmtno, sale_type, contract_type
	 * {
			"contentList": [{
				"sale_price": 1000.0,
				"sale_company_rate": 0,
				"cp_rate": 0,
				"name": "ABC픽쳐북",
				"contents_cd": "2"
			},
			{
				"sale_price": 1000.0,
				"sale_company_rate": 0,
				"cp_rate": 0,
				"name": "노부영",
				"contents_cd": "3"
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
		String jsonString = _jsonResponseMaker.generateMapList("contentList", contentsList);
		logger.info(jsonString);
		return jsonString;
	}
	
}
