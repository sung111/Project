package project.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import project.service.Board_service.ComService;
import project.dto.Comdto;
import project.dto.Prodto;


@Controller
public class ComController {

	
	@Autowired
	// EmpService 타입에 넣음
	ComService ComService;
	
	
	// 생성 입구
//	@RequestMapping(value = "/con")
//	public String content(
//			
//			
//			
//			
//			) {
//			
//	    
//		return "Content";
//		
//	}

	
	
	// 생성 데이터 //댓글 생성은 여기서 (조회는 다름)
    //	@ResponseBody
	@RequestMapping(value = "/comment", method = RequestMethod.POST)
	public String content(
			
//			@RequestParam(value="postid") int postid,
			@ModelAttribute
			Comdto Comdto,
		    Model model
			
			) {
		
        // 전체목록
//		List<Comdto> comsel = ComService.Comsel(postid);
//		model.addAttribute("comsel", comsel);
		
		int comint = ComService.Cominsert(Comdto);
//		Comdto comselid = ComService.Comselid(postid);
		System.out.println("컴DTO : " + Comdto);
		System.out.println(" 댓글 등록 성공시 1 :  " + comint);
//		model.addAttribute("comselid", comselid);
		return "redirect:/Content?postid=" + Comdto.getPostid();
		         // 
	}
	

	// 전체 목록 조회
    //	@ResponseBody
//	@RequestMapping(value = "/comsel")
//	public String comsel(
//			
//			@ModelAttribute
//			Comdto Comdto,
//		    Model model
//			
//			) {
//
//		List<Comdto> comsel = ComService.Comsel();
//		System.out.println("컴DTO 댓글 전체 : " + Comdto);
//		System.out.println(" 댓글 전체 목록 성공시 1 :  " + comsel);
//		model.addAttribute("comsel", comsel);
//		return "redirect:/Content?postid=" + Comdto.getPostid();
//		         // 
//	}
	
	
	// 행 하나 조회
//    @ResponseBody
//	@RequestMapping(value = "/comselid")
//	public String comselid(
//			
//			@ModelAttribute
//			Comdto Comdto,
//		    Model model
//			
//			) {
//
//    	Comdto comselid = ComService.Comselid(Comdto);
//		System.out.println("컴DTO 댓글 하나: " + Comdto);
//		System.out.println(" 댓글 하나 성공시 1 :  " + comselid);
//		model.addAttribute("comselid", comselid);
//		return "redirect:/Content?postid=" + Comdto.getPostid();
//		          
//	}
	

    // 댓글 삭제
	@RequestMapping(value = "/delcon", method = RequestMethod.POST)
	public String condel(
			
			@ModelAttribute
			Comdto Comdto
			
			) {
		
		int postid = Comdto.getPostid();	
	    int delcon = ComService.Comdel(Comdto);
	    
	    System.out.println("삭제 COMDTO" + Comdto);
	    System.out.println(" 댓글 삭제시 1 발생 " + delcon);
	    
	    
	    
	    
	    		
     return "redirect:/Content?postid=" + Comdto.getPostid();
		
	}	
		
	
	// 삭제시 이동할
//	@RequestMapping(value = "/delmove")
//	public String delmove(
//			) {
//	  
//     return "board";
//		
//	}	

	// 댓글 수정
	@RequestMapping(value = "/comup", method = RequestMethod.POST)
	public String conup(
			
			@ModelAttribute
			Comdto Comdto
			
			) {
		
		int postid = Comdto.getPostid();	
	    int upcon = ComService.Comup(Comdto);
	    
	    System.out.println(" 수정 COMDTO" + Comdto);
	    System.out.println(" 댓글 수정시 1 발생 " + upcon);
	    System.out.println(" 댓글 수정 포스트아이디 :" + postid);
	    
	    
	    
     return "redirect:/Content?postid=" + Comdto.getPostid();
		
	}	
	
}
