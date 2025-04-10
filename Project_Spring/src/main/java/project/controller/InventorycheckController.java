package project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InventorycheckController {
	
	@RequestMapping("inven")
	public String list() {
		
		return "Inventorycheck";
	}
	
}
