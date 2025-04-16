package kr.or.human6.Service;

import java.util.List;
import java.util.Map;

import kr.or.human6.dto.Comdto;
import kr.or.human6.dto.Linkdto;
import kr.or.human6.dto.Prodto;



public interface LinkService {

	
	

	public 	int Linkint(Linkdto Linkdto);
	public List<Linkdto> Linksel();
	public Linkdto Linkselid(Linkdto Linkdto);
	public int Linkfix(Linkdto Linkdto);
	
}
