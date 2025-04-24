package project.dao.Board_dao;

import java.util.List;

import org.springframework.stereotype.Repository;


import project.dto.Querydto;


public interface Chartdao {

	
	
	
	public List<Querydto> chsel(Querydto Querydto);
	public 	List<Querydto> chselid(Querydto Querydto);
	public 	List<Querydto> monchsel(Querydto Querydto);
	
}
