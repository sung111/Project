package project.service.production_process_service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dao.production_process_dao.Production_process_DAO;
import project.dto.Products_DTO;

@Repository
public class production_process_serviceimpl implements production_process_service {
	
	@Autowired
	SqlSession sqlSession;
	@Autowired 
	Production_process_DAO dao;
	
	@Override
	public List<Products_DTO> SelectProductPnamePid() {
		List list = null;
		try {
			list = dao.SelectProductPnamePid();			
		}catch (Exception e) {
		e.printStackTrace();
		}
		return list;
	}


	



}
