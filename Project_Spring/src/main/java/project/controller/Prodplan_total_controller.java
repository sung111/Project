package project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
    @Autowired
    private Prodplan_service prodplan_service;

    @GetMapping("/prodplan")
    public String showProductionPlan(HttpSession session, Model model) {

        // 로그인 사용자 이름 가져오기
        String username = (String) session.getAttribute("username");
        model.addAttribute("username", username);

        // 세션에서 생산 계획 리스트 가져오기
        List<ProductionPlan_DTO> planList = (List<ProductionPlan_DTO>) session.getAttribute("planList");
        if (planList == null) {
            planList = prodplanService.getAllPlans();
            session.setAttribute("planList", planList);
        }
        model.addAttribute("planList", planList);

        return "ProdPlan";  
    }

    // 생산계획 추가
    @PostMapping("/prodplan/insert")
    @ResponseBody
    public String insertPlan(@RequestBody ProductionPlan_DTO dto) {
        try {
            prodplanService.insertPlan(dto);
            return "success";
        } catch (Exception e) {
            return "fail: " + e.getMessage();
        }
    }

    // 상품 리스트 검색 (자동 완성용)
    @GetMapping("/prodplan/products")
    @ResponseBody
    public List<ProductionPlan_DTO> getProductList(@RequestParam String searchTerm) {
        // 검색어에 해당하는 상품 반환
        return prodplanService.getProducts(searchTerm);  
    }

    @PostMapping("/prodplan/update")
    public String updateProdPlan(ProductionPlan_DTO productionPlanDTO) {
        prodplan_service.updatePlan(productionPlanDTO);
        return "redirect:/prodplan/list"; 
    }

    
    // 생산계획 삭제
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
    
    // 생산 계획 세부 정보 조회 (planId로 조회)
    @GetMapping("/prodplan/details/{planId}")
    public String getPlanDetails(@PathVariable("planId") int planId, Model model) {
        // planId로 생산계획 세부 정보를 가져오기
        ProductionPlan_DTO planDetails = prodplanService.getPlanDetails(planId);
        if (planDetails != null) {
            model.addAttribute("planDetails", planDetails);
        } else {
            model.addAttribute("error", "해당 생산계획을 찾을 수 없습니다.");
        }
        return "prodplan/planDetails";  // 'prodplan/planDetails.jsp'로 전달
    }
}
