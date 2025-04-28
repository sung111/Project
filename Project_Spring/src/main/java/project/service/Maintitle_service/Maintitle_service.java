package project.service.Maintitle_service;

import java.util.List;
import java.util.Map;

import project.dto.Bom_DTO;
import project.dto.Materials_DTO;
import project.dto.ProductionProcessDescription_DTO;
import project.dto.Products_DTO;
import project.dto.maintitle_DTO;

public interface Maintitle_service {

	
//사용

	
	public List<maintitle_DTO> titleAnnouncement();
	public List<maintitle_DTO> titleGeneralBulletinBoard();
	public List<maintitle_DTO> titleFinishedProduct();
	public List<maintitle_DTO> titleQualityControl();
	
	
	
}
