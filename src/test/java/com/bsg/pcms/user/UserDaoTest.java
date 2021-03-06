package com.bsg.pcms.user;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.not;
import static org.junit.Assert.*;

import java.util.List;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bsg.pcms.dto.UserDTO;
import com.bsg.pcms.user.UserController;
import com.bsg.pcms.user.UserDao;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class UserDaoTest {
	
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserDao userDao;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testGetUser(){
		UserDTO userDto = new UserDTO();
		userDto.setId("test1");
		userDto.setPwd("123");
		UserDTO resultDTO = userDao.getUser(userDto);
		assertNotNull(resultDTO);
		logger.info(resultDTO.toString());
	}
	
	@Test
	public void testGetUserList(){
		List<UserDTO> resultList = userDao.getUserList();
		assertNotNull(resultList);
		assertThat(resultList.size(), is(not(0)));
		logger.info("{}", resultList.size());
	}
	
	@Test
	public void testCreateUser(){
		
		UserDTO userDTO = new UserDTO();
		userDTO.setId("abc");
		userDTO.setPwd("123");
		userDTO.setTeam("웹사업팀");
		userDTO.setName("장그래");
		userDTO.setTitle("사원");
		userDTO.setPhoneno("0070");
		userDTO.setEmail("abc@gmail.com");
		
		int result = userDao.createUser(userDTO);
		assertNotNull(userDTO);
		assertThat(result, is(not(0)));
		logger.info("{}", userDTO);
	}
	
	@Test
	public void testUpdateUser(){
		
		String id = "1";
		
		UserDTO userDTO = new UserDTO();
		userDTO.setId(id);
		userDTO.setPwd("123");
		userDTO.setTeam("웹사업팀");
		userDTO.setName("장그래");
		userDTO.setTitle("사원");
		userDTO.setPhoneno("0070");
		userDTO.setEmail("abc@gmail.com");
		
		int result = userDao.updateUser(userDTO);
		assertNotNull(userDTO);
		assertThat(result, is(not(0)));
		logger.info("{}", userDTO);
	}

}
