package project.service.Board_service;

import java.util.List;
import java.util.Map;

import project.dto.Comdto;
import project.dto.Linkdto;
import project.dto.Prodto;



public interface LinkService {

	
	

	public 	int Linkint(Linkdto Linkdto);
	public List<Linkdto> Linksel();
	public Linkdto Linkselid(Linkdto Linkdto);
	public int Linkfix(Linkdto Linkdto);
	
}
