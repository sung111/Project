package project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		boolean isSearching =
			    (dto.getProductname() != null && !dto.getProductname().isEmpty())
			    || (dto.getSearchDateStart() != null && !dto.getSearchDateStart().isEmpty())
			    || (dto.getSearchDateEnd() != null && !dto.getSearchDateEnd().isEmpty());
		
		if( isSearching ) {
			model.addAttribute("list", service.performanceSearchList(dto) );
			model.addAttribute("totalCount", service.performanceSearchCount(dto) );
			System.out.println(dto);
		} else {
			model.addAttribute("list", service.pageList(dto));
			model.addAttribute("totalCount", service.pageTotalCaount());
		}
		model.addAttribute("dto", dto);
		return "Performance";
	}
	
//	삭제
	@RequestMapping(value="/performanceDelete", method=RequestMethod.POST)
	public String Delete(
						Performance_DTO dto
	) {
		service.performanceDelete(dto);
		
		return "redirect:/performance";
	}
	
//	업뎃
	@RequestMapping(value="/performanceUpdate", method=RequestMethod.POST)
	@ResponseBody
	public int Update(
			@RequestBody
			Performance_DTO dto
			) {
		int result = service.performanceUpdate(dto);
		return result;
	}
	
//	인서트
	@RequestMapping(value="/performInsert", method=RequestMethod.POST)
	public String performInsert(
			Performance_DTO dto,
			HttpSession session
			) {
		System.out.println((String) session.getAttribute("userId"));
		String userid = (String) session.getAttribute("userId");
		dto.setUserid(userid);
		service.performInsert(dto);
		return "redirect:/performance";
	}
	
	
	
	
	
//	@RequestMapping(value="/performanceSearch", method=RequestMethod.GET)
//	@ResponseBody
//	public Map performanceSearch(
//						Performance_DTO dto
//			) {
//		Map map = new HashMap();
//		
//		map.put( "list", service.performanceSearchList(dto) );
//		map.put( "totalCount", service.performanceSearchCount(dto) );
//		
//		return map;
//	}
//	
	
	
}
