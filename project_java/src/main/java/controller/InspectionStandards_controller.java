package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		HttpSession session = request.getSession();
		String Field = (String)session.getAttribute("Field");
		System.out.println("Field ="+ Field);
		request.setAttribute("Field", Field);
		
		String serchvalue =request.getParameter("serchvalue");
		String type =request.getParameter("type");
		Products_DTO products_DTO = new Products_DTO();	
		System.out.println("type ="+type);
		System.out.println("serchvalue ="+serchvalue);
		
		Products_DAO products_DAO = new Products_DAO();	
		
		if(type == null || serchvalue.isEmpty()) {
			System.out.println("전체조회 시작");
			//전체조회
			List selectval = products_DAO.selectProducts();
			request.setAttribute("selectval", selectval);
	
		}else if(type.equals("search") ) {
			System.out.println("이름조회시작");
			//이름조회
		products_DTO.setProductname(serchvalue);
		List selectval =products_DAO.selectProductnameserch(products_DTO);
		request.setAttribute("selectval", selectval);
		}
		
		
		
		
		String url = "Inspection_standards.jsp";
		request.getRequestDispatcher(url).forward(request, response);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		Products_DAO products_DAO = new Products_DAO();
		Products_DTO products_DTO = new Products_DTO();
		
		System.out.println("InspectionS doPost실행중");
		
		int product_select = Integer.parseInt(request.getParameter("product_select"));
		String file_value = request.getParameter("file_value");
		String normalcriteria_value = request.getParameter("normalcriteria_value");
		String abnormalcriteria_value = request.getParameter("abnormalcriteria_value");
		
		products_DTO.setProductid(product_select);
		products_DTO.setProductimage(file_value);
		products_DTO.setNormalcriteria(normalcriteria_value);
		products_DTO.setAbnormalcriteria(abnormalcriteria_value);
		
//		System.out.println("product_select :"+product_select);
//		System.out.println("file_value :"+file_value);
//		System.out.println("normalcriteria_value :"+normalcriteria_value);
//		System.out.println("abnormalcriteria_value :"+abnormalcriteria_value);
		
		products_DAO.updateProductsInspection(products_DTO);
		
		String url = "InspectionS";
		response.sendRedirect(url);
		
	}

}
