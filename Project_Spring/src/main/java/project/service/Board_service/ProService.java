package kr.or.human6.Service;

import java.util.List;
import java.util.Map;


import kr.or.human6.dto.Prodto;



public interface ProService {

	
	
	
	
	public List<Prodto> getEmpList();
	public int insertEmpList(Prodto Prodto);
	public Prodto Contentemp(Prodto prodto); 
	public int Condel(Prodto Prodto);
	public int Conup(Prodto prodto);
	public int Viewcount(Prodto prodto);
	public 	Map<String, Object> SelectPage(Prodto Prodto);
	
	
	
	
	
}
