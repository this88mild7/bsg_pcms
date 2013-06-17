package com.bigstarglobal.cms.dto;

public class DeviceDTO {
	
	private String device_cd;
	
	private String device_name;

	public String getDevice_cd() {
		return device_cd;
	}

	public void setDevice_cd(String device_cd) {
		this.device_cd = device_cd;
	}

	public String getDevice_name() {
		return device_name;
	}

	public void setDevice_name(String device_name) {
		this.device_name = device_name;
	}

	@Override
	public String toString() {
		return "DeviceDTO [device_cd=" + device_cd + ", device_name="
				+ device_name + "]";
	}
	

}
