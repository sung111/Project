package project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

import project.dto.ProductionPlan_DTO;

@Controller
public class Prodplan_total_controller {



    @GetMapping("/prodplan")
    public String showProductionPlan(HttpSession session, Model model) {
        // 세션에서 사용자 이름 가져오기
        String username = (String) session.getAttribute("username");



        // JSP에서 사용할 데이터 모델에 추가
        model.addAttribute("username", username);
//        model.addAttribute("planList", planList);

        return "prodplan"; // prodplan.jsp로 이동
    }
}
