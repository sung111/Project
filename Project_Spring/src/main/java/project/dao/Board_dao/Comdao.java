package kr.or.human6.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.human6.dto.Comdto;
import kr.or.human6.dto.Prodto;


public interface Comdao {

	
	
	public int Cominsert(Comdto Comdto);
	public List<Comdto> Comsel(int postid);
	public List<Comdto> Comselid(int postid);
	public int Comdel (Comdto Comdto);
	public int Comup (Comdto Comdto);
	
	
}
