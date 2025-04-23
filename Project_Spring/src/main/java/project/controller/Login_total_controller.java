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

    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    //위치 지정
    @PostMapping("/Login_controller")
    // public 위치
    public ModelAndView login(
    		// 아이디, 비번을 식별하기 위한 이름
    		@RequestParam("userId") String userId, 
                              @RequestParam("userPw") String userPw,
                              //세션 이름
                              HttpSession session) {
// 모델 뷰를 mav로 지정함.
        ModelAndView mav = new ModelAndView();

        // 서비스에서 로그인 검증
        User_DTO user = userService.login(userId, userPw);
        //로그인 성공
        if (user != null) {
            //  로그인 성공하면 세션에 userId와 전체 user 객체로 저장됨
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("user", user); 
            System.out.println("로그인 성공: " + user.getUserId());
            System.out.println("userName: " + user.getUserName() + ", job: " + user.getJob());

            System.out.println("찌발"+session.getAttribute("userId"));
            System.out.println("찌발"+session.getAttribute("user"));
            mav.setViewName("redirect:/index");
        } else {
            // 로그인 실패
            System.out.println("로그인 실패");
            mav.setViewName("redirect:/login");
            mav.addObject("error", "아이디 또는 비밀번호가 잘못되었습니다.");
            mav.addObject("userId", userId);
        }

       
        
        return mav;
    }
    
    // 로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session, HttpServletResponse response) {
    	
    	// 세션과 쿠키 내용을 제거한다.
        session.invalidate(); 
        Cookie cookie = new Cookie("userId", null);
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);

        return "redirect:/login";
    }
}
