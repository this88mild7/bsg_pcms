package com.bsg.pcms.user;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import com.bsg.pcms.dto.UserDTO;

@Component
public class UserDao extends SqlSessionDaoSupport {

	public UserDTO getLoginResult(UserDTO userDTO) {
		return (UserDTO)getSqlSession().selectOne("userQuery.getLoginResult", userDTO);
	}

	/**
	 * 현재는 단순이 ID 만 가져옴 사용자 권한에 대한 정책 결정이 아직 되어 있지 않음
	 * 
	 * @param userDTO
	 * @return
	 */
	public UserDTO getUser(UserDTO userDTO) {
		return (UserDTO)getSqlSession().selectOne("userQuery.getUser", userDTO);
	}
	
	public int createUser(UserDTO userDTO) {
		return getSqlSession().insert("userQuery.createUser", userDTO);
	}
	
	public int updateUser(UserDTO userDTO) {
		return getSqlSession().update("userQuery.updateUser", userDTO);
	}
	
	public int deleteUser(UserDTO userDTO) {
		return getSqlSession().update("userQuery.deleteUser", userDTO);
	}
	
	public int updateUserLevel(UserDTO userDTO) {
		return getSqlSession().update("userQuery.updateUserLevel", userDTO);
	}

	public List<UserDTO> getUserList() {
		return getSqlSession().selectList("userQuery.getUserList");
	}
}
