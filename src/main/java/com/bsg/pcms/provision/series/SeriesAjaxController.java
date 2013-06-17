package com.bsg.pcms.provision.series;

import java.sql.SQLException;
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

import com.bsg.pcms.dto.CompanyDTO;
import com.bsg.pcms.dto.SeriesDTO;
import com.bsg.pcms.provision.series.svc.SeriesService;
import com.bsg.pcms.utility.BigstarConstant;
import com.bsg.pcms.utility.BigstarProperties;

@Controller
@RequestMapping( value = "series")
public class SeriesAjaxController {

	private Logger logger = LoggerFactory.getLogger(SeriesAjaxController.class);
	
	@Autowired
	BigstarConstant bigstarConstant; 

	@Autowired
	private SeriesService seriesService; 
	
	@Resource
	private BigstarProperties bigstarProperties;
	
	@RequestMapping(value = "list.ajax", method = RequestMethod.GET, produces="application/json;charset=UTF-8")
	public  @ResponseBody String list(SeriesDTO seriesDTO) {
		
		List<SeriesDTO> seriesList = seriesService.getSeriesList(seriesDTO);
		
		JSONObject json = new JSONObject();
		json.put( "code", bigstarProperties.getSuccessCode() );
		json.put( "msg", bigstarProperties.getSuccessMsg() );
		
		json.put( "resultCnt", seriesList.size() );
		json.put( "result", this.convertSeriesListToJSONArr(seriesList) );
		
		return json.toJSONString();
		
	}
	
	@RequestMapping(value = "listByCpMgmtno.ajax", method = RequestMethod.GET, produces="application/json;charset=UTF-8")
	public  @ResponseBody String list(CompanyDTO companyDTO) {
		
		List<SeriesDTO> seriesList = seriesService.getSeriesListByCpMgmtno(companyDTO);
		
		JSONObject json = new JSONObject();
		json.put( "code", bigstarProperties.getSuccessCode() );
		json.put( "msg", bigstarProperties.getSuccessMsg() );
		
		json.put( "resultCnt", seriesList.size() );
		json.put( "result", this.convertSeriesListToJSONArr(seriesList) );
		
		return json.toJSONString();
		
	}
	
	@RequestMapping(value = "createAction.ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody
	String CreateAction(SeriesDTO seriesDTO)throws SQLException {

		int rst = seriesService.createSeries(seriesDTO);

		JSONObject json = new JSONObject();

		if (rst == 1) {

			SeriesDTO resultDTO = seriesService.getSeries(seriesDTO);

			json.put("code", bigstarProperties.getSuccessCode());
			json.put("msg", bigstarProperties.getSuccessMsg());

			JSONObject catJSON = new JSONObject();
			catJSON.put("series_mgmtno", resultDTO.getSeries_mgmtno());
			catJSON.put("series_name", resultDTO.getSeries_name());
			catJSON.put("cate_id", resultDTO.getCate_id());

			json.put("result", catJSON);

		} else {
			json.put("code", bigstarProperties.getFailedCode());
			json.put("msg", bigstarProperties.getFailedMsg());
		}

		return json.toJSONString();

	}
	

	@RequestMapping(value ="deleteAction.ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody
	String categoryDeleteAction(SeriesDTO seriesDTO) throws SQLException {

		int rst = seriesService.deleteSeries(seriesDTO);

		JSONObject json = new JSONObject();
		if (rst == 1) {
			json.put("code", bigstarProperties.getSuccessCode());
			json.put("msg", bigstarProperties.getSuccessMsg());
		} else {
			json.put("code", bigstarProperties.getFailedCode());
			json.put("msg", bigstarProperties.getFailedMsg());
		}

		return json.toJSONString();

	}

	@RequestMapping(value ="updateAction.ajax", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public @ResponseBody
	String categoryUpdateAction(SeriesDTO seriesDTO)throws SQLException {

		int rst = seriesService.updateSeries(seriesDTO);

		JSONObject json = new JSONObject();
		if (rst == 1) {
			json.put("code", bigstarProperties.getSuccessCode());
			json.put("msg", bigstarProperties.getSuccessMsg());
		} else {
			json.put("code", bigstarProperties.getFailedCode());
			json.put("msg", bigstarProperties.getFailedMsg());
		}

		return json.toJSONString();

	}
	
	//List<Series> -> JSONArray로 변환
	private JSONArray convertSeriesListToJSONArr(List<SeriesDTO> seriesList){
		
		if( seriesList.isEmpty() ) {
			return null;
		}
		
		JSONArray arr = new JSONArray();
		for( SeriesDTO sd : seriesList ){
			JSONObject seriesJSON = new JSONObject();
			seriesJSON.put( "cate_id", sd.getCate_id() );
			seriesJSON.put( "series_mgmtno", sd.getSeries_mgmtno() );
			seriesJSON.put( "series_name", sd.getSeries_name() );
			seriesJSON.put( "totCnt", sd.getTotCnt() );
			arr.add(seriesJSON);
		}
		return arr;
		
	}
	
}
