package com.bigstarglobal.cms.sale.product;

import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

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

import com.bigstarglobal.cms.dto.ProductDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class ProductDaoTest {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ProductDao productDao;

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
	public void testGetSaleProductList() {
		List<ProductDTO> resultDTo = productDao.getProductList();
		assertNotNull(resultDTo);
		assertThat(resultDTo.size(), is(not(0)));
		logger.info("{}", resultDTo);
	}
	
	@Test
	public void testGetSearchSaleProductList() {
		ProductDTO product = new ProductDTO();
		product.setQuery("엘지");
		product.setType("판매처명");
		List<ProductDTO> resultDTo = productDao.getSearchSaleProductList(product);
		assertNotNull(resultDTo);
		assertThat(resultDTo.size(), is(not(0)));
		logger.info("search : {}", resultDTo);
	}
	
	@Test
	public void testGetSaleProductDetail() {
		ProductDTO product = new ProductDTO();
		product.setProduct_id(8);
		List<ProductDTO> resultDTo = productDao.getProductDetail(product);
		assertNotNull(resultDTo);
		assertThat(resultDTo.size(), is(not(0)));
		logger.info("detail : {}", resultDTo);
	}

}
