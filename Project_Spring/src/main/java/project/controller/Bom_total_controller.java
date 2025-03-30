package project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.MaterialsProducts_DAO;
import dao.Materials_DAO;
import dao.Products_DAO;
import project.service.Materials_service;
import project.service.Products_service;
//자 여기는 bom,재고,관련된 controller입니다 싹다 몰아주세요 
@Controller
public class Bom_total_controller {

	@Autowired
	Materials_service materials_service;
	@Autowired
	Products_service Products_service;
	
	
	@RequestMapping("/standard")
	public String standard(Model model, @RequstParam(value="view_value",required=true)) {

		List resultList = materials_service.selectMaterials();
		List finishiList = Products_service.selectProducts();
		model.addAttribute("resultList",resultList);
		model.addAttribute("finishiList",finishiList);
		
		
		HttpSession session = request.getSession();
		String Field = (String)session.getAttribute("Field");
		System.out.println("Field ="+ Field);
		String id = (String)session.getAttribute("id");
		try {

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
			
			}else if(viewValue.equals("2")) {
				System.out.println("2번완제품조회");
				System.out.println("2번 viewValue 값"+viewValue);
				Products_DAO products_DAO = new Products_DAO();
				List finishiList = products_DAO.selectProducts();
				request.setAttribute("finishiList", finishiList);
				
			}else if(viewValue.equals("3")) {
				List resultList = materialsProducts_DAO.selectMaterialsProducts();
				request.setAttribute("resultList", resultList);
				
	
			}
			request.setAttribute("Field", Field);
			request.setAttribute("viewValue", viewValue);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "standard";
	}
	
	@RequestMapping("/inspectionStandards")
	public String inspectionStandards() {
		
		return "inspectionStandards";
	}
	
	@RequestMapping("/production_process")
	public String production_process() {
		
		return "production_process";
	}
	
	@RequestMapping("/bom_v2")
	public String Bom_v2() {
		
		return "bom_v2";
	}
	
	@RequestMapping("/bomlist")
	public String Bomlist() {
		
		return "bomlist";
	}
	
	

	
	
	
	
}
