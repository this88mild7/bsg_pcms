package com.bigstarglobal.cms.utility;

import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.stereotype.Component;

import com.bigstarglobal.cms.dto.BankDTO;


@Component
public class BankListMaker {

	public ArrayList<BankDTO> getBankList(){
		
		ArrayList<BankDTO> bankList = new ArrayList<BankDTO>();
		
		String[] bankArray = {
				"선택하기",	
				"KB국민은행",	
				"기업은행",	
				"신한은행",	
				"우리은행",	
				"농협",	
				"수협",	
				"하나은행",	
				"외환은행",	
				"한국산업은행",	
				"중소기업은행",	
				"한국수출입은행",	
			};
			
		for( String name : Arrays.asList( bankArray ) ) {
			BankDTO b = new BankDTO();
			b.setBank_name(name);
			bankList.add(b);
		}
		
		return bankList;
			
	}
}
