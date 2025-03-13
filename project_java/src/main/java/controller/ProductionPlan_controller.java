package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 생산계획 컨트롤러
 */
@WebServlet("/ProductionPlan_controller")
public class ProductionPlan_controller extends HttpServlet {
	


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       // Plan 객체를 생성
//        Plan plan = new Plan();
        
        // getUserId() 메서드를 호출
//        String userId = plan.getUserId();
//		request.setAttribute("userId", getUserId());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/ProdPlan.jsp");
        dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
