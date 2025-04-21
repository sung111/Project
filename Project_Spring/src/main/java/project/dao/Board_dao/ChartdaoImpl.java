package project.dao.Board_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



import project.dto.Querydto;




@Repository
public class ChartdaoImpl implements Chartdao{
	
	  
	
	@Autowired
	SqlSession sqlSession;
	
	
	
	
	
	
	
	// 전체조회
	@Override
	public 	List<Querydto> chsel(Querydto Querydto){
		
		
	List<Querydto> chsel = sqlSession.selectList("mapper.chart.chartsel", Querydto);
    System.out.println("차트조회 : " + chsel);
    return chsel;
		
	}
	
	
	// 전체조회
	@Override
	public 	List<Querydto> chselid(Querydto Querydto){
		
		
	List<Querydto> chselid = sqlSession.selectList("mapper.chart.chartselid", Querydto);
    System.out.println("차트조회id : " + chselid);
    return chselid;
		
	}
	
	
}
