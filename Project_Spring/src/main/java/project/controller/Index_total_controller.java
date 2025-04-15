package project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.dto.User_DTO;
import project.service.Users_total_service.User_service;

//Index_total_controller.java
@Controller
@RequestMapping("/")
public class Index_total_controller {

 @Autowired
 User_service user_service;

 @GetMapping("index")
 public ModelAndView index(HttpSession session) {
     // 세션에서 userId 가져오기
     String userId = (String) session.getAttribute("userId");
     
     // ModelAndView 객체 생성
     ModelAndView Loginmv = new ModelAndView();

     if (userId != null) {
         // userId가 세션에 존재하는 경우
         String helloUser = "로그인이 필요한 서비스입니다.";  // 기본 메시지 설정
         String userRole = "";
         String userName = "";

         // 세션에서 유저 정보 가져오기
         User_DTO user = (User_DTO) session.getAttribute("user");
         if (user != null) {
             // 유저 정보가 있으면
             userRole = user.getJob();  
             userName = user.getUserName(); 
             helloUser = userRole + " " + userName + "님, 환영합니다!"; 
         }

         // ModelAndView에 데이터 추가
         Loginmv.setViewName("index"); 
         Loginmv.addObject("userId", userId);  
         Loginmv.addObject("helloUser", helloUser); 
     } else {
         // userId가 세션에 존재하지 않는 경우 로그인 페이지로 리다이렉트
         Loginmv.setViewName("redirect:/login");
     }

     return Loginmv;  
 }
}
