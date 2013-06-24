package com.bsg.pcms.sale.company;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bsg.pcms.dto.CateDTO;
import com.bsg.pcms.dto.CompanyDTO;
import com.bsg.pcms.dto.SeriesDTO;
import com.bsg.pcms.provision.category.svc.CategoryService;
import com.bsg.pcms.provision.content.ContentDTOEx;
import com.bsg.pcms.provision.content.svc.ContentService;
import com.bsg.pcms.provision.series.svc.SeriesService;
import com.bsg.pcms.sale.company.dto.CompanyContractDTOEx;
import com.bsg.pcms.sale.company.dto.CompanyDTOEx;
import com.bsg.pcms.sale.company.svc.CompanyService;
import com.bsg.pcms.utility.JsonResponseMaker;

@Controller
@RequestMapping( value = "saleCompany" )
public class CompanyAjaxController {

	private Logger logger = LoggerFactory.getLogger(CompanyAjaxController.class);
	
	@Autowired
	private CompanyService _saleCompanyService;
	
	@Autowired
	private SeriesService _seriesService;
	
	@Autowired
	private CategoryService _cateService;
	
	@Autowired
	private ContentService _contentsService;
	
	@Autowired
	private JsonResponseMaker _jsonResponseMaker;
	
	
	@RequestMapping( value = "seriesList.ajax", produces = "application/json;charset=UTF-8")
	public @ResponseBody
	String seriesList(
			@RequestParam(value="cate_id", required=false)String cateId,
			@RequestParam(value="search", required=false)String search
			) {
		
		List<SeriesDTO> seriesList =null;
		String seriesJson = null;
		
		
		if(StringUtils.isNotBlank(search)){
			SeriesDTO seriesDTO = new SeriesDTO();
			seriesDTO.setQuery(search);
			seriesDTO.setType("시리즈명");
			seriesList = _seriesService.getSeriesList(seriesDTO);
			seriesJson = _jsonResponseMaker.generateSeries(seriesList);
			return seriesJson;
		}
		
		if(StringUtils.isBlank(cateId)){
			seriesList = _seriesService.getSeriesList(null);
		}else{
			SeriesDTO seriesDTO = new SeriesDTO();
			seriesDTO.setCate_id(Integer.parseInt(cateId));
			seriesList = _seriesService.getSeriesList(seriesDTO);
		}
		seriesJson = _jsonResponseMaker.generateSeries(seriesList);
		return seriesJson;
	}
	@RequestMapping( value = "cateList.ajax", produces = "application/json;charset=UTF-8")
	public @ResponseBody
	String cateList() {
		List<CateDTO> cateList = _cateService.getCategoryList();
		
		String cateJson = _jsonResponseMaker.generateCateList(cateList);
		logger.info("cateJons : {}", cateJson);
		return cateJson;
	}
	@RequestMapping( value = "contentsList.ajax", produces = "application/json;charset=UTF-8")
	public @ResponseBody
	String contentsList(
			@RequestParam(value="series_id", required=false)String seriesId,
			@RequestParam(value="search", required=false)String search
			) {
		
		String contentsJson = null;
		
		if(StringUtils.isNotBlank(search)){
			ContentDTOEx contentDTOEx = new ContentDTOEx();
			contentDTOEx.setType("콘텐츠");
			contentDTOEx.setQuery(search);
			List<ContentDTOEx> contentsList = _contentsService.getContentList(contentDTOEx);
			contentsJson = _jsonResponseMaker.generateContentsList(contentsList);
			return contentsJson;
		}
		
		ContentDTOEx contentDTOEx = new ContentDTOEx();
		contentDTOEx.setSeries_mgmtno(Integer.parseInt(seriesId));
		List<ContentDTOEx> contentsList = _contentsService.getContentCodeListBySeriesMgmtno(contentDTOEx);
		contentsJson = _jsonResponseMaker.generateContentsList(contentsList);
		logger.info("ContentsJons : {}", contentsJson);
		return contentsJson;
	}
	
	
	@RequestMapping( value = "saveContents.ajax", produces = "application/json;charset=UTF-8" )
	@ResponseBody
	public String saveContents(
			@RequestParam(value="contentList", required=true) List<String> contentList, 
			HttpServletRequest request) {
		request.getSession().setAttribute("contentsList", contentList);
		return _jsonResponseMaker.generateSucessCode();
	}
	
	
//	@RequestMapping( value = "deviceTypeList.ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
//	public @ResponseBody
//	String saleCompanyDeviceTypeList(CompanyDTOEx saleCompany) {
//		
//		List<CompanyDTO> deviceList = _saleCompanyService.getSaleCompantDeviceList(saleCompany);
//		String jsonResponse = jsonResponseMaker.generateDeviceTypeJsonList(deviceList);
//		return jsonResponse;
//		return null;
//		
//	}

	
}
