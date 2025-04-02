package project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.dto.User_DTO;
import project.service.Users_total_service.User_service;

@Controller
public class Login_total_controller {

    @Autowired
    private User_service userService;

    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; 
    }

    @PostMapping("/Login_controller")
    public ModelAndView login(
        @RequestParam("userId") String userId,
        @RequestParam("userPw") String userPw,
        HttpSession session
    ) {
        ModelAndView mav = new ModelAndView();

        // 서비스에서 로그인 검증
        User_DTO user = userService.login(userId, userPw);
        if (user != null) {
            // 로그인 성공 -> 세션 저장 + index로 이동
            session.setAttribute("userId", user.getUserId());
            System.out.println("로그인 성공: " + user.getUserId());
            
            mav.setViewName("redirect:/index");
        } else {
            // 로그인 실패 -> 다시 login.jsp로
            System.out.println("로그인 실패");
            mav.setViewName("redirect:/login"); 
            mav.addObject("error", "아이디 또는 비밀번호가 잘못되었습니다.");
            mav.addObject("userId", userId);
        }
        return mav;
    }
}
