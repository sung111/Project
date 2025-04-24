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

    // �α��� �������� ǥ��
    @GetMapping("/login")
    public String showLoginPage() {
        return "login";
    }

    // �α��� ó��
    @PostMapping("/Login_controller")
    public ModelAndView login(
            @RequestParam("userId") String userId,  // ����� ���̵�
            @RequestParam("userPw") String userPw,  // ����� ��й�ȣ
            HttpSession session) {  // ���� ��ü

        ModelAndView mav = new ModelAndView();

        // �α��� �õ�
        User_DTO user = userService.login(userId, userPw);

        // �α��� ���� ��
        if (user != null) {
            // �α��� ���� �� userId�� user ��ü�� ���ǿ� ����
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("user", user); // ����� ����
            session.setAttribute("userName", user.getUserName());

            // �α��ε� ����� ���� ��� (������)
            System.out.println("�α��� ����: " + user.getUserId());
            System.out.println("userName: " + user.getUserName() + ", job: " + user.getJob());

            // �α��� ���� �� index �������� �����̷�Ʈ
            mav.setViewName("redirect:/index");
        } else {
            // �α��� ���� ��
            System.out.println("�α��� ����");

            // �α��� ���� �� �α��� �������� �����̷�Ʈ
            mav.setViewName("redirect:/login");
            mav.addObject("error", "���̵� �Ǵ� ��й�ȣ�� Ʋ�Ƚ��ϴ�.");  // ���� �޽��� �߰�
            mav.addObject("userId", userId);  // �α��� �õ��� ���̵� �� �ٽ� ����
        }

        return mav;
    }

    // �α׾ƿ� ó��
    @GetMapping("/logout")
    public String logout(HttpSession session, HttpServletResponse response) {

        // ������ ��ȿȭ�Ͽ� �α׾ƿ� ó��
        session.invalidate();

        // ����� ���̵� ��Ű ����
        Cookie cookie = new Cookie("userId", null);
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);

        // �α��� �������� �����̷�Ʈ
        return "redirect:/login";
    }
}
