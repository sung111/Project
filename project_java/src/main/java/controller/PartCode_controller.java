package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Materials_DAO;
import dao.Products_DAO;
import dto.Materials_DTO;
import dao.*;
import dto.*;
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
//			List resultList = materials_DAO.selectMaterials();
//			request.setAttribute("resultList", resultList);
			
			
			String viewValue = request.getParameter("view_value");
			
			System.out.println("viewValue :"+viewValue);
			if(viewValue == null) {
				viewValue = "1";
				System.out.println("viewValue 널이벤트값 :"+viewValue);
			}
		
			if(viewValue.equals("1")) {
				System.out.println("1번원재료조회");
				System.out.println("1번 viewValue 값"+viewValue);
				List resultList = materials_DAO.selectMaterials();
				request.setAttribute("resultList", resultList);
				request.setAttribute("viewValue", viewValue);
			}else if(viewValue.equals("2")) {
				System.out.println("2번완제품조회");
				System.out.println("2번 viewValue 값"+viewValue);
				Products_DAO products_DAO = new Products_DAO();
				List finishiList = products_DAO.selectProducts();
				request.setAttribute("finishiList", finishiList);
				request.setAttribute("viewValue", viewValue);
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
		Products_DTO products_DTO = new Products_DTO();
		Products_DAO products_DAO = new Products_DAO();
		
		try {
			
			String type = request.getParameter("type");
			
			
				if(type.equals("creat")) {
					System.out.println("--원재료생성됨--");
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
					System.out.println("--원재료업데이트됨--");
					String originname = request.getParameter("origin");
					String materialname2 = request.getParameter("materialname2");
					String price2 = request.getParameter("price2");
					String spec2 = request.getParameter("spec2");
					String unit2= request.getParameter("unit2");
					String supplier2 = request.getParameter("supplier2");
					String partNumber2 = request.getParameter("partNumber2");
					String lotnumber2 = request.getParameter("lotnumber2");
					String warehouse2 = request.getParameter("warehouse2");
					

					materials_DTO.setMaterialname(materialname2);
					materials_DTO.setPrice(Integer.parseInt(price2));
					materials_DTO.setSpec(spec2);
					materials_DTO.setUnit(unit2);
					materials_DTO.setSupplier(supplier2);
					materials_DTO.setPartNumber(partNumber2);
					materials_DTO.setLotnumber(lotnumber2);
					materials_DTO.setWarehouse(warehouse2);
					materials_DTO.setOrigin(originname);
					
					materials_DAO.updateMaterials(materials_DTO);
					
				}else if (type.equals("del")){
					System.out.println("--원재료삭제됨--");
					String delvalue = request.getParameter("delvalue");
//					System.out.println("delvalue :"+ delvalue);
					materials_DTO.setMaterialname(delvalue);
					
					materials_DAO.deleteMaterials(materials_DTO);
					
				}else if (type.equals("finished_creat")){
					System.out.println("--완제품생성됨--");
					String productname = request.getParameter("productname");
					String partnumber = request.getParameter("partnumber");
					String warehouse = request.getParameter("warehouse");
					String price = request.getParameter("price");
					String spec = request.getParameter("spec");
					String unit = request.getParameter("unit");
					String lotnumber = request.getParameter("lotnumber");
					
	
					Products_DTO products = new Products_DTO();
					
					products.setProductname(productname);
					products.setPartnumber(partnumber);
					products.setWarehouse(warehouse);
					products.setPrice(Integer.parseInt(price));
					products.setSpec(spec);
					products.setUnit(unit);
					products.setLotnumber(lotnumber);
					
					products_DAO.insertProducts(products);
					
					
				}else if (type.equals("finish_del")){
					System.out.println("--완재료업삭제--");
					String delvalue = request.getParameter("delvalue");
					System.out.println("delvalue :"+ delvalue);
					products_DTO.setProductname(delvalue);
					products_DAO.deleteProducts(products_DTO);

				}else if (type.equals("finish_update")){
					System.out.println("--완재료업데이트됨--");
					
					String productname = request.getParameter("productname");
					String partnumber = request.getParameter("partnumber");
					String warehouse = request.getParameter("warehouse");
					String price = request.getParameter("price");
					String spec = request.getParameter("spec");
					String unit = request.getParameter("unit");
					String lotnumber = request.getParameter("lotnumber");
					String origin = request.getParameter("origin");
					
					
					
				
					
					products_DTO.setProductname(productname);
					products_DTO.setPartnumber(partnumber);
					products_DTO.setWarehouse(warehouse);
					products_DTO.setPrice(Integer.parseInt(price));
					products_DTO.setSpec(spec);
					products_DTO.setUnit(unit);
					products_DTO.setLotnumber(lotnumber);

					products_DTO.setOriginname(origin);
					
					products_DAO.updateProducts(products_DTO);
					System.out.println("--"+products_DAO.updateProducts(products_DTO));
				
					
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
