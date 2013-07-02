package com.bsg.pcms.utility;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsg.pcms.dto.CateDTO;
import com.bsg.pcms.dto.SeriesDTO;
import com.bsg.pcms.provision.content.ContentDTOEx;
import com.bsg.pcms.stats.dto.StatisticsDTO;

@Service
public class JsonResponseMaker {
	
	private final String CODE = "code";
	private final String MSG = "msg";
	private final String RESULT = "result";
	private final String RESULT_COUNT = "resultCnt";
	private final String CATE_ID = "cate_id";
	private final String CATE_NAME = "cate_name";
	private final String PARENT_ID = "parent_id";
	private final String COMPANY_LIST = "companyList";
	private final String DEVICE_LIST = "deviceList";
	private final String CONTRACT_TYPE_LIST = "contractTypeList";
	
	
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
				temp.put("series_price", seriesDTO.getSale_price());
				temp.put("series_price", seriesDTO.getSale_price());
				temp.put("cp_name", seriesDTO.getCompany_name());
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
	
	public String generateMapList(String jsonParentName, List<Map> map){
		JSONObject json = new JSONObject();
		
		if (map != null) {
			setSucessCode(json);
			JSONArray result = new JSONArray();
			for(Map parameter : map){
				result.add(parameter);
			}
			json.put(jsonParentName, result);
		}else{
			setFailCode(json);
		}
		
		return json.toJSONString();
	}
	
	public String generateBalanceSaleCompanyInfo(List<Map> saleDeviceList,
			List<Map> saleTypeleList) {
		JSONObject json = new JSONObject();
		
		if (saleDeviceList != null) {
			setSucessCode(json);
			JSONArray device = new JSONArray();
			for(Map parameter : saleDeviceList){
				device.add(parameter);
			}
			json.put(DEVICE_LIST, device);
			
			JSONArray contractType = new JSONArray();
			for(Map parameter : saleTypeleList){
				contractType.add(parameter);
			}
			json.put(CONTRACT_TYPE_LIST, contractType);
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
				temp.put("cp_name", contents.getCompany_name());
				result.add(temp);
			}
			json.put(RESULT, result);
			json.put(RESULT_COUNT, result.size());
		}else{
			setFailCode(json);
		}
		return json.toJSONString();
	}
	
	public String generateLineGraph(String string,
			List<StatisticsDTO> companyList) {
		JSONObject json = new JSONObject();
		
		if (companyList != null) {
			setSucessCode(json);
			JSONArray result = new JSONArray();
			for(StatisticsDTO statDTO : companyList){
				JSONObject saleCompany = new JSONObject();
				saleCompany.put("saleCompanyName", statDTO.getCompany_name());
				
				
				Map saleCompanyCount = statDTO.getMonthSaleCount();
				
				JSONArray saleCompanyMonthCount = new JSONArray();
				Iterator<String> it = statDTO.getMonthSaleCount().keySet().iterator();
				while(it.hasNext()){
					String key = it.next();
					saleCompanyCount.get(key);
					saleCompanyMonthCount.add(saleCompanyCount.get(key));
				}
				saleCompany.put("monthCount", saleCompanyMonthCount);
				result.add(saleCompany);
			}
			json.put(string, result);
			json.put("saleCompanyCount", companyList.size());
		}else{
			setFailCode(json);
		}
		return json.toJSONString();
	}
	
	public String generateProductLineGraph(String string,
			List<StatisticsDTO> companyList) {
		JSONObject json = new JSONObject();
		
		if (companyList != null) {
			setSucessCode(json);
			JSONArray result = new JSONArray();
			for(StatisticsDTO statDTO : companyList){
				JSONObject saleCompany = new JSONObject();
				saleCompany.put("contentName", statDTO.getContents_name());
				
				
				Map saleCompanyCount = statDTO.getMonthSaleCount();
				
				JSONArray saleCompanyMonthCount = new JSONArray();
				Iterator<String> it = statDTO.getMonthSaleCount().keySet().iterator();
				while(it.hasNext()){
					String key = it.next();
					saleCompanyCount.get(key);
					saleCompanyMonthCount.add(saleCompanyCount.get(key));
				}
				saleCompany.put("monthCount", saleCompanyMonthCount);
				result.add(saleCompany);
			}
			json.put(string, result);
			json.put("contentCount", companyList.size());
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
