package project.service.Users_total_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.Login_total_dao.Users_DAO;
import project.dto.User_DTO;

@Service
public class User_serviceImpl implements User_service {

	@Autowired
	private Users_DAO userDAO;

	@Override
	public User_DTO login(String userId, String userPw) {
		User_DTO user = userDAO.selectUserId(userId);
		if (user != null && user.getUserPw().equals(userPw)) {
			return user;
		}
//		로그인 실패
		return null;
	}
}
