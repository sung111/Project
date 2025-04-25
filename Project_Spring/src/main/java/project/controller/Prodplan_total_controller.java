package project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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

        // 로그인 사용자 이름 불러오기
        String username = (String) session.getAttribute("username");
        model.addAttribute("username", username);

        // 세션에서 계획 리스트 불러오기
        List<ProductionPlan_DTO> planList = (List<ProductionPlan_DTO>) session.getAttribute("planList");
        if (planList == null) {
            planList = prodplanService.getAllPlans();
            session.setAttribute("planList", planList);
        }
        model.addAttribute("planList", planList);

        return "ProdPlan";  
    }

    //추가
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

    // 추가 시, 상품 리스트 자동 완성 처리.
    @GetMapping("/prodplan/products")
    @ResponseBody
    public List<ProductionPlan_DTO> getProductList(@RequestParam String searchTerm) {
    	// 검색어에 해당하는 상품 반환
        return prodplanService.getProducts(searchTerm);  
    }
    
    //수정
    @PostMapping("/prodplan/update")
    @ResponseBody
    public String updatePlan(@ModelAttribute ProductionPlan_DTO dto) {
        prodplanService.updatePlan(dto);
        return "success";
    }

    
    //삭제
    @PostMapping("/prodplan/delete")
    @ResponseBody
    public String deletePlan(@RequestParam("planId") int planId) {
        try {
            prodplanService.deletePlan(planId);
            return "success";
        } catch (Exception e) {
            return "fail: " + e.getMessage();
        }
    }

}
