package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.WorkOrder_DAO;
import dto.WorkOrder_DTO;

/**
 * 작업지시서 컨트롤러
 */
@WebServlet("/WorkOrder_controller")
public class WorkOrder_controller extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // OrderId를 파라미터로 받아옴
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        
        // WorkOrder_DAO 객체 생성
        WorkOrder_DAO dao = new WorkOrder_DAO();
        
        // DAO에서 주문 정보 조회
        WorkOrder_DTO workOrder = dao.getWorkOrderDetails(orderId);
        
        if (workOrder != null && workOrder.getProduct() != null) {
            System.out.println("Product info: " + workOrder.getProduct().getProductname());
        } else {
            System.out.println("No product information available.");
        }

        // workOrder 객체를 request에 저장
        request.setAttribute("workOrder", workOrder);
        
        // JSP로 포워딩
        request.getRequestDispatcher("workorder.jsp").forward(request, response);
    }
}

