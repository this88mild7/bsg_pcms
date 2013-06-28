package com.bsg.pcms.utility;

import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class BigstarglobalInterceptor extends HandlerInterceptorAdapter {

	private Logger logger = LoggerFactory.getLogger(BigstarglobalInterceptor.class);
	
	private final String PMS_LOGIN_PAGE_URL = "/pcms/index.do";
	
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) {
		
		try {
			long startTime = System.currentTimeMillis();
			request.setAttribute("startTime", startTime);

			printRequestLog(request);
			/*
			if(!request.getServletPath().contains( "/index.do" ) &&
					!request.getServletPath().contains( "/login.do" )){
				
				HttpSession session = request.getSession(false);
				
				if ( null == session || session.getAttribute( "user" ) == null){
					// 리다이렉션 URL 상수 처리 필요					
					response.sendRedirect(PMS_LOGIN_PAGE_URL);					
					return false;
				} else {
					
					// ROLE처리 로직 구현 예정
					// 자격 없을시 "접근권한이 없음" 문구 알림
//					@SuppressWarnings("unchecked")
//					HashMap<String, Object> map = (HashMap<String, Object>)session.getAttribute( "user" );
					// logger.debug( map.toString() ); //{id=test, role=1}
					// response.sendRedirect("/index.do");
					// return false;
				}
			}
				// session검사
				 * */
				 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
				
		return true;
	}

	

	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		printRequestProcessingTime(request);
		
	}



	private void printRequestProcessingTime(HttpServletRequest request) {
		long startTime = (Long) request.getAttribute("startTime");
		long endTime = System.currentTimeMillis();
		long executeTime = endTime - startTime;
		logger.debug(" executeTime : " + executeTime + "ms" );
	}
	
	private void printRequestLog(HttpServletRequest request) {
		try {
			StringBuffer sb = new StringBuffer();
			sb.append("[REQ]");
			sb.append("_IP_["+request.getRemoteAddr()+"]");
			sb.append("_REQURL_["+request.getServletPath()+"]");
			sb.append("_PARAM_[");
			
			// parameter
			Enumeration eNames = request.getParameterNames();
			while (eNames.hasMoreElements()) {
				String name = (String) eNames.nextElement();
				String[] values = request.getParameterValues(name);
				String paramIngo = "["+name+" : ";
				for(int x=0;x < values.length;x++){
					if(x==0){
						paramIngo +=  URLEncoder.encode(values[x], "UTF-8");
					}else{
						paramIngo += ", "+URLEncoder.encode(values[x], "UTF-8");
					}
				}
				
				if(StringUtils.isNotEmpty(name)){
					if(name.equals("pwd")){
						
						paramIngo = "xxxx ]";
					}else{
						paramIngo += "]";
					}
				}
				
				if(eNames.hasMoreElements()){
					sb.append(paramIngo+",");
				}else{
					sb.append(paramIngo);
				}
			}
			sb.append("]");
			logger.info(sb.toString());
		} catch (Exception e) {
			logger.error("{}", e);
		}
//		if( logger.isDebugEnabled() ){
//			
//			logger.info( "request.getServletPath() : " + request.getServletPath() );
//			
//			Map<String, String[]> paramMap = request.getParameterMap();
//			Set<String> set = paramMap.keySet();
//			
//			if(set.size() > 0)
//				logger.info( "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" );
//
//			for( String key : set ){
//				logger.info( "파라미터>> " + key + ":" + request.getParameter(key) );
//			}
//
//			if(set.size() > 0)
//				logger.info( "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$" );
//		}
	}
}
