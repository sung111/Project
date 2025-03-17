package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductionPlan_DAO;
import dto.ProductionPlan_DTO;

/**
 * 생산계획 컨트롤러
 */
@WebServlet("/ProductionPlan_controller")
public class ProductionPlan_controller extends HttpServlet {

    private ProductionPlan_DAO productionPlanDAO = new ProductionPlan_DAO();
    
    // GET 요청 처리: 생산 계획 목록을 받아서 JSP에 전달
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // DB에서 prodplan을 가져온다.
        List<ProductionPlan_DTO> planList = productionPlanDAO.getAllProductionPlans();
        
        // 요청 속성에 데이터 저장
        request.setAttribute("planList", planList);

        // ProdPlan.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/ProdPlan.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // POST 처리 로직 추가 가능
    	String action = request.getParameter("action");
        if ("update".equals(action)) {
            // 폼에서 전달된 데이터 수집
            int planId = Integer.parseInt(request.getParameter("planId"));
            String planStatus = request.getParameter("planStatus");
            String planNotes = request.getParameter("planNotes");

            // DAO를 이용해 업데이트 수행
            boolean success = productionPlanDAO.updateProductionPlan(planId, planStatus, planNotes);

            if (success) {
                System.out.println("업데이트 성공: Plan ID " + planId);
            } else {
                System.out.println("업데이트 실패: Plan ID " + planId);
            }
            
            // 업데이트 후 목록 페이지로 리디렉트
            response.sendRedirect("ProductionPlan_controller");
        }
    }
}
