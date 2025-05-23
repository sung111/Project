package project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.dto.QualityControl_DTO;
import project.service.qualityControl_service.QualityControl_Service;

//여기는 퀄리티 토탈 컨트롤러입니다
@Controller
public class Quality_total_controller {
	
	@Autowired
	QualityControl_Service service;
	
	@RequestMapping(value="/qual", method=RequestMethod.GET)
	public String main() {
		
		return "qualityControl";
	}


	@RequestMapping(value="/performList", method=RequestMethod.POST)
	@ResponseBody
	public Map performList(
			@RequestBody
			QualityControl_DTO dto
			) {
		Map map = new HashMap();
		
		List list = service.pageList(dto);
		int totalCount = service.pageTotalCaount();
		
		map.put("list", list);
		map.put("totalCount", totalCount);
		map.put("page", dto.getPage() );
		
		return map;
	}
	
	@RequestMapping(value="/qualList", method=RequestMethod.POST)
	@ResponseBody
	public Map qualList(
			@RequestBody
			QualityControl_DTO dto
			) {
		Map map = new HashMap();
		
		List list = service.QualityList(dto);
		int totalCount = service.QualityTotalCount();
		
		map.put("list", list);
		map.put("totalCount", totalCount);
		map.put("page", dto.getPage() );
		
		return map;
	}
//	데이터 삽입
	@ResponseBody
	@RequestMapping(value="/qualInsert", method=RequestMethod.POST)
	public int qualInsert(
			@RequestBody
			QualityControl_DTO dto,
			HttpSession session
			) {
		String userid = (String) session.getAttribute("userId");
		dto.setUserid(userid);
		return service.QualityInsert(dto);
	}
//	데이터 삭제
	@ResponseBody
	@RequestMapping(value="/QaulDelete", method=RequestMethod.DELETE)
	public int QaulDelete(
			@RequestBody
			QualityControl_DTO dto
			) {
		return service.QaulDelete(dto);
	}
	
//	검색리스트
	@RequestMapping(value="/qualList/search", method=RequestMethod.GET)
	@ResponseBody
	public Map getQualList(
			@ModelAttribute
			QualityControl_DTO dto
			) {
		List list = service.searchQualList(dto);
		int totalCount = service.searchQualTotalCount(dto);
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount);
		map.put("page", dto.getPage() );
		
		return map;
	}
	
//	검색리스트
	@RequestMapping(value="/QualUpdate", method=RequestMethod.PUT)
	@ResponseBody
	public int QualUpdate(
			@RequestBody
			QualityControl_DTO dto
			) {
		return service.QualUpdate(dto);
	}
	
//	모달창구현
	@RequestMapping(value="/QaulModalSelect", method=RequestMethod.GET)
	@ResponseBody
	public QualityControl_DTO QaulModalSelect(
			@RequestParam("productid")
			int productid
			) {
		return service.QaulModalSelect(productid);
	}
	
//	fetch로 세션받기위함
	@ResponseBody
	@RequestMapping(value="/getSessionUserId", method=RequestMethod.GET)
	public String getSessionUserId(HttpSession session) {
	    String userId = (String) session.getAttribute("userId");
	    return userId != null ? userId : "";
	}
}
