package project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.dto.Products_DTO;
import project.dto.WorkOrder_DTO;
import project.service.Workorder_total_service.Workorder_service;

@Controller
public class Workorder_total_controller {

    @Autowired
    private Workorder_service workorderService;

    @RequestMapping("/prodplan/workorder")
    public String showWorkOrder(Model model) {
        WorkOrder_DTO workOrder = workorderService.getWorkOrderById(39);
        model.addAttribute("workOrder", workOrder);

        List<Products_DTO> products = workorderService.getProducts();
        model.addAttribute("productList", products);

        return "WorkOrder"; 
    }
    
    @RequestMapping("/prodplan/getProductDetails")
    public String getProductDetails(@RequestParam("productName") String productName, Model model) {
        Products_DTO product = workorderService.getProductByName(productName);

        if (product != null) {
            model.addAttribute("lotno", product.getLotnumber());
            model.addAttribute("unit", product.getUnit());
        } else {
            model.addAttribute("error", "제품을 찾을 수 없습니다.");
        }

        return "WorkOrder"; 
    }
}
