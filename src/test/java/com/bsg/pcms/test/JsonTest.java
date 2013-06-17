package com.bsg.pcms.test;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class JsonTest {

	private Logger logger = LoggerFactory.getLogger(JsonTest.class);

	@Before
	public void setup() {

	}

	@Test
	public void test1() {

		JSONObject json = new JSONObject();
		json.put("code", 200);
		json.put("msg", "OK");

		logger.info(json.toJSONString());
		logger.info(json.toString());
	}

	@Test
	public void testDecoding() {

		String jsonStr = "{\"categoryList\":[{\"category_id\":\"33\",\"category_name\":\"붐붐잉글리쉬\"},{\"category_id\":\"35\",\"category_name\":\"노부영\"}]}";
		

		try {
			
			JSONObject obj = (JSONObject)JSONValue.parse(jsonStr);
			JSONArray arr = (JSONArray)obj.get("categoryList");
//		JSONArray array = (JSONArray) obj;
			System.out.println("======the 2nd element of array======");
			System.out.println(arr.get(0));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
