package project.service.Board_service;

import java.util.List;
import java.util.Map;

import project.dto.Comdto;
import project.dto.Filedto;
import project.dto.Linkdto;
import project.dto.Prodto;



public interface FileService {

	
	

	public 	int Fileint(Filedto Filedto);
	public 	List<Filedto> Filesel();
	public  List<Filedto> Fileselid(Filedto Filedto);
	public 	int Filefix(Filedto Filedto);
	public 	int Filedel(Filedto Filedto);
	
}
