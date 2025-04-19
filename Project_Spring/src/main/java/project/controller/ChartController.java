package project.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.dto.Querydto;
import project.service.Board_service.Chartservice;




@Controller
public class ChartController {

	
	@Autowired
	// EmpService 타입에 넣음
	Chartservice Chartservice;
	
	// 전체 목록 조회
    //	@ResponseBody
	@RequestMapping(value = "/chart")
	public String chart(
			
			@ModelAttribute
			Querydto Querydto,
		    Model model
			
			) {

		
		List<Querydto> chsel = Chartservice.chsel(Querydto);
		System.out.println(" 차트 전체 : " + Querydto);
		System.out.println(" 차트 전체 목록 성공시 1 :  " + chsel);
		model.addAttribute("query", chsel);
		return "Chart";
		          
	}
	
	

	// 전체 목록 조회
    //	@ResponseBody
	@RequestMapping(value = "/searchs")
	public String chartid(
			
			@ModelAttribute
			Querydto Querydto,
		    Model model
			
			) {

		
		List<Querydto> chartid = Chartservice.chselid(Querydto);
		System.out.println(" 차트 조건 : " + Querydto);
		System.out.println(" 차트 조건 목록 성공시 1 :  " + chartid);
		model.addAttribute("queryid", chartid);
		return "Chart";
		          
	}
}
