package com.bsg.pcms.file;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import com.bsg.pcms.dto.MultiFileDTO;


@Component
public class FileDao extends SqlSessionDaoSupport{

	public Integer createFile( MultiFileDTO multiFile ) {
		return getSqlSession().insert( "fileQuery.createFile", multiFile );
	}
	
}
