package com.bigstarglobal.cms.file;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bigstarglobal.cms.dto.MultiFileDTO;


@Service
public class FileService {

	@Autowired
	private FileDao fileDao;
	
	public int createFile( MultipartFile multipartFile ){
		
		MultiFileDTO mf = new MultiFileDTO();
		mf.setFile_name(multipartFile.getOriginalFilename());
		try {
			mf.setFile(multipartFile.getBytes());
			mf.setFile_name(multipartFile.getOriginalFilename());
			mf.setFile_size((int)multipartFile.getSize());
			
			fileDao.createFile( mf );
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		
		return mf.getFile_id();
	}
	
}
