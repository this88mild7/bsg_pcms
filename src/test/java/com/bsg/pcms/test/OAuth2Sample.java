package com.bsg.pcms.test;

import java.io.IOException;
import java.io.InputStream;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpParams;
import org.junit.Test;

public class OAuth2Sample {

	@Test
	public void getCode() throws ClientProtocolException, IOException{
		
		StringBuilder sb = new StringBuilder();
		//URL
		sb.append("https://accounts.google.com/o/oauth2/auth?");
		//scope
		sb.append("scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile&state=%2Fprofile&");
		//redirect_uri
		sb.append("redirect_uri=https%3A%2F%2Flocalhost%2Fcms%2Foauth2callback.do&");
		//response_type
		sb.append("response_type=code&");
		//client_id
		sb.append("client_id=977313315730-fs2sqpem4b2hqe7rdfg74dlaamov43fi.apps.googleusercontent.com&");
		//approval_prompt
		sb.append("approval_prompt=force");
		
		System.out.println(sb.toString());
		
		// response
		// https://localhost/cms/oauth2callback.do?state=/profile&code=4/x6RtgwsX1N4BVM4HYVhL4sUI0dH8.sgOYMOzk2EYfgrKXntQAax0-5PDdfQI
	}
	
	@Test
	public void getToken() throws ClientProtocolException, IOException{
		
		HttpClient httpClient = new DefaultHttpClient();
		String url = "http://accounts.google.com";
		
		HttpPost httpPost = new HttpPost(url);
		HttpParams params = new BasicHttpParams();
		params.setParameter("code", "4/x6RtgwsX1N4BVM4HYVhL4sUI0dH8.sgOYMOzk2EYfgrKXntQAax0-5PDdfQI");
		params.setParameter("client_id", "977313315730-fs2sqpem4b2hqe7rdfg74dlaamov43fi.apps.googleusercontent.com");
		params.setParameter("client_secret", "IJJGHvUUY9_8lAo81RhIolSg");
		params.setParameter("redirect_uri", "https%3A%2F%2Flocalhost%2Fcms%2Foauth2callback.do");
		params.setParameter("grant_type", "authorization_code");
		httpPost.setParams(params);
		
		HttpResponse response = httpClient.execute(httpPost);
		HttpEntity entity = response.getEntity();
		if (entity != null) {
		    InputStream instream = entity.getContent();
		    try {
		        // do something useful
		    } finally {
		        instream.close();
		    }
		}
	}
}
