package project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.dto.User_DTO;
import project.service.Maintitle_service.Maintitle_service;
import project.service.Users_total_service.User_service;

@Controller
@RequestMapping("/")
public class Index_total_controller {

    @Autowired
    User_service user_service;
	@Autowired
	Maintitle_service service;

    @GetMapping("index")
    public ModelAndView index(HttpSession session,Model model) {
        // 세션에서 저장된 userId를 불러온다
        String userId = (String) session.getAttribute("userId");

        ModelAndView mv = new ModelAndView();

        
        
        
        if (userId != null) {
            // 세션에 로그인된 사용자가 존재할 경우
            String helloUser = "로그인된 사용자입니다.";
            String userRole = "";
            String userName = "";
            List titleAnnouncement = service.titleAnnouncement();
    	    List titleGeneralBulletinBoard = service.titleGeneralBulletinBoard();
    	    List titleFinishedProduct = service.titleFinishedProduct();
    	    List titleQualityControl = service.titleQualityControl();
    	    
    	    model.addAttribute("Announcement",titleAnnouncement);
    	    model.addAttribute("GeneralBulletinBoard",titleGeneralBulletinBoard);
    	    model.addAttribute("FinishedProduct",titleFinishedProduct);
    	    model.addAttribute("QualityControl",titleQualityControl);

            User_DTO user = (User_DTO) session.getAttribute("user");
            if (user != null) {
                userRole = user.getJob();
                userName = user.getUserName(); 
                helloUser = userRole + " " + userName + "님, 환영합니다!";
            }

            // Tiles 설정에 따른 view 지정
            mv.setViewName("index");
            mv.addObject("userId", userId);
            mv.addObject("helloUser", helloUser);
        } else {
            mv.setViewName("redirect:/login");
        }

        return mv;
    }
}
