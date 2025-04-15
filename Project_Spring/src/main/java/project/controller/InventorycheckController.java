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
	public String invenHome(
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
		
		model.addAttribute("list", list);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("dto",invenDTO);
		
		
		return "Inventorycheck";
	}
	
	//삭제
	@RequestMapping(value="invenDelete", method=RequestMethod.POST)
	public String invenDelete(InvenCheck_DTO invenDTO, Model model) {
		
//		int result = service.matInvenDelete(invenDTO);
		service.deleteCheck(invenDTO);
		
		//리스트가없으면 c:forEach가 안돌아서 nullPointException 나옴.
		List list = service.page(invenDTO);
		int totalCount = service.totalCount();
		model.addAttribute("list", list);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("dto",invenDTO);
		
		return "Inventorycheck";
	}
	
	//자재 등록.
	@RequestMapping(value="matInsertInven", method=RequestMethod.POST)
	public String matInsertInven(InvenCheck_DTO dto, Model model) {
		
		service.matInsertInven(dto);
		
		//리스트가없으면 c:forEach가 안돌아서 nullPointException 나옴.
		List list = service.page(dto);
		int totalCount = service.totalCount();
		model.addAttribute("list", list);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("dto",dto);
		
		return "Inventorycheck";
	}
	
	//검색
	@RequestMapping(value="invenSearch", method=RequestMethod.GET)
	public String invenSearch(InvenCheck_DTO invenDTO, Model model) {
		
		System.out.println("invenDTOㄱㄱㄱㄱ  : "+invenDTO);
		List list = service.searchInven(invenDTO);
		int totalCount = service.searchInvenCount(invenDTO);
		
		model.addAttribute("list", list);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("dto",invenDTO);
		System.out.println("검색갯수 ::::"+totalCount);
		return "Inventorycheck";
	}
	
	
}
