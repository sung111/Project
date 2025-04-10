package project.service.Standard_total_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.Standard_total_dao.MaterialsProducts_DAO;
import project.dto.Materials_DTO;

@Service
public class MaterialsProducts_serviceImpl implements MaterialsProducts_service {

	@Autowired
	MaterialsProducts_DAO materialsProducts_DAO;
	
	@Override
	public List<Materials_DTO> selectMaterialsProducts() {
		List<Materials_DTO> list = null;
		
		try {
			list = materialsProducts_DAO.selectMaterialsProducts();

		} catch (Exception e) {
			e.printStackTrace();

		}
		return list;
	}

	@Override
	public List<Materials_DTO> deleteMaterialsProducts() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Materials_DTO> updateMaterialsProducts() {
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
