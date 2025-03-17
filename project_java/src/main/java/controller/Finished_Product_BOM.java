package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 완제품 BOM 컨트롤러
 */
@WebServlet("/Finished_Product_BOM")
public class Finished_Product_BOM extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		System.out.println("part_code doGet 페이지가 실행중입니다");
		
		
		
		String url = "bom_v2.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String url = "Finished_Product_BOM";

		response.sendRedirect(url);
	}

}
