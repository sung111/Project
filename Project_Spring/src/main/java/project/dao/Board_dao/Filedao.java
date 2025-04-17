package project.dao.Board_dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import project.dto.Comdto;
import project.dto.Filedto;
import project.dto.Linkdto;
import project.dto.Prodto;


public interface Filedao {

	
	
	public 	int Fileint(Filedto Filedto);
	public 	List<Filedto> Filesel();
	public  List<Filedto> Fileselid(Filedto Filedto);
	public 	int Filefix(Filedto Filedto);
	public 	int Filedel(Filedto Filedto);
}
