package project.service.Board_service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



import project.dto.Querydto;
import project.dao.Board_dao.Chartdao;




@Repository
public class ChartserviceImpl implements Chartservice{
	
	  
	
	@Autowired
	Chartdao Chartdao;
	
	
	
	
	
	
	
	// 전체조회
	@Override
	public 	List<Querydto> chsel(Querydto Querydto){
		
		
	List<Querydto> chsel = Chartdao.chsel(Querydto);
    System.out.println("차트조회 : " + chsel);
    return chsel;
		
	}
	
	
	// 전체조회
	@Override
	public 	List<Querydto> chselid(Querydto Querydto){
		
		
	List<Querydto> chselid = Chartdao.chselid(Querydto);
    System.out.println("차트조회id : " + chselid);
    return chselid;
		
	}
	
	
}
