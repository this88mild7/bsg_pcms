package com.bigstarglobal.cms.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bigstarglobal.cms.dto.UserDTO;


@Service
public class UserService {

	@Autowired
	private UserDao memberDao;
	
	/**
	 * @param member( id & pwd )
	 * @return 로그인 성공 1, 실패 0
	 */
	public boolean hasUser( UserDTO member ) {
		int resultCount = memberDao.hasUser( member ); 
		if(resultCount > 0){
			return true;
		}else{
			return false;
		}
    }
	
	public boolean hasNoUser(UserDTO member){
		return hasUser(member)?false:true;
	}
	
	public UserDTO getUser( UserDTO member ) {
		
		return memberDao.getUser( member );      
		
	}
	
	public List<UserDTO> getUserList() {
		
		return memberDao.getUserList();      
		
	}
}
