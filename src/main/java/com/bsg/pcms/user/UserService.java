package com.bsg.pcms.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bsg.pcms.dto.UserDTO;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	/**
	 * @param user
	 *            ( id & pwd )
	 * @return 로그인 성공 1, 실패 0
	 */
	public boolean hasUser(UserDTO user) {
		int resultCount = userDao.hasUser(user);
		if (resultCount > 0) {
			return true;
		} else {
			return false;
		}
	}

	public boolean hasNoUser(UserDTO user) {
		return hasUser(user) ? false : true;
	}

	public UserDTO getUser(UserDTO user) {
		return userDao.getUser(user);
	}

	public int createUser(UserDTO user) {
		return userDao.createUser(user);
	}

	public int updateUser(UserDTO user) {
		return userDao.updateUser(user);
	}

	public List<UserDTO> getUserList() {
		return userDao.getUserList();
	}
}
