package project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import project.dto.ProductionPlan_DTO;
import project.service.Prodplan_total_service.Prodplan_service;

@Controller
public class Prodplan_total_controller {

    @Autowired
    private Prodplan_service prodplanService;

    @GetMapping("/prodplan")
    public void showProductionPlan(HttpSession session, Model model,
                                   HttpServletRequest request,
                                   HttpServletResponse response) throws ServletException, IOException {

        // 사용자명 세션에서 가져오기
        String username = (String) session.getAttribute("username");
        request.setAttribute("username", username);

        // 생산계획 리스트 가져오기
        List<ProductionPlan_DTO> planList = (List<ProductionPlan_DTO>) session.getAttribute("planList");
        if (planList == null) {
            planList = prodplanService.getAllPlans();
            session.setAttribute("planList", planList);
        }

        request.setAttribute("planList", planList);

        // Tiles 우회: 직접 JSP로 forward (뷰리졸버 무시)
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/ProdPlan.jsp");
        dispatcher.forward(request, response);
    }
}
