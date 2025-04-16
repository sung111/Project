package kr.or.human6.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.or.human6.dao.Prodao;
import kr.or.human6.dto.Prodto;

//import kr.or.human.dao.EmpDAO;


@Service
public class ProServiceImpl implements ProService {

	
	
	
	
	@Autowired
	Prodao Prodao;
	
	
	@Override // 이걸 컨트롤러에서 불러옴
	public 	List<Prodto> getEmpList() {
		
		
    List result = Prodao.selectEmpList();
    System.out.println("result : " + result);
    return result;
		
	}
	
	
	@Override
	public 	int insertEmpList(Prodto Prodto) {
	int insdto = -1;	
		
	insdto = Prodao.insertEmpList(Prodto);
    System.out.println("서비스 생성메소드 프로젝트 : " + insdto);
    return insdto;
		
	}
	
	
	
	
	//컨텐츠
	@Override
	public 	Prodto Contentemp(Prodto prodto) {
			
	Prodto condto = Prodao.Contentemp(prodto);
    System.out.println("글 컨텐츠 : " + condto);
    return condto;
		
	}
		
	
	//컨텐츠 삭제
	@Override
	public 	int Condel(Prodto prodto) {
    int delcon = -1;
		
	delcon = Prodao.Condel(prodto);
    System.out.println(" 컨텐츠 삭제 : " + delcon);
    return delcon;
		
	}
	
	
	
	//컨텐츠 수정
	@Override
	public 	int Conup(Prodto prodto) {
    int upcon = -1;
		              // selectOne
    upcon = Prodao.Conup(prodto);
    System.out.println(" 컨텐츠 수정 : " + upcon);
    return upcon;
		
	}
		
	
	
	
	//조회수 (업뎃)
	@Override
	public 	int Viewcount(Prodto prodto) {
    int view = -1;
		              // selectOne
    view = Prodao.Viewcount(prodto);
    System.out.println(" 조회수 : " + view);
    return view;
		
	}
	
	
	
	// 조건 메소드 //searchlist
		@Override
		public 	Map<String, Object> SelectPage(Prodto Prodto){
							
									  
					
					
		        // 보여줄 시작. 끝 index 찾기
			    // unreachble code : 위에 끝난 코드가 있음
			int page = Prodto.getPage();
//			if (page <= 0) page = 1;
//			Prodto.setPage(page);

			int viewCount = Prodto.getPagecount();
//			if (viewCount <= 0) viewCount = 10;
//			Prodto.setPagecount(viewCount);
				
				int indexStart = (viewCount * (page-1)) + 1;
				int indexEnd = page * viewCount;
				
				Prodto.setIndexStart(indexStart);
				Prodto.setIndexEnd(indexEnd);
				System.out.println("인덱스스타트 :" + indexStart);
				System.out.println("인덱스엔드 : " + indexEnd);
				
				
				
				// 한 페이지의 내용 리스트(셀렉트)
				List list = Prodao.selectpage(Prodto);
			    System.out.println("서비스 페이지 셀렉트 : " + list);
			    
			 			    
			    
			    // 전체 글 개수
			    int total = Prodao.totalList();
			    
			    Map<String, Object> map = new HashMap();
			    System.out.println("지도 :" + map);
			    map.put("list", list);
			    map.put("total", total);
			  
			    return map;
				
		   }
		
		
		
		
		
		
		
		
}
