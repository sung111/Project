package project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import project.dto.WorkOrder_DTO;

@Controller
public class Workorder_total_controller {


    @GetMapping("prodplan/workorder")
    public String showWorkOrder(
        @RequestParam(value = "id", required = false) Integer workorderId, 
        Model model
    ) {
        // workorderId가 제공되었을 경우 데이터 가져오기
        WorkOrder_DTO workOrder = null;


        // JSP에 전달
        model.addAttribute("workOrder", workOrder);

        return "WorkOrder";
    }
}

