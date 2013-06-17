package com.bsg.pcms.utility;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsg.pcms.dto.CateDTO;
import com.bsg.pcms.dto.CompanyDTO;
import com.bsg.pcms.dto.ProductDTO;
import com.bsg.pcms.dto.SeriesDTO;
import com.bsg.pcms.provision.content.ContentDTOEx;

@Service
public class JsonResponseMaker {
	
	private final String CODE = "code";
	private final String MSG = "msg";
	private final String RESULT = "result";
	private final String RESULT_COUNT = "resultCnt";
	private final String CATE_ID = "cate_id";
	private final String CATE_NAME = "cate_name";
	private final String PARENT_ID = "parent_id";
	
	
	@Autowired
	private BigstarProperties bigstarProperties;
	
	public String generateCreateCatetoryJson(CateDTO category, int rst) {
		JSONObject json = new JSONObject();

		if (rst == 1) {
			setSucessCode(json);

			JSONObject catJSON = new JSONObject();
			catJSON.put(CATE_ID, category.getCate_id());
			catJSON.put(CATE_NAME, category.getCate_name());
			catJSON.put(PARENT_ID, category.getParent_id());

			json.put(RESULT, catJSON);

		} else {
			setFailCode(json);
		}

		return json.toJSONString();
	}
	
	public String generateSeries(List<SeriesDTO> seriesList) {
		JSONObject json = new JSONObject();
		
		if (seriesList != null) {
			setSucessCode(json);
			JSONArray result = new JSONArray();
			for(SeriesDTO seriesDTO : seriesList){
				JSONObject temp = new JSONObject();
				
				temp.put("series_mgmtno", seriesDTO.getSeries_mgmtno());
				temp.put("series_name", seriesDTO.getSeries_name());
				temp.put("series_price", "0");
				result.add(temp);
			}
			json.put(RESULT, result);
			json.put(RESULT_COUNT, seriesList.size());
		}else{
			setFailCode(json);
		}
		return json.toJSONString();
		
	}
	
	public String generateCateList(List<CateDTO> cateList) {
		JSONObject json = new JSONObject();
		
		if (cateList != null) {
			setSucessCode(json);
			JSONArray result = new JSONArray();
			for(CateDTO cateDTO : cateList){
				JSONObject temp = new JSONObject();
				
				temp.put("cate_id", cateDTO.getCate_id());
				temp.put("cate_name", cateDTO.getCate_name());
				result.add(temp);
			}
			json.put(RESULT, result);
			json.put(RESULT_COUNT, result.size());
		}else{
			setFailCode(json);
		}
		return json.toJSONString();
	}
	
	public String generateContentsList(List<ContentDTOEx> contentsList) {
		JSONObject json = new JSONObject();
		
		if (contentsList != null) {
			setSucessCode(json);
			JSONArray result = new JSONArray();
			for(ContentDTOEx contents : contentsList){
				JSONObject temp = new JSONObject();
				
				temp.put("content_cd", contents.getContents_cd());
				temp.put("content_name", contents.getName());
				temp.put("content_price", contents.getSale_price());
				result.add(temp);
			}
			json.put(RESULT, result);
			json.put(RESULT_COUNT, result.size());
		}else{
			setFailCode(json);
		}
		return json.toJSONString();
	}
	
	
	public String generateSucessCode(){
		return generateDefaultJson(1);
	}
	
	public String generateDefaultJson(int resultCount){
		JSONObject json = new JSONObject();
		if (resultCount == 1) {
			json.put(CODE, bigstarProperties.getSuccessCode());
			json.put(MSG, bigstarProperties.getSuccessMsg());
		} else {
			json.put(CODE, bigstarProperties.getFailedCode());
			json.put(MSG, bigstarProperties.getFailedMsg());
		}

		return json.toJSONString();
		
	}
	
	
	
	
	
	private void setSucessCode(JSONObject result) {
		result.put(CODE, bigstarProperties.getSuccessCode());
		result.put(MSG, bigstarProperties.getSuccessMsg());
	}

	private void setFailCode(JSONObject result) {
		result.put(CODE, bigstarProperties.getFailedCode());
		result.put(MSG, bigstarProperties.getFailedMsg());
	}

}
