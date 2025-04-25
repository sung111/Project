package project.dao.Board_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dto.Prodto;




@Repository
public class ProdaoImpl implements Prodao{
	
	  
	
	@Autowired
	SqlSession sqlSession;
	
	// 전체 목록
	@Override
	public 	List<Prodto> selectEmpList() {
		
		
	List<Prodto> result = sqlSession.selectList("mapper.emp.boardselect");
    System.out.println("result : " + result);
    return result;
		
	}
	
	// 생성
	@Override
	public 	int insertEmpList(Prodto Prodto) {
	int insdto = -1;	
		
	insdto = sqlSession.insert("mapper.emp.boardinsert", Prodto);
    System.out.println("result : " + insdto);
    return insdto;
		
	}
	
	
	//목록 하나
	@Override
	public 	Prodto Contentemp(Prodto prodto) {
		
		
	Prodto condto = sqlSession.selectOne("mapper.emp.Content", prodto);
    System.out.println("글 컨텐츠 : " + condto);
    return condto;
		
	}
	
	
	//컨텐츠 삭제
	@Override
	public 	int Condel(Prodto prodto) {
    int delcon = -1;
		
	delcon = sqlSession.delete("mapper.emp.Condel", prodto);
    System.out.println(" 컨텐츠 삭제 : " + delcon);
    return delcon;
		
	}
	
	//컨텐츠 수정
	@Override
	public 	int Conup(Prodto prodto) {
    int upcon = -1;
		              // selectOne
    upcon = sqlSession.update("mapper.emp.Conup", prodto);
    System.out.println(" 컨텐츠 수정 : " + upcon);
    return upcon;
		
	}
	
	
	//조회수 (업뎃)
	@Override
	public 	int Viewcount(Prodto prodto) {
    int view = -1;
		              // selectOne
    view = sqlSession.update("mapper.emp.Viewcount", prodto);
    System.out.println(" 조회수 : " + view);
    return view;
		
	}
	
	
	
	
	
	
	
	
	// 페이징과 셀렉트
	@Override
	public 	List<Prodto> selectpage(Prodto Prodto){
								

	List<Prodto> selpage = sqlSession.selectList("mapper.pro.page.selectPageEmp", Prodto);
    System.out.println("페이지겸셀렉트 : " + selpage);
    return selpage;
								
			}
	
	// 전체 페이지
	@Override
	public 	int totalList(Prodto prodto){
						
								                      
  
	int page = sqlSession.selectOne("mapper.pro.page.totalEmp", prodto);
    System.out.println("count(*) : " + page);
    return page;
								
			}
	
	
	
	
	
	// 검색
	@Override
	public 	List<Prodto> search(Prodto Prodto){
						
								                      
  
	List<Prodto> search = sqlSession.selectList("mapper.emp.searchboard", Prodto);
    System.out.println("검색 : " + search);
    return search;
				
    
    
			}
		
	
	
	
	
}
