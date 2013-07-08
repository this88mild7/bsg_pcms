package com.bsg.pcms.stats;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bsg.pcms.dto.PageLinkDTO;
import com.bsg.pcms.stats.dto.StatisticsDTO;
import com.bsg.pcms.stats.svc.StatisticsService;
import com.bsg.pcms.utility.BigstarConstant;
import com.bsg.pcms.utility.PageUtil;

@Controller
@RequestMapping( value = "statistics" )
public class StatisticsController {

	private Logger logger = LoggerFactory.getLogger(StatisticsController.class);
	
	@Autowired
	BigstarConstant bigstarConstant; 
	
	@Autowired
	StatisticsService statService;
	
	@Autowired
	PageUtil pageUtil;
	
	/** 판매처 통계 대쉬보드
	 * tableList setting properties: 
	 * 	company_name, 
	 *  total_sale_count, 
	 *  total_sale_price, 
	 *  sale_device, 
	 *  sale_str_date, 
	 *  sale_end_date
	 *  
	 * @return
	 */
	@RequestMapping( value = "sale-company/dashboard.do", method = RequestMethod.GET )
	public ModelAndView saleCompanyDashboard(StatisticsDTO requestParam) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("statistics-sale-company-dashboard");
		mav.addObject("navSeq", bigstarConstant.HEADER_STATS);
		mav.addObject("leftMenuSeq", bigstarConstant.LEFT_STATISTICS_SALE_COMPANY);
		mav.addObject("tableList", statService.saleCompanys(requestParam));
		int saleCompanyTotalCount = statService.saleCompanysCount(requestParam);
		int pageNum = requestParam.getPageNum();
		PageLinkDTO pageLink = pageUtil.setPageLinkDTO(saleCompanyTotalCount, pageNum);
		mav.addObject("pageLink", pageLink);
		mav.addObject("search", requestParam);
		
		return mav;
	}
	
	/** 상품 통계 대쉬보드
	 * @return
	 */
	@RequestMapping( value = "product/dashboard.do", method = RequestMethod.GET )
	public ModelAndView productDashboard(StatisticsDTO requestParam) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("statistics-product-dashboard");
		mav.addObject("navSeq", bigstarConstant.HEADER_STATS);
		mav.addObject("leftMenuSeq", bigstarConstant.LEFT_STATISTICS_PRODUCT);
		mav.addObject("tableList", statService.products(requestParam));
		
		
		int productTotalCount = statService.productsCount(requestParam);
		int pageNum = requestParam.getPageNum();
		PageLinkDTO pageLink = pageUtil.setPageLinkDTO(productTotalCount, pageNum);
		mav.addObject("pageLink", pageLink);
		mav.addObject("search", requestParam);
		
		return mav;
	}
}
