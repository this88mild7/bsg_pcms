package com.bsg.pcms.stats.svc;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsg.pcms.stats.dao.StatisticsDao;
import com.bsg.pcms.stats.dto.StatisticsDTO;

@Service
public class StatisticsService {
	
	@Autowired
	StatisticsDao statDao;
	
	public List<StatisticsDTO> list(StatisticsDTO requestParam) {
		if(requestParam == null){
			requestParam = new StatisticsDTO();
			requestParam.setSortingType("1");
		}
		return statDao.list(requestParam);
	}
	
	public List<Map> listForMap(StatisticsDTO requestParam) {
		
		List<StatisticsDTO> saleCompanyTable = statDao.list(requestParam);
		
		List<Map> tableListMap = new ArrayList<Map>();
		
		for(StatisticsDTO staDTO : saleCompanyTable){
			Map<String, Object> tableMap = new HashMap<String, Object>();
			tableMap.put("company_name", staDTO.getCompany_name());
			tableMap.put("total_sale_count", staDTO.getTotal_sale_count());
			tableMap.put("total_sale_price", staDTO.getTotal_sale_price());
			tableMap.put("sale_device", staDTO.getSale_device());
			tableMap.put("sale_str_date", staDTO.getSale_str_date());
			tableMap.put("sale_end_date", staDTO.getSale_end_date());
			tableListMap.add(tableMap);
		}
		
		return tableListMap;
	}

	public List<StatisticsDTO> search(StatisticsDTO param) {
		return statDao.search(param);
	}

	
	public List<StatisticsDTO> lineGraph(String searchYear){
		
		if(StringUtils.isBlank(searchYear)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			searchYear = sdf.format(System.currentTimeMillis());
		}
		
		List<StatisticsDTO> companyList = statDao.lineGraphCompany();
		for(StatisticsDTO companyMgmtno : companyList){
			companyMgmtno.setSearchEndDate(searchYear);
			companyMgmtno.setMonthSaleCount(statDao.lineGraphMonthCount(companyMgmtno));
			
		}
 		return companyList;
	}

	public List<Map> pieGraphForMap(StatisticsDTO param) {
		
		List<StatisticsDTO> pieGraphResult = statDao.pieGraph(param);
		
		List<Map> pieGraphGForMap = new ArrayList<Map>();
		
		int etcSaleCount = 0;
		String etcCompanyName = "ETC";
		Map<String, Object> etcCompany = new HashMap<String, Object>();
		
		for(int x=0; x<pieGraphResult.size();x++){
			
			if(x>4){
				etcSaleCount += pieGraphResult.get(x).getTotal_sale_count();
			}else{
				Map<String, Object> pieMap = new HashMap<String, Object>();
				pieMap.put("saleCompany", pieGraphResult.get(x).getCompany_name());
				pieMap.put("saleCount", pieGraphResult.get(x).getTotal_sale_count());
				pieGraphGForMap.add(pieMap);
			}
		}
		etcCompany.put("saleCompany", etcCompanyName);
		etcCompany.put("saleCount", etcSaleCount);
		pieGraphGForMap.add(etcCompany);
		
		
		return pieGraphGForMap;
//		for(StatisticsDTO temp : pieGraphResult){
//			Map<String, Object> pieMap = new HashMap<String, Object>();
//			pieMap.put("saleCompany", temp.getCompany_name());
//			pieMap.put("saleCount", temp.getTotal_sale_count());
//			pieGraphGForMap.add(pieMap);
//		}
//		return pieGraphGForMap;
	}
	
	public List<StatisticsDTO> productList(StatisticsDTO param) {
		if(param == null){
			param = new StatisticsDTO();
			param.setSortingType("1");
		}
		return statDao.productList(param);
	}
	
	public List<StatisticsDTO> productSearch(StatisticsDTO param) {
		return statDao.search(param);
	}
	
	
	public List<StatisticsDTO> productLineGraph(String searchYear){
		
		if(StringUtils.isBlank(searchYear)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			searchYear = sdf.format(System.currentTimeMillis());
		}
		
		List<StatisticsDTO> companyList = statDao.productLineGraphContent();
		for(StatisticsDTO companyMgmtno : companyList){
			companyMgmtno.setSearchEndDate(searchYear);
			companyMgmtno.setMonthSaleCount(statDao.productLineGraphMonthCount(companyMgmtno));
			
		}
 		return companyList;
	}
	
	public List<Map> productPieGraphForMap(StatisticsDTO param) {
		
		List<StatisticsDTO> pieGraphResult = statDao.productPieGraph(param);
		
		int etcSaleCount = 0;
		String etcCompanyName = "ETC";
		Map<String, Object> etcCompany = new HashMap<String, Object>();
		
		List<Map> pieGraphGForMap = new ArrayList<Map>();
		for(int x=0; x<pieGraphResult.size();x++){
			
			if(x>4){
				etcSaleCount += pieGraphResult.get(x).getTotal_sale_count();
			}else{
				Map<String, Object> pieMap = new HashMap<String, Object>();
				pieMap.put("contentName", pieGraphResult.get(x).getContents_name());
				pieMap.put("saleCount", pieGraphResult.get(x).getTotal_sale_count());
				pieGraphGForMap.add(pieMap);
			}
		}
		etcCompany.put("contentName", etcCompanyName);
		etcCompany.put("saleCount", etcSaleCount);
		pieGraphGForMap.add(etcCompany);
		return pieGraphGForMap;
		
//		List<Map> pieGraphGForMap = new ArrayList<Map>();
//		for(StatisticsDTO temp : pieGraphResult){
//			Map<String, Object> pieMap = new HashMap<String, Object>();
//			pieMap.put("contentName", temp.getContents_name());
//			pieMap.put("saleCount", temp.getTotal_sale_count());
//			pieGraphGForMap.add(pieMap);
//		}
//		return pieGraphGForMap;
	}

	public List<Map> productListForMap(StatisticsDTO param) {
		
		List<StatisticsDTO> saleCompanyTable = statDao.productList(param);
		
		List<Map> tableListMap = new ArrayList<Map>();
		
		for(StatisticsDTO staDTO : saleCompanyTable){
			Map<String, Object> tableMap = new HashMap<String, Object>();
			tableMap.put("contens_name", staDTO.getContents_name());
			tableMap.put("contents_cd", staDTO.getContents_cd());
			tableMap.put("total_sale_count", staDTO.getTotal_sale_count());
			tableMap.put("total_sale_price", staDTO.getTotal_sale_price());
			tableMap.put("sale_device", staDTO.getSale_device());
			tableMap.put("sale_str_date", staDTO.getSale_str_date());
			tableMap.put("sale_end_date", staDTO.getSale_end_date());
			tableListMap.add(tableMap);
		}
		return tableListMap;
	}

	

}
