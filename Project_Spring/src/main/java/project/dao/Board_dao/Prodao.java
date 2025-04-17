package project.dao.Board_dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import project.dto.Prodto;


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
