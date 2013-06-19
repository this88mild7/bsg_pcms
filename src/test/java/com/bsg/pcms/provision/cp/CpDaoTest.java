package com.bsg.pcms.provision.cp;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertThat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bsg.pcms.dto.CompanyDTO;
import com.bsg.pcms.provision.cp.CpDao;
import com.bsg.pcms.utility.PageUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class CpDaoTest {

	private Logger logger = LoggerFactory.getLogger(CpDaoTest.class);
	
	@Autowired
	private CpDao cpDao;
	
	@Autowired
	private PageUtil pageUtil; 

	// 업체 만들기 테스트
	@Test
	public void testCreateCp() {
		CompanyDTO cpDTO = new CompanyDTO();
		cpDTO.setCompany_name("업체이름테스트");
		cpDTO.setCompany_no("123");
		cpDTO.setAddr("일산");
		cpDTO.setPhoneno("4338");
		cpDTO.setMaster("담당자 이름");
		cpDTO.setMaster_email("담당자 이멜");
		cpDTO.setMaster_phoneno("담당자 전번");
		logger.info(cpDTO.toString());
		
		int result = cpDao.createCp(cpDTO);
		assertThat( result, is(1) );
	}
	
	// 업체 담당 PD 만들기 테스트
	@Test
	public void testCreatePd() {
		
		Map<String, String> map1 = new HashMap<String, String>();
		map1.put("company_mgmtno", "33");
		map1.put("pd_name", "대원");
		
		Map<String, String> map2 = new HashMap<String, String>();
		map2.put("company_mgmtno", "33");
		map2.put("pd_name", "지순");
		
		List<Map<String, String>> pdList = new ArrayList<Map<String, String>>();
		pdList.add(map1);
		pdList.add(map2);
		
		int result = cpDao.createPd(pdList);
		assertThat( result, is(2) );
	}
	
	@Test
	public void testUpdateCp() {
		CompanyDTO cpDTO = new CompanyDTO();
		cpDTO.setCompany_mgmtno(2);
		cpDTO.setCompany_name("대원2");
		cpDTO.setCompany_no("123");
		cpDTO.setAddr("일산");
		cpDTO.setPhoneno("4338");
		cpDTO.setMaster("담당자 이름");
		cpDTO.setMaster_email("담당자 이멜");
		cpDTO.setMaster_phoneno("담당자 전번");
		logger.info(cpDTO.toString());
		
		int result = cpDao.updateCp(cpDTO);
		assertThat( result, is(1) );
	}
	
//	@Ignore //삭제 테스트 할때는 제거
	@Test
	public void testDeleteCp() {
		CompanyDTO cpDTO = new CompanyDTO();
		cpDTO.setCompany_mgmtno(2);
		logger.info(cpDTO.toString());
		
		int result = cpDao.deleteCp(cpDTO);
		assertThat( result, is(1) );
	}
	
//	@Ignore //삭제 테스트 할때는 제거
	@Test
	public void testDeletePdAll() {
		int companyMgmtno = 33;
		
		int result = cpDao.deletePdAll(companyMgmtno);
		assertThat( result, is(1) );
	}
	
	//담당PD 목록 가져오기 테스트
	@Test
	public void testGetPdList() {
		
		int companyMgmtno = 33;
		
		List<CpDTOEx> resultDTO = cpDao.getPdList(companyMgmtno);
		assertNotNull( resultDTO );
		assertThat( resultDTO.size(), not(0) );
		logger.info(resultDTO.toString());
	}
	
	@Test
	public void testGetCpList() {
		
		//페이징
		int pageNo = 0; //호출할 페이지
		//검색 조건절
		String type = null; //검색할 경우 null대신 { 회사명|CP코드|"" } 입력
		String query = ""; //검색어
		
		CompanyDTO cd = new CompanyDTO();
		cd.setType(type);
		cd.setQuery(query);
		cd.setPageNum(pageNo); 
		cd.setStartRownum( (cd.getPageNum() - 1) * pageUtil.getPerPage() );
		
		logger.info(cd.toString());
		List<CompanyDTO> resultDTO = cpDao.getCpList(cd);
		assertNotNull( resultDTO );
		assertThat( resultDTO.size(), not(0) );
		logger.info(resultDTO.toString());
	}
	
	@Test
	public void testGetCp() {
		
		int companyMgmtno = 33; // null 에러시 선 DB조회 후 테스트
		CompanyDTO cpDTO = new CompanyDTO();
		cpDTO.setCompany_mgmtno(companyMgmtno);
		
		CompanyDTO resultDTO = cpDao.getCp(cpDTO);
		assertNotNull( resultDTO );
		logger.info("{}", resultDTO);
	}
	
	@Test
	public void testGetCpCount() {
		
		//검색 조건절
		String type = null; //검색할 경우 null대신 { 회사명|CP코드|"" } 입력
		String query = ""; //검색어
		
		CompanyDTO cpDTO = new CompanyDTO();
		cpDTO.setType(type);
		cpDTO.setQuery(query);
		int cpCnt = cpDao.getCpCount(cpDTO);
		assertThat(cpCnt, not(0));
		logger.info("{}", cpCnt);
	}

}
