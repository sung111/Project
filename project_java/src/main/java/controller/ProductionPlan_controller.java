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
        String action = request.getParameter("action");

        if (action == null || action.isEmpty()) {
            // 기본 동작: 전체 목록 가져오기
            List<ProductionPlan_DTO> planList = productionPlanDAO.getAllProductionPlans();
            if (planList != null) {
                request.setAttribute("planList", planList);
            } else {
                request.setAttribute("errorMessage", "생산 계획을 불러오는 데 실패했습니다.");
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("/ProdPlan.jsp");
            dispatcher.forward(request, response);
        } else if ("view".equals(action)) {
            // 특정 계획 보기
            try {
                int planId = Integer.parseInt(request.getParameter("planId"));
                ProductionPlan_DTO plan = productionPlanDAO.getProductionPlanById(planId);
                if (plan != null) {
                    request.setAttribute("plan", plan);
                } else {
                    request.setAttribute("errorMessage", "해당 계획을 찾을 수 없습니다.");
                }
                RequestDispatcher dispatcher = request.getRequestDispatcher("/ViewPlan.jsp");
                dispatcher.forward(request, response);
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "유효하지 않은 계획 ID입니다.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
                dispatcher.forward(request, response);
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            // 업데이트 처리
            try {
                int planId = Integer.parseInt(request.getParameter("planId"));
                String planStatus = request.getParameter("planStatus");
                String planNotes = request.getParameter("planNotes");

                boolean success = productionPlanDAO.updateProductionPlan(planId, planStatus, planNotes);

                if (success) {
                    response.sendRedirect("ProductionPlan_controller");
                } else {
                    response.sendRedirect("error.jsp");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect("error.jsp");
            }
        } else if ("add".equals(action)) {
            // 새로운 계획 추가
            String planName = request.getParameter("planName");
            String planStatus = request.getParameter("planStatus");

            boolean success = productionPlanDAO.addProductionPlan(planName, planStatus);

            if (success) {
                response.sendRedirect("ProductionPlan_controller");
            } else {
                response.sendRedirect("error.jsp");
            }
        }
    }
}
