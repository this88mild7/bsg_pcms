package com.bigstarglobal.pms.test;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.bigstarglobal.cms.dto.ContentDTO;

public class ExcelPusher {

	Logger console = LoggerFactory.getLogger(ExcelPusher.class);
	SqlSessionFactory sqlSessionFactory;
	
	SqlSession sqlSession;
	
	public SqlSession getSqlSession(){
		return sqlSession;
	}
	
	@Before
	public void setup() throws IOException{
		String resource = "config/mybatis-config.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		console.info( "" + sqlSessionFactory );
		sqlSession = sqlSessionFactory.openSession();
	}
	
	@Test
	public void testSelectCpList(){
		getSqlSession().selectList( "cpQuery.getCpList" );
	}
	
	@Test
	public void excelTest() throws IOException{
		FileInputStream file = new FileInputStream("C:\\job\\workspace\\ExcelTest\\a.xls");
		Workbook w;
		try {
			w = Workbook.getWorkbook(file);
			Sheet sheet = w.getSheet(0);
			
			String _cp = "";
			String _series = "";
			String _type = "";
			for (int j = 1; j < 940; j++) {
				Cell[] c = sheet.getRow(j);
				
				String cpName = c[1].getContents();
				if( cpName.length() == 0 ){
//					System.out.println( cpName );
					cpName = _cp;
				}
				_cp = cpName;
				
				String seriesName = c[2].getContents();
				if( seriesName.length() == 0 )
					seriesName = _series;
				_series = seriesName;
				
				String typeName = c[4].getContents();
				if( typeName.length() == 0 ){
					typeName = _type;
				}
				_type = typeName;
				
				String contentName = c[6].getContents();
				
//				System.out.println( String.format("('%s', '%s', '%s')" , this.getCpId(cpName), this.getCategoryId2(seriesName), contentName) );
				
				ContentDTO content = new ContentDTO();
//				content.setCp_id(this.getCpId(cpName)+"");
//				content.setCategory_id2(this.getCategoryId2(seriesName)+"");
//				content.setContent_type("picturebook");
//				content.setCategory_id1(this.getType(typeName)+"");
//				content.setContent_currency( "KOR" );
//				content.setContent_name(contentName);
//				content.setContent_price("1000");
//				content.setContent_age("0");
				

//				content.setContent_cd( this.makeContentCode( content ) );
				
				console.info(content.toString());
				
//				System.out.println( String.format("('%s', '%s', '%s')" , cpName, seriesName, contentName) );
				
				
				getSqlSession().insert( "contentQuery.createContent", content );
				
				
			}
		} catch (BiffException e) {
			e.printStackTrace();
		}
	}
	
	@After
	public void finished(){
		sqlSession.commit();
		sqlSession.close();
	}
	
	public int getCpId(String str){
		int cpId = 0;
		if( str.equals("대교") ) {
			cpId = 3;
		}
		if( str.equals("YBMsisa") ) {
			cpId = 4;
		}
		if( str.equals("한국삐아제") ) {
			cpId = 6;
		}
		if( str.equals("제이와이북스") ) {
			cpId = 7;
		}
		if( str.equals("천재교육") ) {
			cpId = 14;
		}
		if( str.equals("플레이북스") ) {
			cpId = 13;
		}
		if( str.equals("한국 헤르만헤세") ) {
			cpId = 15;
		}
		if( str.equals("아가월드") ) {
			cpId = 12;
		}
		if( str.equals("미래엔") ) {
			cpId = 8;
		}
		return cpId;
	}
	
	public int getCategoryId2(String str){
		int categoryId2 = 0;

		if( str.equals("리틀베이비픽처북 2") ) {
			categoryId2 = 48;
		}
		if( str.equals("리틀베이비픽쳐북 1") ) {
			categoryId2 = 47;
		}
		if( str.equals("주주픽처북") ) {
			categoryId2 = 69;
		}
		if( str.equals("ABC픽처북") ) {
			categoryId2 = 34;
		}
		if( str.equals("세계명작") ) {
			categoryId2 = 57;
		}
		if( str.equals("전래명작") ) {
			categoryId2 = 73;
		}
		if( str.equals("붐붐잉글리시") ) {
			categoryId2 = 33;
		}
		if( str.equals("노부영") ) {
			categoryId2 = 35;
		}
		if( str.equals("주주픽처북2") ) {
			categoryId2 = 70;
		}
		if( str.equals("HB KIDS ENGLISH") ) {
			categoryId2 = 71;
		}
		if( str.equals("스토리큐브") ) {
			categoryId2 = 74;
		}
		if( str.equals("CD명작") ) {
			categoryId2 = 75;
		}
		if( str.equals("씽씽잉글리시 2") ) {
			categoryId2 = 72;
		}
		if( str.equals("리틀수학북스") ) {
			categoryId2 = 39;
		}
		if( str.equals("마음쑥쑥 리틀명작북스") ) {
			categoryId2 = 76;
		}
		if( str.equals("반짝반짝 리틀전래북스") ) {
			categoryId2 = 77;
		}
		if( str.equals("How so? 지식똑똑 과학탐구") ) {
			categoryId2 = 81;
		}
		if( str.equals("아가월드 MIT") ) {
			categoryId2 = 50;
		}
		if( str.equals("명작동화") ) {
			categoryId2 = 61;
		}
		if( str.equals("전래동화") ) {
			categoryId2 = 78;
		}
		if( str.equals("창작동화") ) {
			categoryId2 = 79;
		}
		if( str.equals("경제동화") ) {
			categoryId2 = 80;
		}
		if( str.equals("수학동화") ) {
			categoryId2 = 40;
		}
		if( str.equals("철학동화") ) {
			categoryId2 = 83;
		}
		if( str.equals("원리똑똑 과학동화") ) {
			categoryId2 = 82;
		}
		if( str.equals("꿈꾸는달팽이") ) {
			categoryId2 = 84;
		}
		if( str.equals("아이즐북스") ) {
			categoryId2 = 85;
		}
		return categoryId2;
	}
	
	public int getType(String str){
		int typeId = 0;
		if( str.equals("영어") ) {
			typeId = 32;
		}
		if( str.equals("수학") ) {
			typeId = 38;
		}
		if( str.equals("과학") ) {
			typeId = 41;
		}
		if( str.equals("창의") ) {
			typeId = 46;
		}
		if( str.equals("동요") ) {
			typeId = 54;
		}
		if( str.equals("명작") ) {
			typeId = 56;
		}
		if( str.equals("자연") ) {
			typeId = 63;
		}
		if( str.equals("전래") ) {
			typeId = 64;
		}
		if( str.equals("창작") ) {
			typeId = 65;
		}
		if( str.equals("경제") ) {
			typeId = 66;
		}
		if( str.equals("철학") ) {
			typeId = 67;
		}
		if( str.equals("생활") ) {
			typeId = 68;
		}
		return typeId;
	}
	
}
