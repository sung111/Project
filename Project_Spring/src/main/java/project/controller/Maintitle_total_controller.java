package project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/maintitle")
public class Maintitle_total_controller {

    @GetMapping
    public String MainTitle() {
    	
    	
    	 // WEB-INF/views/MainTitle.jsp로 이동
        return "MainTitle";
    }
}

