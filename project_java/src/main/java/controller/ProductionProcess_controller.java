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
				}else if(select_value != null) {
					System.out.println("select_value 값 ="+select_value);
					
					PPD_DTO.setProductid(Integer.parseInt(select_value));
					System.out.println("Integer.parseInt(select_value)="+Integer.parseInt(select_value));
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
		String type = request.getParameter("type");	
		System.out.println("type값은 ="+type);
		if(type.equals("new")) {
			System.out.println("생성");
			String new_processstage = request.getParameter("new_processstage");
			String new_description = request.getParameter("new_description");
			String new_equipment = request.getParameter("new_equipment");
			String new_hygiene = request.getParameter("new_hygiene");
			String new_pro_value = request.getParameter("new_pro_value");
		

			System.out.println("-----"+new_processstage);
			System.out.println("-----"+new_description);
			System.out.println("-----"+new_equipment);
			System.out.println("-----"+new_hygiene);
			System.out.println("-----"+new_pro_value);
			
			PPD_DTO.setProductid(Integer.parseInt(new_pro_value));
			PPD_DTO.setProcessstage(new_processstage);
			PPD_DTO.setDescription(new_description);
			PPD_DTO.setEquipment(new_equipment);
			PPD_DTO.setHygiene(new_hygiene);
			
			
			productionProcessDescription_DAO.insertPPD(PPD_DTO);
			
		}else if(type.equals("update")) {
			System.out.println("업데이트");
			int processid =Integer.parseInt(request.getParameter("processid"));
			String processstage =request.getParameter("processstage");
			String description = request.getParameter("description");
			String equipment = request.getParameter("equipment");
			String hygiene =request.getParameter("hygiene");
			PPD_DTO.setProcessid(processid);
			PPD_DTO.setProcessstage(processstage);
			PPD_DTO.setDescription(description);
			PPD_DTO.setEquipment(equipment);
			PPD_DTO.setHygiene(hygiene);
			productionProcessDescription_DAO.updatePPD(PPD_DTO);
			
			
			
		}else if(type.equals("delet")) {
			System.out.println("삭제");
			int processid_value =Integer.parseInt(request.getParameter("processid_value"));
			PPD_DTO.setProcessid(processid_value);
			productionProcessDescription_DAO.deletePPD(PPD_DTO);
		}
		

		
		
		
		String url = "ProductionProcess_controller";
		response.sendRedirect(url);
	}

}
