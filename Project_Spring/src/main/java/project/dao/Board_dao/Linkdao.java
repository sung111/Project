package project.dao.Board_dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import project.dto.Comdto;
import project.dto.Linkdto;
import project.dto.Prodto;


public interface Linkdao {

	
	
	public int Linkint(Linkdto Linkdto);
	public List<Linkdto> Linksel();
	public Linkdto Linkselid(Linkdto Linkdto);
	int Linkfix(Linkdto Linkdto);
}
