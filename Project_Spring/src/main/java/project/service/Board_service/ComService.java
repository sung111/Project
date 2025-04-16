package kr.or.human6.Service;

import java.util.List;
import java.util.Map;

import kr.or.human6.dto.Comdto;
import kr.or.human6.dto.Prodto;



public interface ComService {

	
	
	public int Cominsert(Comdto Comdto);
	public List<Comdto> Comsel(int postid);
	public List<Comdto> Comselid(int postid);
	public int Comdel (Comdto Comdto);
	public int Comup (Comdto Comdto);
	
	
	
	
	
}
