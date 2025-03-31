package project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class Index_total_controller {

    @GetMapping("index")
    public ModelAndView index(HttpSession session) {
        // 세션에서 userId 가져오기
        String userId = (String) session.getAttribute("userId");

        ModelAndView Loginmv = new ModelAndView();

        if (userId != null) {
            // userId가 있으면 index.jsp로 이동
            System.out.println("index 페이지 접근: userId = " + userId);
            Loginmv.setViewName("index"); 
            Loginmv.addObject("userId", userId);
        } else {
            // userId가 없으면 로그인 페이지로 리다이렉트
            System.out.println("index 페이지 접근 실패: 세션에 userId 없음, 로그인 페이지로 리다이렉트됩니다.");
         // 로그인 페이지로 이동
            Loginmv.setViewName("redirect:/login"); 
        }

        return Loginmv;
    }

    @GetMapping("logout")
    public String logout(HttpSession session) {
        // 로그아웃: 세션 초기화 후 로그인 페이지로 이동
        String userId = (String) session.getAttribute("userId");
        session.invalidate();
        System.out.println("로그아웃: userId = " + userId);
        return "redirect:/login";
    }
}
