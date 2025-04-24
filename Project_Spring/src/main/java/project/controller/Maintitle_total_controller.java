package project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/maintitle")
public class Maintitle_total_controller {

    @GetMapping("/{page}")
    public String loadMaintitlePage(@PathVariable("page") String page) {
        return "maintitle/" + page;
    }
}

