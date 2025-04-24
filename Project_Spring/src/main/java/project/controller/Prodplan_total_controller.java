package project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.dto.ProductionPlan_DTO;
import project.service.Prodplan_total_service.Prodplan_service;

@Controller
public class Prodplan_total_controller {

    @Autowired
    private Prodplan_service prodplanService;

    @GetMapping("/prodplan")
    public String showProductionPlan(HttpSession session, Model model) {

        // 로그인 사용자 정보 가져오기
        String username = (String) session.getAttribute("username");
        model.addAttribute("username", username);

        // 세션에서 계획 리스트 가져오기
        List<ProductionPlan_DTO> planList = (List<ProductionPlan_DTO>) session.getAttribute("planList");
        if (planList == null) {
            planList = prodplanService.getAllPlans();
            session.setAttribute("planList", planList);
        }
        model.addAttribute("planList", planList);

        return "ProdPlan";  
    }

    @PostMapping("/prodplan/insert")
    public String insertPlan(@RequestBody ProductionPlan_DTO dto, Model model) {
        try {
            prodplanService.insertPlan(dto);
            model.addAttribute("success", true);
            return "successPage"; 
        } catch (Exception e) {
            model.addAttribute("success", false);
            model.addAttribute("message", e.getMessage());
            return "errorPage"; 
        }
    }

    // 상품 리스트를 자동으로 완성하게 한다.
    @GetMapping("/prodplan/products")
    @ResponseBody
    public List<ProductionPlan_DTO> getProductList(@RequestParam String searchTerm) {
        return prodplanService.getProducts(searchTerm);  // 검색어에 맞는 상품 반환
    }
}
