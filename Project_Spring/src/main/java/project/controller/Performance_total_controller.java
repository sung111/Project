package project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.dto.Performance_DTO;
import project.service.Performance_service.Performance_ServiceImpl;

//실적보고/실적 관련 토탈 컨트롤러입니다
@Controller
public class Performance_total_controller {
	
	@Autowired
	Performance_ServiceImpl service;
	
	@RequestMapping(value="/performance", method=RequestMethod.GET)
	public String main(
			Performance_DTO dto,
			Model model
			) {
		model.addAttribute("dto", dto);
		model.addAttribute("list", service.pageList(dto));
		model.addAttribute("totalCount", service.pageTotalCaount());
		
		return "Performance";
	}
	@RequestMapping(value="/performanceDelete", method=RequestMethod.POST)
	public String Delete(
						Performance_DTO dto
	) {
		service.performanceDelete(dto);
		
		return "redirect:/performance";
	}
	
	
	
	
}
