package kr.or.human6.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.human6.dto.Comdto;
import kr.or.human6.dto.Linkdto;
import kr.or.human6.dto.Prodto;
import kr.or.human6.dao.Comdao;
import kr.or.human6.dao.Linkdao;

@Service
public class LinkserviceImpl implements LinkService {

	
	
	
	
	@Autowired
	Linkdao Linkdao;
	
	
	
	
	
	 // 생성
	@Override
	public 	int Linkint(Linkdto Linkdto) {
		
		
	int Linkint = Linkdao.Linkint(Linkdto);
    System.out.println("링크 생성 : " + Linkint);
    return Linkint;
		
	}
		
	
	
	
	    // 전체조회
		@Override
		public 	List<Linkdto> Linksel(){
			
			
		List<Linkdto> Linksel = Linkdao.Linksel();
	    System.out.println("댓글전체목록조회 : " + Linksel);
	    return Linksel;
			
		}
		
		
		// 하나만 조회
		@Override
		public 	Linkdto Linkselid(Linkdto Linkdto){
			
			
		Linkdto Linkselid = Linkdao.Linkselid(Linkdto);
	    System.out.println("댓글하나조회 : " + Linkselid);
	    return Linkselid;
			
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
		@Override
		public 	int Linkfix(Linkdto Linkdto){
					
		
		
		int Linkfix = Linkdao.Linkfix(Linkdto);
	    System.out.println("링크수정 : " + Linkfix);

	    return Linkfix;	
		}
		
}
