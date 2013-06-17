package com.bigstarglobal.pms.test;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.bigstarglobal.cms.dto.CommonDTO;
import com.bigstarglobal.cms.dto.ContentDTO;
import com.bigstarglobal.cms.utility.BankListMaker;
import com.bigstarglobal.cms.utility.PageUtil;

public class SimpleTest {

	private Logger logger = LoggerFactory.getLogger(SimpleTest.class);
	
	@Test
	public void test0(){
//		Content c = new Content();
		String s = "CP01_CA170P0001_PB";
		
		String result = s.substring( s.length()-7, s.length()-3 );
		logger.info( s.substring(s.length()-4) );
		int i = Integer.valueOf(result);
		logger.info(s.length() + "");
		logger.info(s.length()-3 + "");
		logger.info( (i + 1) +"");
	}
	
	@Test
	public void testStringFormat(){
		logger.info( String.format( "%s 는 %s", "1", "2" ) );
		
		for(int i = 0; i <= 99; i++){
			logger.info( String.format( "%02d", i ) );
		}
	}

	@Test
	public void test1(){
		
		int arr[] = {1, 12, 123, 1234};
		
		for (int i = 0; i < arr.length; i++) {
			String s = "000" + arr[i];
			logger.info( s.substring(s.length()-4) );
					
		}
		
		logger.info( this.getNextProductNumber("CP03_CA33P0001_EB") );
	}
	
	@Test
	public void test3(){
		
		String s = "1,2,3,2";
		
		String [] arr = s.split(",");
		logger.info( arr.length + "" );
		logger.info( arr[0] );
	}
	
	@Test
	public void test2(){
		int[] arr = new int[0];
		
		arr[0] = 0;
		arr[1] = 1;
		
		logger.info( arr + "" );
	}
	
	@Test
	public void testBankList(){
		BankListMaker blm = new BankListMaker();
		logger.info( blm.getBankList().toString() );
	}
	
	/** 콘텐츠 번호 생성
	 * @param str
	 * @return String "0001", "0011", "0111", "1111"
	 */
	String getNextProductNumber( String str ) {
		
		int i = Integer.valueOf( str.substring( str.length()-7, str.length()-3 ) );
		i += 1;
		
		String s = i + "";
		
		return s.substring(s.length()-4);
	}
	
	@Test
	public void plusTest(){
		int i = 1;
		String s = "000" + ++i;
		logger.info(s);
	}
	
	
}
