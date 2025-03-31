package project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Login_total_controller {

    // 로그인 페이지를 처리하는 GET 요청
    @GetMapping("/login")
    public String showLoginPage() {
        return "login";  // login.jsp로 이동
    }

    // 로그인 처리
    @PostMapping("/Login_controller")
    public ModelAndView login(
        @RequestParam("userId") String userId,
        @RequestParam("userPw") String userPw,
        HttpSession session 
    ) {
        ModelAndView mav = new ModelAndView();

        // 로그인 인증
        if ("admin".equals(userId) && "1234".equals(userPw)) {
            // 로그인 성공하면 세션에 userId 저장
            session.setAttribute("userId", userId);
            System.out.println("로그인 성공: userId = " + userId);

            // index URL로 이동
            mav.setViewName("redirect:/index"); 
        } else {
            // 로그인 실패하면 에러 메시지 출력 및 로그인 페이지로 이동
            System.out.println("로그인 실패: 입력된 userId = " + userId + ", 입력된 userPw = " + userPw);
            mav.setViewName("login");
            mav.addObject("error", "아이디 또는 비밀번호가 잘못되었습니다.");
            mav.addObject("userId", userId); // 입력했던 ID 유지
        }

        return mav;
    }
}

