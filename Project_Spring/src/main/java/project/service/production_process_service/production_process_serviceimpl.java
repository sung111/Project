package project.service.production_process_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dao.production_process_dao.Production_process_DAO;
import project.dto.ProductionProcessDescription_DTO;
import project.dto.Products_DTO;

@Repository
public class production_process_serviceimpl implements production_process_service {
	

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

	@Override
	public List<ProductionProcessDescription_DTO> SelectProcessDescription(int productid) {
		List list = null;
		try {
			list = dao.SelectProcessDescription(productid);	
			
		}catch (Exception e) {
		e.printStackTrace();
		}
		return list;
	}

	@Override
	public int ProductionProcessInsert(ProductionProcessDescription_DTO dto) {
		int result = 0;
		try {
			
			result = dao.ProductionProcessInsert(dto);	
			
		}catch (Exception e) {
		e.printStackTrace();
		}
		return result;
	}

	@Override
	public int ProductionProcessUpdate(ProductionProcessDescription_DTO dto) {
		int result = 0;
		try {
			
			result = dao.ProductionProcessUpdate(dto);	
			
		}catch (Exception e) {
		e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<ProductionProcessDescription_DTO> ProductionProcess_select_one_line(int processid) {
		List list = null;
		try {
			
			list = dao.ProductionProcess_select_one_line(processid);
			
		}catch (Exception e) {
		e.printStackTrace();
		}
		return list;
	}

	@Override
	public int ProductionProcessDelete(ProductionProcessDescription_DTO dto) {
		int result = 0;
		try {
			
			result = dao.ProductionProcessDelete(dto);
			
		}catch (Exception e) {
		e.printStackTrace();
		}
		return result;
	}


	



}
