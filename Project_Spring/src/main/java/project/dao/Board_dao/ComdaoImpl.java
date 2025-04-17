package project.dao.Board_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import project.dto.Comdto;
import project.dto.Prodto;




@Repository
public class ComdaoImpl implements Comdao{
	
	  
	
	@Autowired
	SqlSession sqlSession;
	
	
	
	// 생성
	@Override
	public 	int Cominsert(Comdto Comdto) {
	int comint = -1;	
	
	System.out.println("Comdto dao : " + Comdto);
	comint = sqlSession.insert("mapper.pro.comment.Comint", Comdto);
    System.out.println("댓글 생성 : " + comint);
    return comint;
		
	}
	
	
	
	
	// 전체조회
	@Override
	public 	List<Comdto> Comsel(int postid){
		
		
	List<Comdto> Comsel = sqlSession.selectList("mapper.pro.comment.Comsel", postid);
    System.out.println("댓글전체목록조회 : " + Comsel);
    return Comsel;
		
	}
	
	
	// 하나만 조회
	@Override
	public 	List<Comdto> Comselid(int postid){
		
		
		List<Comdto> Comselid = sqlSession.selectList("mapper.pro.comment.Comselid", postid);
    System.out.println("댓글하나조회 : " + Comselid);
    return Comselid;
		
	}
	
	
	// 삭제 메소드
	@Override
	public 	int Comdel(Comdto Comdto){
				
	
	System.out.println("불가항력의 NULLPOINT");
	int Comdel = sqlSession.delete("mapper.pro.comment.Comdel", Comdto);
    System.out.println("mapper.pro.comment.Comdel : " + Comdel);
    System.out.println("불가항력의 NULLPOINT" + Comdel);
    return Comdel;	
	}
	
	// 수정 메소드
	@Override
	public 	int Comup(Comdto Comdto){
				
	
	
	int Comdel = sqlSession.update("mapper.pro.comment.Comup", Comdto);
    System.out.println("mapper.pro.comment.Comup : " + Comdel);

    return Comdel;	
	}
	
	
}
