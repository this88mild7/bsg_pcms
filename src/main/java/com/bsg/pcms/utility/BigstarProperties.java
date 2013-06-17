package com.bsg.pcms.utility;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class BigstarProperties {
	
	@Value("#{pmsProperties['successCode']}") 
	int successCode;
	@Value("#{pmsProperties['failedCode']}") 
	int failedCode;
	@Value("#{pmsProperties['successMsg']}") 
	String successMsg;
	@Value("#{pmsProperties['failedMsg']}") 
	String failedMsg;
	
	public int getSuccessCode() {
		return successCode;
	}
	public int getFailedCode() {
		return failedCode;
	}
	public String getSuccessMsg() {
		return successMsg;
	}
	public String getFailedMsg() {
		return failedMsg;
	}
	
	@Override
	public String toString() {
		return "BigstarProperties [successCode=" + successCode
				+ ", failedCode=" + failedCode + ", successMsg=" + successMsg
				+ ", failedMsg=" + failedMsg + "]";
	}
	
}
