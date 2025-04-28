package project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
        return "WorkOrder";
    }

}
