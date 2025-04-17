package project.service.Board_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dto.Comdto;
import project.dto.Prodto;
import project.dao.Board_dao.Comdao;


@Service
public class ComServiceImpl implements ComService {

	
	
	
	
	@Autowired
	Comdao Comdao;
	
	
	
	
	
	    // 생성
		@Override
		public 	int Cominsert(Comdto Comdto) {
		int comint = -1;	
			
		comint = Comdao.Cominsert(Comdto);
	    System.out.println("댓글 생성 : " + comint);
	    return comint;
			
		}
	
	
	
		// 전체조회
		@Override
		public 	List<Comdto> Comsel(int postid){
			
			
		List<Comdto> Comsel = Comdao.Comsel(postid);
	    System.out.println("댓글전체목록조회 : " + Comsel);
	    return Comsel;
			
		}
		
		
		// 하나만 조회
		@Override
		public 	List<Comdto> Comselid(int postid){
			
			
			List<Comdto> Comselid = Comdao.Comselid(postid);
	    System.out.println("댓글하나조회 : " + Comselid);
	    return Comselid;
			
		}
	
		
		// 댓글 삭제
		@Override
		public 	int Comdel(Comdto Comdto){
		 			
		
		
		int Comdel = Comdao.Comdel(Comdto);
	    System.out.println(" 댓글 삭제 : " + Comdel);

	    return Comdel;	
		}
		
		
		// 수정 메소드
		@Override
		public 	int Comup(Comdto Comdto){
					
		
		
		int Comdel = Comdao.Comup(Comdto);
	    System.out.println("mapper.pro.comment.Comup : " + Comdel);

	    return Comdel;	
		}
		
}
