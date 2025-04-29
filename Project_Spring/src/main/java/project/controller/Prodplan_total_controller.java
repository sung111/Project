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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.dto.ProductionPlan_DTO;
import project.dto.Products_DTO;
import project.service.Prodplan_total_service.Prodplan_service;

@Controller
public class Prodplan_total_controller {

    @Autowired
    private Prodplan_service prodplanService;
    @Autowired
    private Prodplan_service prodplan_service;

    @GetMapping("/prodplan")
    public String showProductionPlan(HttpSession session, Model model) {

        // �α��� ����� �̸� ��������
        String username = (String) session.getAttribute("username");
        model.addAttribute("username", username);

        // ���ǿ��� ���� ��ȹ ����Ʈ ��������
        List<ProductionPlan_DTO> planList = (List<ProductionPlan_DTO>) session.getAttribute("planList");
        if (planList == null) {
            planList = prodplanService.getAllPlans();
            session.setAttribute("planList", planList);
        }
        model.addAttribute("planList", planList);

        return "ProdPlan";  
    }

    // �����ȹ �߰�
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

    // ��ǰ ����Ʈ �˻�
    @GetMapping("/prodplan/products")
    @ResponseBody
    public List<ProductionPlan_DTO> getProductList(@RequestParam String searchTerm) {
        // �˻�� �ش��ϴ� ��ǰ ��ȯ
        return prodplanService.getProducts(searchTerm);  
    }

    @PostMapping("/prodplan/update")
    public String updateProdPlan(ProductionPlan_DTO productionPlanDTO) {
        prodplan_service.updatePlan(productionPlanDTO);
        return "redirect:/prodplan/list"; 
    }

    
    // �����ȹ ����
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
    
    // ���� ��ȹ ���� ���� ��ȸ (planId�� ��ȸ)
    @GetMapping("/prodplan/details/{planId}")
    public String getPlanDetails(@PathVariable("planId") int planId, Model model) {
        // planId�� �����ȹ ���� ������ ��������
        ProductionPlan_DTO planDetails = prodplanService.getPlanDetails(planId);
        if (planDetails != null) {
            model.addAttribute("planDetails", planDetails);
        } else {
            model.addAttribute("error", "�ش� �����ȹ�� ã�� �� �����ϴ�.");
        }
        return "prodplan/planDetails"; 
    }
    
    //���������̼�
    @RequestMapping("/list")
    public String getProdPlanList(@RequestParam(defaultValue = "1") int pageNo, 
                                  @RequestParam(defaultValue = "10") int viewCount, 
                                  Model model) {
        int totalCount = prodplanService.getTotalCount(); 
        List<ProductionPlan_DTO> prodPlans = prodplanService.getProdPlanList(pageNo, viewCount);  
        int lastPage = (int) Math.ceil((double) totalCount / viewCount);
        
        // ������ �׺���̼��� ���� �������� �� ������ ���
        int startPage = ((pageNo - 1) / 5) * 5 + 1; 
        int endPage = Math.min(startPage + 4, lastPage);

        // �𵨿� ������ �߰�
        model.addAttribute("prodPlans", prodPlans);  
        model.addAttribute("pageNo", pageNo);       
        model.addAttribute("lastPage", lastPage);    
        model.addAttribute("startPage", startPage); 
        model.addAttribute("endPage", endPage);    
        model.addAttribute("totalCount", totalCount);

        return "prodPlanList";
    }

}
