package project.dao.Board_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import project.dto.Comdto;
import project.dto.Filedto;
import project.dto.Linkdto;
import project.dto.Prodto;




@Repository
public class FiledaoImpl implements Filedao{
	
	  
	
	@Autowired
	SqlSession sqlSession;
	
	
	
	// 생성
	@Override
	public 	int Fileint(Filedto Filedto) {
		
	
	System.out.println("Filedto dto : " + Filedto);
	int Fileint = sqlSession.insert("mapper.pro.file.Fileint", Filedto);
    System.out.println("파일 생성 : " + Fileint);
    return Fileint;
		
	}
	
	
	
	
	// 전체조회
	@Override
	public 	List<Filedto> Filesel(){
		
		
	List<Filedto> Filesel = sqlSession.selectList("mapper.pro.file.Filesel");
    System.out.println("파일전체목록조회 : " + Filesel);
    return Filesel;
		
	}
	
	
	// 하나만 조회
	@Override
	public  List<Filedto> Fileselid(Filedto Filedto){
		
		
	List<Filedto> Fileselid = sqlSession.selectList("mapper.pro.file.Fileselid", Filedto);
    System.out.println("파일하나조회 : " + Fileselid);
    return Fileselid;
		
	}
	
	
	// 삭제 메소드
	@Override
	public 	int Filedel(Filedto Filedto){
				
	
	
	int Filedel = sqlSession.delete("mapper.pro.file.Filedel", Filedto);
    System.out.println("mapper.pro.file.Filedel : " + Filedel);

    return Filedel;	
	}
	
	// 수정 메소드
	@Override
	public 	int Filefix(Filedto Filedto){
				
	
	
	int Filefix = sqlSession.update("mapper.pro.file.Fileup", Filedto);
    System.out.println("파일수정 : " + Filefix);

    return Filefix;	
	}
	
	
	
	
	

	
}
