package project.dao.Board_dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import project.dto.Comdto;
import project.dto.Prodto;


public interface Comdao {

	
	
	public int Cominsert(Comdto Comdto);
	public List<Comdto> Comsel(int postid);
	public List<Comdto> Comselid(int postid);
	public int Comdel (Comdto Comdto);
	public int Comup (Comdto Comdto);
	
	
}
