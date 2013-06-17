package com.bigstarglobal.cms.dto;

import java.sql.Date;
import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class MultiFileDTO {

	private int file_id;
	private int file_size;

	private String file_name;
	private byte[] file;
	
	private Date file_cdate;
	
	
	private MultipartFile mf;
	
	@Override
	public String toString() {
		return "MultiFile [file_id=" + file_id + ", file_name=" + file_name
				+ ", file_size=" + file_size + ", file="
				+ Arrays.toString(file) + ", file_cdate=" + file_cdate
				+ ", mf=" + mf + "]";
	}

	public int getFile_id() {
		return file_id;
	}

	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}


	public int getFile_size() {
		return file_size;
	}

	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}


	public byte[] getFile() {
		return file;
	}

	public void setFile(byte[] file) {
		this.file = file;
	}

	public Date getFile_cdate() {
		return file_cdate;
	}

	public void setFile_cdate(Date file_cdate) {
		this.file_cdate = file_cdate;
	}

	

	public MultipartFile getMf() {
		return mf;
	}

	public void setMf(MultipartFile mf) {
		this.mf = mf;
	}
	
}
