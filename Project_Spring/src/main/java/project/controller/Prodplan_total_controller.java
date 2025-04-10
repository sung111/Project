package project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

import project.dto.ProductionPlan_DTO;
import project.service.Prodplan_total_service.Prodplan_service;

@Controller
public class Prodplan_total_controller {

    @Autowired
    private Prodplan_service prodplanService;

    @GetMapping("/prodplan")
    public String showProductionPlan(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        model.addAttribute("username", username);

        // 서비스에서 계획 목록 가져오기
        List<ProductionPlan_DTO> planList = prodplanService.getAllPlans();
        model.addAttribute("planList", planList);

        return "ProdPlan";
    }
    
    @GetMapping("/test-prodplan")
    public String testRoute() {
        System.out.println(" Prodplan 컨트롤러 매핑 성공!");
        return "ProdPlan"; 
    }
    
}
