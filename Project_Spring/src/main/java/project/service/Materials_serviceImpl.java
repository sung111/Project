package project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.Materials_DAO;
import project.dto.Materials_DTO;

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
		List list = materials_DAO.selectMaterials();
//		System.out.println("Materials_serviceImpl_selectMaterials실행");
//		System.out.println("list값 ="+list);
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
