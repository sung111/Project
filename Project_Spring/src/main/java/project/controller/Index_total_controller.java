package project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.dto.User_DTO;
import project.service.Users_total_service.User_service;

//Index_total_controller.java
@Controller
@RequestMapping("/")
public class Index_total_controller {

	
	
    @Autowired
    User_service user_service;

    @GetMapping("index")
    public ModelAndView index(HttpSession session) {
        // 세션에서 userId 가져오기
        String userId = (String) session.getAttribute("userId");

        ModelAndView mv = new ModelAndView();

        if (userId != null) {
            // 세션에 사용자 정보 있을 때
            String helloUser = "로그인이 필요한 서비스입니다.";
            String userRole = "";
            String userName = "";

            User_DTO user = (User_DTO) session.getAttribute("user");
            if (user != null) {
                userRole = user.getJob();
                userName = user.getUserName(); 
                helloUser = userRole + " " + userName + "님, 환영합니다!";
            }

            // Tiles 이름으로 view 지정
            mv.setViewName("index");
            mv.addObject("userId", userId);
            mv.addObject("helloUser", helloUser);
        } else {
            mv.setViewName("redirect:/login");
        }

        return mv;
    }
}

