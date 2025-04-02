package project.dao.Login_total_dao;

import project.dto.User_DTO;

public interface Users_DAO {
    User_DTO selectUserId(String userId);
}