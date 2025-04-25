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
        // ������ ���� userId ���� ��������
        String userId = (String) session.getAttribute("userId");

        ModelAndView mv = new ModelAndView();

        if (userId != null) {
            // ���ǿ� �α��ε� ����ڰ� ������
            String helloUser = "�α����� ������Դϴ�.";
            String userRole = "";
            String userName = "";

            User_DTO user = (User_DTO) session.getAttribute("user");
            if (user != null) {
                userRole = user.getJob();
                userName = user.getUserName(); 
                helloUser = userRole + " " + userName + "��, ȯ���մϴ�!";
            }

            // Tiles ������ ���� view ������
            mv.setViewName("index");
            mv.addObject("userId", userId);
            mv.addObject("helloUser", helloUser);
        } else {
            mv.setViewName("redirect:/login");
        }

        return mv;
    }
}
