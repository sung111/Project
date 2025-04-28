package project.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
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

    // 로그인 페이지 표시
    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    // 로그인 처리
    @PostMapping("/Login_controller")
    public ModelAndView login(
            @RequestParam("userId") String userId,  // 입력한 아이디
            @RequestParam("userPw") String userPw,  // 입력한 비밀번호
            HttpSession session) {  // 세션 객체

        ModelAndView mav = new ModelAndView();

        // 로그인 시도
        User_DTO user = userService.login(userId, userPw);

        // 로그인 성공 시
        if (user != null) {
            // 로그인 성공 시 userId와 user 객체를 세션에 저장
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("user", user); // 사용자 정보
            session.setAttribute("userName", user.getUserName());

            // 로그인 성공 로그 (콘솔 출력)
            System.out.println("로그인 성공: " + user.getUserId());
            System.out.println("userName: " + user.getUserName() + ", job: " + user.getJob());

            // 로그인 성공 시 index 페이지로 리다이렉트
            mav.setViewName("redirect:/index");
        } else {
            // 로그인 실패 시
            System.out.println("로그인 실패");

            // 로그인 실패 시 로그인 페이지로 리다이렉트
            mav.setViewName("redirect:/login");
            mav.addObject("error", "아이디 또는 비밀번호가 일치하지 않습니다.");  // 오류 메시지 추가
            mav.addObject("userId", userId);  // 로그인 시도한 아이디 값 다시 전달
        }

        return mav;
    }

    // 로그아웃 처리
    @GetMapping("/logout")
    public String logout(HttpSession session, HttpServletResponse response) {

        // 세션을 무효화하여 로그아웃 처리
        session.invalidate();

        // 사용자 아이디 쿠키 삭제
        Cookie cookie = new Cookie("userId", null);
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);

        // 로그인 페이지로 리다이렉트
        return "redirect:/maintitle";
    }
}
