package project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class total_controller {

	@RequestMapping("/standard")
	public String standard() {
		
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
	
	@RequestMapping("/index")
	public String index() {
		
		return "index";
	}
	@RequestMapping("/login")
	public String login() {
		
		return "login";
	}
	@RequestMapping("/MainTitle")
	public String MainTitle() {
		
		return "MainTitle";
	}
	@RequestMapping("/performance")
	public String performance() {
		
		return "performance";
	}
	@RequestMapping("/ProdPlan")
	public String ProdPlan() {
		
		return "ProdPlan";
	}
	@RequestMapping("/qualityControl")
	public String qualityControl() {
		
		return "qualityControl";
	}
	@RequestMapping("/WorkOrder")
	public String WorkOrder() {
		
		return "WorkOrder";
	}

	
	
	
	
}
