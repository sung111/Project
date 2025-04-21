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
        // 세션에서 사용자 정보 가져오기
        String username = (String) session.getAttribute("username");
        model.addAttribute("username", username);

        // 세션에서 planList 가져오기
        List<ProductionPlan_DTO> planList = (List<ProductionPlan_DTO>) session.getAttribute("planList");
        if (planList == null) {
            // 세션에 데이터가 없으면 DB에서 조회
            planList = prodplanService.getAllPlans();
            // 세션에 planList를 저장
            session.setAttribute("planList", planList);
        }

        // planList를 Model에 추가
        model.addAttribute("planList", planList);

        return "ProdPlan";
    }

    
}
