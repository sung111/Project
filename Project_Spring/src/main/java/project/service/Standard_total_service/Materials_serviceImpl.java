package project.service.Standard_total_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.Standard_total_dao.Materials_DAO;
import project.dto.Materials_DTO;
import project.dto.Products_DTO;

@Service
public class Materials_serviceImpl implements Materials_service {
	
	@Autowired
	Materials_DAO materials_DAO;
	
	@Override
	public List<Materials_DTO> SelectList() {

		return null;
	}

	@Override
	public List<Materials_DTO> selectMaterials() {
		List<Materials_DTO> list = null;
		try {
		
			list = materials_DAO.selectMaterials();
				
			}catch (Exception e) {
				e.printStackTrace();
				
			}

		return list;
	}

	@Override
	public List<Materials_DTO> selectFM() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Materials_DTO> updateMaterials() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Materials_DTO> deleteMaterials() {
		// TODO Auto-generated method stub
		return null;
	}

}
