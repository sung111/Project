package project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.service.Materials_service;
//자 여기는 bom,재고,관련된 controller입니다 싹다 몰아주세요 
@Controller
public class Bom_total_controller {

	@Autowired
	Materials_service materials_serviceImpl;
	@Autowired
	Materials_service materials_serviceImpl;
	
	
	@RequestMapping("/standard")
	public String standard(Model model) {
		List resultList = materials_serviceImpl.selectMaterials();
		
		model.addAttribute("resultList",resultList);
//		System.out.println("resultList값 = "+ resultList);
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
