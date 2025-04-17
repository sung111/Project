package project.service.Board_service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import project.dto.Comdto;
import project.dto.Filedto;
import project.dto.Linkdto;
import project.dto.Prodto;
import project.dao.Board_dao.Comdao;
import project.dao.Board_dao.Linkdao;
import project.dao.Board_dao.Filedao;

@Service
public class FileserviceImpl implements FileService {

	
	
	
	
	@Autowired
	Filedao Filedao;
	
	
	
	
	
	 // 생성
	@Override
	public int Fileint(Filedto Filedto) {
		
		
	int Fileint = Filedao.Fileint(Filedto);
    System.out.println("파일 생성 : " + Fileint);
    return Fileint;
		
	}
		
	
	
	
	// 전체조회
	@Override
	public 	List<Filedto> Filesel(){
		
		
	List<Filedto> Filesel = Filedao.Filesel();
    System.out.println("파일전체목록조회 : " + Filesel);
    return Filesel;
		
	}
		
		
	// 하나만 조회
	@Override
	public  Filedto Fileselid(Filedto Filedto){
		
		
	Filedto Fileselid = Filedao.Fileselid(Filedto);
    System.out.println("파일하나조회 : " + Fileselid);
    return Fileselid;
		
	}
	
		
		// 댓글 삭제
//		@Override
//		public 	int Comdel(Comdto Comdto){
//		 			
//		
//		
//		int Comdel = Comdao.Comdel(Comdto);
//	    System.out.println(" 댓글 삭제 : " + Comdel);
//
//	    return Comdel;	
//		}
		
		
		// 수정 메소드
//		@Override
//		public 	int Linkfix(Linkdto Linkdto){
//					
//		
//		
//		int Linkfix = Linkdao.Linkfix(Linkdto);
//	    System.out.println("링크수정 : " + Linkfix);
//
//	    return Linkfix;	
//		}
		
}
