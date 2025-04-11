package project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.dto.InvenCheck_DTO;
import project.service.invenCheck_service.InvenCheck_Servcie;

@Controller
public class InventorycheckController {
	
	@Autowired
	InvenCheck_Servcie service;
	
	@RequestMapping(value="inven", method=RequestMethod.GET)
	public String invenSearch(
					InvenCheck_DTO invenDTO,
					Model model
					)
	{
//		get으로 들어오고 값을 받아서 1페이지 리스트를보여줌
//		한페이지에 10개씩보여줌
//		로드될때 무조건 1페이지
//		dto에 rnum 번호를 순서대로받아서 보여줌.
		List list = service.page(invenDTO);
		int totalCount = service.totalCount();
		
		
		System.out.println("컨트롤러에서 뽑아보기"+list);
		System.out.println("컨트롤러에서 count 뽑기" + totalCount);
		
		model.addAttribute("list", list);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("dto",invenDTO);
		
		
		return "Inventorycheck";
	}
	
}
