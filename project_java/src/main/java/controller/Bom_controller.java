package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Materials_DAO;
import dto.Materials_DTO;

/**
 * BOM컨트롤러
 */
@WebServlet("/Bom_controller")
public class Bom_controller extends HttpServlet {

       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		Materials_DAO materials_DAO = new Materials_DAO(); 
		Materials_DTO materials_DTO = new Materials_DTO();
		try {
			String namevalue = request.getParameter("namevalue");
			String pvalue = request.getParameter("pvalue");
			System.out.println("namevalue"+namevalue);
			System.out.println("pvalue"+pvalue);
			request.setAttribute("namevalue", namevalue);
			request.setAttribute("pvalue", pvalue);
			
			
			if(namevalue.equals("부대찌개")) {
				System.out.println("doGet음식이름 ="+namevalue);
				System.out.println("doGet음식벨류 ="+pvalue);
				materials_DTO.setProduct_material_id(Integer.parseInt(pvalue));
				List total = materials_DAO.selectFM(materials_DTO);
				request.setAttribute("total", total);
				
			}
			
			
			
			
			String url = "bomlist.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		
	}

}
