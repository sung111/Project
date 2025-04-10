package project.service.Users_total_service;

import org.springframework.stereotype.Service;
import project.dto.User_DTO;

@Service
public interface User_service {
    User_DTO login(String userId, String userPw);
}
