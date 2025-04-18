package project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import project.dto.InvenCheck_DTO;
import project.service.invenCheck_service.InvenCheck_Servcie;

@Controller
public class InventorycheckController {

	@Autowired
	InvenCheck_Servcie service;

	@RequestMapping(value = "/inven", method = RequestMethod.GET)
	public String invenHome(InvenCheck_DTO invenDTO, Model model) {

//		get으로 들어오고 값을 받아서 1페이지 리스트를보여줌
//		한페이지에 10개씩보여줌
//		로드될때 무조건 1페이지
//		dto에 rnum 번호를 순서대로받아서 보여줌.
		
//		get 페이지 검색이 있다면
		boolean isSearching = 
				(invenDTO.getSearch() != null && !invenDTO.getSearch().isEmpty())
			||  (invenDTO.getSearchWay() != null && !invenDTO.getSearchWay().isEmpty())
			||  (invenDTO.getSearchType() != null && !invenDTO.getSearchType().isEmpty())
			||  (invenDTO.getDateStart() != null && !invenDTO.getDateStart().isEmpty())
			||  (invenDTO.getDateEnd() != null && !invenDTO.getDateEnd().isEmpty());
		
//		true 이면 검색으로
		if (isSearching) {
			model.addAttribute("list", service.searchInven(invenDTO));
			model.addAttribute("totalCount", service.searchInvenCount(invenDTO));
			System.out.println(service.searchInvenCount(invenDTO));
//		false 면 전체로
		} else {
			model.addAttribute("list", service.page(invenDTO));
			model.addAttribute("totalCount", service.totalCount());
		}
		
//		무조건필요한 값
		model.addAttribute("dto", invenDTO);
		model.addAttribute("matDB", service.matDB(invenDTO));
		model.addAttribute("prodDB", service.prodDB(invenDTO));


		return "Inventorycheck";
	}

	// 삭제
	@RequestMapping(value = "/invenDelete", method = RequestMethod.POST)
	public String invenDelete(InvenCheck_DTO invenDTO, Model model) {

//		int result = service.matInvenDelete(invenDTO);
		service.deleteCheck(invenDTO);

		// 리스트가없으면 c:forEach가 안돌아서 nullPointException 나옴.
//		model.addAttribute("list", service.page(invenDTO));
//		model.addAttribute("totalCount", service.totalCount());
//		model.addAttribute("dto", invenDTO);
//
//		model.addAttribute("matDB", service.matDB(invenDTO));
//		model.addAttribute("prodDB", service.prodDB(invenDTO));

		return "redirect:/inven";
	}

	// 자재 등록.
	@RequestMapping(value = "/matInsertInven", method = RequestMethod.POST)
	public String matInsertInven(InvenCheck_DTO dto, Model model) {

		if ("완제품".equals(dto.getType())) {
			service.prodInsertInven(dto);
		} else if ("원자재".equals(dto.getType())) {
			service.matInsertInven(dto);
		} else {
			return "error";
		}

//		model.addAttribute("list", service.page(dto));
//		model.addAttribute("totalCount", service.totalCount());
//		model.addAttribute("dto", dto);
//
//		model.addAttribute("matDB", service.matDB(dto));
//		model.addAttribute("prodDB", service.prodDB(dto));

		return "redirect:/inven";
	}
	
	//수정
	@RequestMapping(value="/invenModify", method = RequestMethod.PUT)
	@ResponseBody
	public int invenModify(
							@RequestBody InvenCheck_DTO dto
	) {
		System.out.println("put dto 도착스" + dto);
		int result = service.invenUpdateCheck(dto);
		return result;
	}
}
