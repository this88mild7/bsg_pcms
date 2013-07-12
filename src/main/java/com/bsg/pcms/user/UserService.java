package com.bsg.pcms.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsg.pcms.dto.UserDTO;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	public UserDTO getLoginResult(UserDTO userDTO) {
		return userDao.getLoginResult(userDTO);
	}

	public UserDTO getUser(UserDTO userDTO) {
		return userDao.getUser(userDTO);
	}

	public int createUser(UserDTO userDTO) {
		return userDao.createUser(userDTO);
	}

	public int updateUser(UserDTO userDTO) {
		return userDao.updateUser(userDTO);
	}
	
	/** 준회원 -> 회원으로 변경
	 * @return
	 */
	public int updateUserLevel(UserDTO userDTO) {
		return userDao.updateUserLevel(userDTO);
	}

	/** del_yn = 'Y' 로 변경
	 * @param userDTO
	 * @return
	 */
	public int deleteUser(UserDTO userDTO) {
		return userDao.deleteUser(userDTO);
	}

	public List<UserDTO> getUserList() {
		return userDao.getUserList();
	}
}
