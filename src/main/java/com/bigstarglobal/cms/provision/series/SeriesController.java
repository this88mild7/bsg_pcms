package com.bigstarglobal.cms.provision.series;

import java.util.List;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bigstarglobal.cms.dto.SeriesDTO;
import com.bigstarglobal.cms.provision.series.svc.SeriesService;
import com.bigstarglobal.cms.utility.BigstarConstant;
import com.bigstarglobal.cms.utility.BigstarProperties;

@Controller
@RequestMapping( value = "series")
public class SeriesController {

	private Logger logger = LoggerFactory.getLogger(SeriesController.class);
	
	@Autowired
	BigstarConstant bigstarConstant; 

	@Autowired
	private SeriesService seriesService; 
	
	@Resource
	private BigstarProperties bigstarProperties;
	
	@RequestMapping(value = "list.do", method = RequestMethod.GET, produces="application/json;charset=UTF-8")
	public  @ResponseBody String list(SeriesDTO seriesDTO) {
		
		List<SeriesDTO> seriesList = seriesService.getSeriesList(seriesDTO);
		
		JSONObject json = new JSONObject();
		json.put( "code", bigstarProperties.getSuccessCode() );
		json.put( "msg", bigstarProperties.getSuccessMsg() );
		
		json.put( "resultCnt", seriesList.size() );
		json.put( "result", this.convertSeriesListToJSONArr(seriesList) );
		
		return json.toJSONString();
		
	}
	
	//List<Series> -> JSONArray로 변환
	private JSONArray convertSeriesListToJSONArr(List<SeriesDTO> seriesList){
		
		if( seriesList.isEmpty() ) {
			return null;
		}
		
		JSONArray arr = new JSONArray();
		for( SeriesDTO s : seriesList ){
			JSONObject seriesJSON = new JSONObject();
			seriesJSON.put( "cate_id", s.getCate_id() );
			seriesJSON.put( "series_mgmtno", s.getSeries_mgmtno() );
			seriesJSON.put( "series_name", s.getSeries_name() );
			arr.add(seriesJSON);
		}
		return arr;
		
	}
	
}
