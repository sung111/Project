package project.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.dto.Materials_DTO;
import project.dto.Products_DTO;
import project.service.Standard_total_service.MaterialsProducts_service;
import project.service.Standard_total_service.Materials_service;
import project.service.Standard_total_service.Products_service;
//자 여기는 bom,재고,관련된 controller입니다 싹다 몰아주세요 
//원재료 완제품 조회
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
			HttpSession httpSession,
			Materials_DTO materials_DTO,
			Products_DTO products_DTO) {

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
				Map map = materials_service.selectMaterials(materials_DTO);
				
				model.addAttribute("map",map);
				model.addAttribute("mDTO",materials_DTO);
				
				System.out.println("map : "+map +""+ "materials_DTO :"+materials_DTO);
				
			}else if(view_value.equals("2")) {
				System.out.println("2번완제품조회");
				System.out.println("2번 view_value 값"+view_value);
				
				Map map = Products_service.selectProducts(products_DTO);
				
				model.addAttribute("map",map);
				model.addAttribute("pDTO",products_DTO);
				
				System.out.println("map : "+map +""+ "products_DTO :"+products_DTO);
				
			}else if(view_value.equals("3")) {
				System.out.println("3번완제품조회");
				Map map = materialsProducts_service.selectMaterialsProducts(materials_DTO);
				
				model.addAttribute("map",map);
				model.addAttribute("materials_DTO",materials_DTO);
				
				System.out.println("map : "+map +""+ "materials_DTO :"+materials_DTO);
			}
			
			model.addAttribute("Field",Field);
			model.addAttribute("view_value",view_value);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "standard";
	}
	
//	원재료 생성, 삭제(수정) , 수정 
	//생성
	@ResponseBody
	@RequestMapping(value="/standard_insert",method=RequestMethod.POST)
	public int standardinsert(@RequestBody Materials_DTO materials_DTO ) {
		System.out.println("standard_insert 실행");
		System.out.println("materials_DTO 값은 ="+materials_DTO);
		int result = 0;
		try {			
			result = materials_service.insertMaterials(materials_DTO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("materials_insert_post :"+result);
		return result;
	}
	//수정
	@ResponseBody
	@RequestMapping(value="/standard_update",method=RequestMethod.PUT)
	public int standardupdate(@RequestBody Materials_DTO materials_DTO ) {
		System.out.println("standard_update 실행");
		System.out.println("materials_DTO 값은 ="+materials_DTO);
		int result = 0;
		try {			
			result = materials_service.updateMaterials(materials_DTO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("materials_update_put :"+result);
		return result;
	}
	
	//삭제
	@ResponseBody
	@RequestMapping(value="/standard_delet",method=RequestMethod.PUT)
	public int standarddelet(@RequestBody Materials_DTO materials_DTO) {
		System.out.println("standard_delet 실행");
		System.out.println("materials_DTO 값은 ="+materials_DTO);
		
		int result = 0;
		try {			
			result = materials_service.deleteMaterials(materials_DTO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("materials_update_put :"+result);
		return result;
		
		
	}
	
//	=====완제품 생성, 삭제(수정) , 수정 
	//생성
	@ResponseBody
	@RequestMapping(value="/products_insert",method=RequestMethod.POST)
	public int productsinsert(@RequestBody Products_DTO products_DTO ) {
		System.out.println("products_insert 실행");
		System.out.println("products_DTO 값은 ="+products_DTO);
		int result = 0;
		try {			
			result = Products_service.insertProducts(products_DTO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("products_insert_post :"+result);
		return result;
	}
	//수정
	@ResponseBody
	@RequestMapping(value="/products_update",method=RequestMethod.PUT)
	public int productsupdate(@RequestBody Products_DTO products_DTO ) {
		System.out.println("products_update 실행");
		System.out.println("products_DTO 값은 ="+products_DTO);
		int result = 0;
		try {			
			result = Products_service.updateProducts(products_DTO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("products_update_put :"+result);
		return result;
	}
	
	//삭제
	@ResponseBody
	@RequestMapping(value="/products_delet",method=RequestMethod.PUT)
	public int productsdelet(@RequestBody Products_DTO products_DTO) {
		System.out.println("products_delet 실행");
		System.out.println("products_DTO 값은 ="+products_DTO);
		int result = 0;
		try {			
			result = Products_service.deleteProducts(products_DTO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("products_update_put :"+result);
		return result;
		
		
	}
//-----------------------------------------------------------------	
	

// 검사기준 
//----------------------------------------------------------------
	
	@RequestMapping("/inspectionStandards")
	public String inspectionStandards(Model model,
			HttpSession httpSession,
			Products_DTO products_DTO
			) {
		System.out.println("inspectionStandards 실행");
		String Field = "ADMIN";

			Map map = Products_service.selectProducts(products_DTO);
			List name_list = Products_service.selectProductname();
		 
		 model.addAttribute("map",map);
		 model.addAttribute("pDTO",products_DTO);
		 model.addAttribute("name_list",name_list);
		 model.addAttribute("Field",Field);
		 System.out.println("map : "+map +""+ "products_DTO"+products_DTO);
		 
		return "inspectionStandards";
	}
	
//생산공정 
//----------------------
	@RequestMapping("/production_process")
	public String production_process() {
		
		return "production_process";
	}
	
//완제품 BOM
//----
	@RequestMapping("/bom_v2")
	public String Bom_v2() {
		
		return "bom_v2";
	}
	
//원재료 BOM
	@RequestMapping("/bomlist")
	public String Bomlist() {
		
		return "bomlist";
	}
	
	

	
	
	
	
}
