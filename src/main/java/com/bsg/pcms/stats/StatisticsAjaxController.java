package com.bsg.pcms.stats;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bsg.pcms.stats.dto.StatisticsDTO;
import com.bsg.pcms.stats.svc.StatisticsService;
import com.bsg.pcms.utility.BigstarConstant;
import com.bsg.pcms.utility.JsonResponseMaker;

@Controller
@RequestMapping( value = "statistics" )
public class StatisticsAjaxController {

	private Logger logger = LoggerFactory.getLogger(StatisticsAjaxController.class);
	
	@Autowired
	BigstarConstant bigstarConstant; 
	
	@Autowired
	StatisticsService statService;
	
	@Autowired
	private JsonResponseMaker _jsonResponseMaker;
	
	/**
	 * 
	 * param : StatisticsDTO param
	 * ex) searchEndDate = "2013"
	 * 
	 * {
			"pieGraph": [{
				"saleCompany": "지순컴페니",
				"saleCount": 235802
			},
			{
				"saleCompany": "성환컴페니",
				"saleCount": 147591
			},
			{
				"saleCompany": "솔맷컴패니",
				"saleCount": 18277
			}],
			"code": 200,
			"msg": "OK"
		}
	 * @return
	 */
	@RequestMapping( value = "sale-company/pieGraph.ajax")
	public String pieGraph(StatisticsDTO param) {
		
		List<Map> companyList = statService.pieGraphForMap(param);
		
		String jsonString = _jsonResponseMaker.generateMapList("pieGraph", companyList);
		
		return jsonString;
	}
	
}
