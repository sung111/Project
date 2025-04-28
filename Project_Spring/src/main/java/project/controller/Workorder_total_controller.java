package project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.service.Workorder_total_service.Workorder_service;
import project.dto.WorkOrder_DTO;
import project.dto.Products_DTO;

import java.util.List;

@Controller
public class Workorder_total_controller {

    @Autowired
    private Workorder_service workorderService;

    @RequestMapping("/prodplan/workorder")
    public String showWorkOrder(Model model) {
        // orderId가 39인 작업지시서 + 제품정보 가져오기
        WorkOrder_DTO workOrder = workorderService.getWorkOrderById(39);
        model.addAttribute("workOrder", workOrder);

        // 전체 상품 목록 가져오기
        List<Products_DTO> products = workorderService.getProducts();
        model.addAttribute("productList", products);

        return "WorkOrder"; // WorkOrder.jsp
    }
}
