package project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import project.dto.User_DTO;

@Controller
public class Mypage_total_controller {

    @GetMapping("/mypage")
    public String showMyPage(HttpSession session, Model model) {
        User_DTO user = (User_DTO) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login.jsp";
        }

        model.addAttribute("user", user);
        return "mypage";  
    }
	
}
