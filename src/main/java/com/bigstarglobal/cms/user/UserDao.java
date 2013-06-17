package com.bigstarglobal.cms.user;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import com.bigstarglobal.cms.dto.UserDTO;


@Component
public class UserDao extends SqlSessionDaoSupport{
	
	public int hasUser(UserDTO member) {

		return (Integer) getSqlSession().selectOne( "userQuery.getLoginResult", member );         
    }
	
	/**
	 * 현재는 단순이 ID 만 가져옴
	 * 사용자 권한에 대한 정책 결정이 아직 되어 있지 않음
	 * @param member
	 * @return
	 */
	public UserDTO getUser(UserDTO member) {
		return (UserDTO) getSqlSession().selectOne( "userQuery.getUser", member );
	}

	public List<UserDTO> getUserList() {
		
		return (List<UserDTO>) getSqlSession().selectList( "userQuery.getUserList" );
	}
}
