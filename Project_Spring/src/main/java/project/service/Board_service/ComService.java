package project.service.Board_service;

import java.util.List;
import java.util.Map;

import project.dto.Comdto;
import project.dto.Prodto;



public interface ComService {

	
	
	public int Cominsert(Comdto Comdto);
	public List<Comdto> Comsel(int postid);
	public List<Comdto> Comselid(int postid);
	public int Comdel (Comdto Comdto);
	public int Comup (Comdto Comdto);
	
	
	
	
	
}
