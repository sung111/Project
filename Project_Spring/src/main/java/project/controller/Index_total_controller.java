package project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.dto.User_DTO;
import project.service.Users_total_service.User_service;

@Controller
@RequestMapping("/")
public class Index_total_controller {

    @Autowired
    User_service user_service;

    @GetMapping("index")
    public ModelAndView index(HttpSession session) {
        // 세션을 통한 userId 정보 가져오기
        String userId = (String) session.getAttribute("userId");

        ModelAndView mv = new ModelAndView();

        if (userId != null) {
            // 세션에 로그인된 사용자가 있으면
            String helloUser = "로그인한 사용자입니다.";
            String userRole = "";
            String userName = "";

            User_DTO user = (User_DTO) session.getAttribute("user");
            if (user != null) {
                userRole = user.getJob();
                userName = user.getUserName(); 
                helloUser = userRole + " " + userName + "님, 환영합니다!";
            }

            // Tiles 설정을 통한 view 렌더링
            mv.setViewName("index");
            mv.addObject("userId", userId);
            mv.addObject("helloUser", helloUser);
        } else {
            mv.setViewName("redirect:/login");
        }

        return mv;
    }
}
