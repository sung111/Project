package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Bom_DAO;
import dao.Materials_DAO;
import dto.Bom_DTO;
import dto.Materials_DTO;

/**
 * BOM컨트롤러
 */
@WebServlet("/Bom_controller")
public class Bom_controller extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		System.out.println("doget 실행");

		Materials_DAO materials_DAO = new Materials_DAO(); 
		Materials_DTO materials_DTO = new Materials_DTO();
		Bom_DAO bom_DAO = new Bom_DAO();
		Bom_DTO bom_DTO = new Bom_DTO();
		try {
			String namevalue = request.getParameter("namevalue");
			String pvalue = request.getParameter("pvalue"); 
//			System.out.println("namevalue"+namevalue);
//			System.out.println("pvalue"+pvalue);
			request.setAttribute("namevalue", namevalue);
			request.setAttribute("pvalue", pvalue);
			System.out.println("pvalue 값은: "+ pvalue);
			// 여기서 bom_v2와 post에서 값을 받아옴 
			//값을 못받음 
			materials_DTO.setBom_pr_id(Integer.parseInt(pvalue));
			
			List total = materials_DAO.selectFM(materials_DTO);
			request.setAttribute("total", total);
			
			List mname = materials_DAO.selectMaterials();
			request.setAttribute("mname", mname);
			
			List bomid = bom_DAO.selectBOM();
			request.setAttribute("bomid", bomid);
		
			
			
			
			String url = "bomlist.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		System.out.println("dopost 실행");
		
		String type = request.getParameter("type");
		String materials = request.getParameter("materialsid");
		
		String pvalue = request.getParameter("pvalueid");
		request.setAttribute("pvalue", pvalue);
		    
		
		
		
		//여기서 값을 넣고 get로 전송
		System.out.println("pvalue 값은 "+pvalue);
		Bom_DAO bom_DAO = new Bom_DAO();
		Bom_DTO bom_DTO = new Bom_DTO();
		
		
		try {
			if(type.equals("insert")) {
				String input_quantity = request.getParameter("input_quantity");
				System.out.println("bom insert실행");
				bom_DTO.setMaterialid(Integer.parseInt(materials));
				bom_DTO.setQuantity(Double.parseDouble(input_quantity));
				bom_DTO.setProductid(Integer.parseInt(pvalue));
				bom_DAO.insertBom(bom_DTO);
				
			}else if(type.equals("delet")) {
				int bomid = Integer.parseInt(request.getParameter("bomid"));   
				System.out.println("bom삭제실행");
				bom_DTO.setBomid(bomid);
				bom_DAO.deleteBom(bom_DTO);
					
			}else if(type.equals("update")) {
				System.out.println("bom업데이트실행");
				double quan_value =  Double.parseDouble(request.getParameter("quan_value"));
				int bomid = Integer.parseInt(request.getParameter("bomid"));   
				bom_DTO.setQuantity(quan_value);
				bom_DTO.setBomid(bomid);
				bom_DAO.updateBom(bom_DTO);
				System.out.println("quan_value값은 :"+quan_value);
				System.out.println("bomid값은 :"+bomid);
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		String url = "Bom_controller?pvalue="+pvalue;
		response.sendRedirect(url);
	}
}
