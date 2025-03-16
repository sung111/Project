package controller;

import java.io.IOException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Products_DAO;
import dto.ProductionProcessDescription_DTO;
import dto.Products_DTO;
import dao.*;

/**
 * 생산공정 컨트롤러
 */
@WebServlet("/ProductionProcess_controller")
public class ProductionProcess_controller extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		System.out.println("ProductionProcess_controller doGet실행");
				Products_DAO products_DAO = new Products_DAO();	
				
				//프러턱트 이름조회 /아이디 조회
				List productvalue = products_DAO.selectProductname();
				request.setAttribute("productvalue", productvalue);
				System.out.println("productvalue :"+productvalue);
				
		
				ProductionProcessDescription_DAO productionProcessDescription_DAO = new ProductionProcessDescription_DAO();
				ProductionProcessDescription_DTO PPD_DTO = new ProductionProcessDescription_DTO();
				String select_value = request.getParameter("select_value");
				if(select_value == null) {
					System.out.println("milkits가 널이여서 1넣음");
					select_value = "1";
					PPD_DTO.setProductid(Integer.parseInt(select_value));
					List ppdvalue = productionProcessDescription_DAO.selectPPD(PPD_DTO);
					
					request.setAttribute("ppdvalue",ppdvalue);
				}
//				

		
				
			
				
				
				String url = "production_process.jsp";
				request.getRequestDispatcher(url).forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		System.out.println("ProductionProcess_controller doPost실행");
		ProductionProcessDescription_DAO productionProcessDescription_DAO = new ProductionProcessDescription_DAO();
		ProductionProcessDescription_DTO PPD_DTO = new ProductionProcessDescription_DTO();
		
		String select_value = request.getParameter("select_value");
		System.out.println("select_value 값 ="+select_value);
		
		PPD_DTO.setProductid(Integer.parseInt(select_value));
		System.out.println("Integer.parseInt(select_value)="+Integer.parseInt(select_value));
		List ppdvalue = productionProcessDescription_DAO.selectPPD(PPD_DTO);
		request.setAttribute("ppdvalue",ppdvalue);
	
		
		
			
		
//			System.out.println("milkits가"+milkits);
//			PPD_DTO.setProductid(Integer.parseInt(milkits));
//	
//		List ppdvalue = productionProcessDescription_DAO.selectPPD(PPD_DTO);
//		request.setAttribute("ppdvalue",ppdvalue);
		
		
		
		String url = "ProductionProcess_controller";
		response.sendRedirect(url);
	}

}
