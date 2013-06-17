package com.bsg.pcms.sale.product;

import static org.junit.Assert.*;

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

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class ProductServiceTest {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	ProductService productService;

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

//	@Test
//	public void testGetProduct() {
//		String result = productService.();
//		assertNotNull(result);
//		logger.info(result);
//	}

}
