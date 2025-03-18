package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Inventorycheck_DAO;
import dto.Performance_DTO;

/**
 * 재고현황조회
 */
@WebServlet("/Inventorycheck")
public class Inventorycheck_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Inventorycheck_DAO checkDAO = new Inventorycheck_DAO(); List<Performance_DTO>
		resultList = checkDAO.selectcheck();
		
		request.setAttribute("resultList", resultList);
		System.out.println("resultList : " +  resultList);
		String url = "/WEB-INF/Inventorycheck.jsp";
		request.getRequestDispatcher(url).forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
