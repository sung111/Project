package project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import project.service.Maintitle_service.Maintitle_service;

@Controller
public class Maintitle_total_controller {
	
	@Autowired
	Maintitle_service service;

	@RequestMapping("/maintitle")
	public String loadMaintitlePage(Model model) {
	 
		try {
		System.out.println("loadMaintitlePage 실행");
	    List titleAnnouncement = service.titleAnnouncement();
	    List titleGeneralBulletinBoard = service.titleGeneralBulletinBoard();
	    List titleFinishedProduct = service.titleFinishedProduct();
	    List titleQualityControl = service.titleQualityControl();
	    
	    model.addAttribute("Announcement",titleAnnouncement);
	    model.addAttribute("GeneralBulletinBoard",titleGeneralBulletinBoard);
	    model.addAttribute("FinishedProduct",titleFinishedProduct);
	    model.addAttribute("QualityControl",titleQualityControl);
	    System.out.println("1"+titleAnnouncement);
	    System.out.println("2"+titleGeneralBulletinBoard);
	    System.out.println("3"+titleFinishedProduct);
	    System.out.println("4"+titleQualityControl);

	    }catch (Exception e) {
			e.printStackTrace();
		}
		
		return "MainTitle"; 
	}



    
    

}

