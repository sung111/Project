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
/**
 * 완제품 BOM 컨트롤러
 */
@WebServlet("/Finished_Product_BOM")
public class Finished_Product_BOM extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		System.out.println("Finished_Product_BOM doGet 페이지가 실행중입니다");
		HttpSession session = request.getSession();
		String Field = (String)session.getAttribute("Field");
		System.out.println("Field ="+ Field);
		request.setAttribute("Field", Field);
		//전체 셀렉트후 출력
		
		Products_DAO products_DAO = new Products_DAO();
		List slectall = products_DAO.selectProducts();
		request.setAttribute("slectall", slectall);
		
		try {
			String url = "bom_v2.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			
		}catch (Exception e) {
			e.printStackTrace();
		}{
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		System.out.println("Finished_Product_BOM doPost 페이지가 실행중입니다");
		
		try {
			String url = "Finished_Product_BOM";
			
			response.sendRedirect(url);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
