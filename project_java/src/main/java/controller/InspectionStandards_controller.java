package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Products_DAO;
import dto.Products_DTO;

/**
 * 검사기준 컨트롤러
 */

@WebServlet("/InspectionS")
public class InspectionStandards_controller extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		System.out.println("검사기준 페이지가 실행중입니다");
		
		//전체조회
		Products_DAO products_DAO = new Products_DAO();	
		List selectval = products_DAO.selectProducts();
		request.setAttribute("selectval", selectval);
		
		//이름조회
		
		
		
		
		String url = "Inspection_standards.jsp";
		request.getRequestDispatcher(url).forward(request, response);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String type = request.getParameter("type");
		Products_DAO products_DAO = new Products_DAO();
		Products_DTO products_DTO = new Products_DTO();
		if(type.equals("creat")) {
		
			
		}
		
		
	}

}
