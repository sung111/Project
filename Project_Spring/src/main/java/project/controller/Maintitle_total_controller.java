package project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class Maintitle_total_controller {

	@GetMapping("/maintitle")
	public String maintitle() {
	    return "maintitle";
	}

}
