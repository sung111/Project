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
 * 부품 코드 컨트롤러입니다
 */
@WebServlet("/part_code")
public class PartCode_controller extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		System.out.println("part_code doGet 페이지가 실행중입니다");
		
		try {
			Materials_DAO materials_DAO = new Materials_DAO();
			List resultList = materials_DAO.selectMaterials();
			request.setAttribute("resultList", resultList);
			
			if("view_value".equals("1")) {
				String aa = request.getParameter("view_value");
				System.out.println(aa);
				request.setAttribute("resultList", resultList);
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		

		
		
		
		String url = "standard.jsp";
		request.getRequestDispatcher(url).forward(request, response);
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		System.out.println("part_code doPost 페이지가 실행중입니다");
		Materials_DTO materials_DTO = new Materials_DTO();
		Materials_DAO materials_DAO = new Materials_DAO();
		
		try {
			
			String type = request.getParameter("type");
			
			
				if(type.equals("creat")) {
					System.out.println("원재료생성됨");
					String materialname = request.getParameter("materialname");
					String price = request.getParameter("price");
					String spec = request.getParameter("spec");
					String unit = request.getParameter("unit");
					String supplier = request.getParameter("supplier");
					String partNumber = request.getParameter("partNumber");
					String lotnumber = request.getParameter("lotnumber");
					String warehouse = request.getParameter("warehouse");
					
					materials_DTO.setMaterialname(materialname);
					materials_DTO.setPrice(Integer.parseInt(price));
					materials_DTO.setSpec(spec);
					materials_DTO.setUnit(unit);
					materials_DTO.setSupplier(supplier);
					materials_DTO.setPartNumber(partNumber);
					materials_DTO.setLotnumber(lotnumber);
					materials_DTO.setWarehouse(warehouse);
					int result = materials_DAO.insertMaterials(materials_DTO);
					
				}else if (type.equals("update")){
					String materialname2 = request.getParameter("materialname2");
					String price2 = request.getParameter("price2");
					String spec2 = request.getParameter("spec2");
					String unit2= request.getParameter("unit2");
					String supplier2 = request.getParameter("supplier2");
					String partNumber2 = request.getParameter("partNumber2");
					String lotnumber2 = request.getParameter("lotnumber2");
					String warehouse2 = request.getParameter("warehouse2");
					
					System.out.println(materialname2);
					System.out.println(price2);
					System.out.println(spec2);
					System.out.println(unit2);
					System.out.println(supplier2);
					System.out.println(partNumber2);
					System.out.println(lotnumber2);
					System.out.println(warehouse2);
					
					
					
					materials_DTO.setMaterialname(materialname2);
					materials_DTO.setPrice(Integer.parseInt(price2));
					materials_DTO.setSpec(spec2);
					materials_DTO.setUnit(unit2);
					materials_DTO.setSupplier(supplier2);
					materials_DTO.setPartNumber(partNumber2);
					materials_DTO.setLotnumber(lotnumber2);
					materials_DTO.setWarehouse(warehouse2);
					materials_DAO.updateMaterials(materials_DTO);
					
				}
				
		
			
			
		
			
		}catch (Exception e) {
			System.err.println("버그발생 doPost");
			e.printStackTrace();
		}
		
		String url = "part_code";
//		request.getRequestDispatcher(url).forward(request, response);
		response.sendRedirect(url);
	}

}
