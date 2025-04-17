package project.service.Board_service;

import java.util.List;
import java.util.Map;


import project.dto.Prodto;



public interface ProService {

	
	
	
	
	public List<Prodto> getEmpList();
	public int insertEmpList(Prodto Prodto);
	public Prodto Contentemp(Prodto prodto); 
	public int Condel(Prodto Prodto);
	public int Conup(Prodto prodto);
	public int Viewcount(Prodto prodto);
	public 	Map<String, Object> SelectPage(Prodto Prodto);
	
	
	
	
	
}
