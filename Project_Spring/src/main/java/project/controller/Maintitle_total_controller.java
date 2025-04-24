package project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/maintitle")
public class Maintitle_total_controller {

	@GetMapping
	public String loadMaintitlePage() {
	    return "MainTitle"; 
	}

    // 페이지명 기반 경로 처리
    @GetMapping("/{page}")
    public String loadMaintitlePage(@PathVariable("page") String page) {
        return "MainTitle/" + page;  
    }
}

