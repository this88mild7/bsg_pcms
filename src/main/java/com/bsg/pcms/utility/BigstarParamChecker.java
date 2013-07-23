package com.bsg.pcms.utility;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

@Service
public class BigstarParamChecker {
	
	public boolean invalidSearchDate(String searchDate){
		if(StringUtils.isNotBlank(searchDate) && searchDate.equals("0000-00")){
			return true;
		}else{
			return false;
		}
	}

}
