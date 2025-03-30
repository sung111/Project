package project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import project.service.Standard_total_service.MaterialsProducts_service;
import project.service.Standard_total_service.Materials_service;
import project.service.Standard_total_service.Products_service;
//자 여기는 bom,재고,관련된 controller입니다 싹다 몰아주세요 
@Controller
public class Bom_total_controller {

	@Autowired
	Materials_service materials_service;
	@Autowired
	Products_service Products_service;
	@Autowired
	MaterialsProducts_service materialsProducts_service;
	
	
	
//	@RequestMapping("/standard" )
	@RequestMapping(value="/standard",method=RequestMethod.GET)
	public String standard(Model model,@RequestParam(value="view_value", required=false)String view_value,
			HttpSession httpSession) {

//		String Field = (String)httpSession.getAttribute("Field");
		String Field = "ADMIN";
		String id = (String)httpSession.getAttribute("id");
		System.out.println("Field ="+ Field);
		
		try {

			System.out.println("---------view_value :"+view_value);
			if(view_value == null) {
				view_value = "1";
				System.out.println("view_value 널이벤트값 :"+view_value);
			}
			if(view_value.equals("1")) {
				System.out.println("1번원재료조회");
				System.out.println("1번 view_value 값"+view_value);
				List resultList = materials_service.selectMaterials();
				model.addAttribute("resultList",resultList);
			}else if(view_value.equals("2")) {
				System.out.println("2번완제품조회");
				System.out.println("2번 view_value 값"+view_value);
				List finishiList = Products_service.selectProducts();
				model.addAttribute("finishiList",finishiList);
			}else if(view_value.equals("3")) {
				System.out.println("3번완제품조회");
				List resultList = materialsProducts_service.selectMaterialsProducts();
				model.addAttribute("resultList",resultList);
			}
			model.addAttribute("Field",Field);
			model.addAttribute("view_value",view_value);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "standard";
	}
	
//	원재료 생성, 삭제(수정) , 수정 
	@RequestMapping(value="/standard_insert",method=RequestMethod.POST)
	public String standardinsert() {
		
		return "forward:/standard";
	}
	@RequestMapping(value="/standard_delet",method=RequestMethod.PUT)
	public String standarddelet() {
		
		return "forward:/standard";
	}
	@RequestMapping(value="/standard_update",method=RequestMethod.PUT)
	public String standardupdate() {
		
		return "forward:/standard";
	}
	
//	완제품 생성, 삭제(수정) , 수정 
	@RequestMapping(value="/products_insert",method=RequestMethod.POST)
	public String productsinsert() {
		
		return "forward:/standard";
	}
	@RequestMapping(value="/products_delet",method=RequestMethod.PUT)
	public String productsddelet() {
		
		return "forward:/standard";
	}
	@RequestMapping(value="/products_update",method=RequestMethod.PUT)
	public String productsdupdate() {
		
		return "forward:/standard";
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
