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
			
			if("generation".equals("원재료생성")) {
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
			}
			
//			System.out.println("materialname :"+ materialname );
//			System.out.println("price :"+price);
//			System.out.println("spec :"+spec);
//			System.out.println("unit :"+unit);
//			System.out.println("supplier :"+supplier);
//			System.out.println("partNumber :"+partNumber);
//			System.out.println("lotnumber :"+lotnumber);
//			System.out.println("warehouse :"+warehouse);			
			
		}catch (Exception e) {
			System.err.println("버그발생 doPost");
			e.printStackTrace();
		}
		
		String url = "part_code";
//		request.getRequestDispatcher(url).forward(request, response);
		response.sendRedirect(url);
	}

}
