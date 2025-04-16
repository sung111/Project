package kr.or.human6.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.human6.dto.Prodto;


public interface Prodao {

	
	
	public List<Prodto> selectEmpList();
	public int insertEmpList(Prodto Prodto);
	public Prodto Contentemp(Prodto Prodto);
	public int Condel(Prodto Prodto);
	public int Conup(Prodto prodto);
	public int Viewcount(Prodto prodto);
	public List<Prodto> selectpage(Prodto Prodto);
	public int totalList();
	
	
	
}
