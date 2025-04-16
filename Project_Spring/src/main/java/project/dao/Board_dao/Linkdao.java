package kr.or.human6.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.human6.dto.Comdto;
import kr.or.human6.dto.Linkdto;
import kr.or.human6.dto.Prodto;


public interface Linkdao {

	
	
	public int Linkint(Linkdto Linkdto);
	public List<Linkdto> Linksel();
	public Linkdto Linkselid(Linkdto Linkdto);
	int Linkfix(Linkdto Linkdto);
}
