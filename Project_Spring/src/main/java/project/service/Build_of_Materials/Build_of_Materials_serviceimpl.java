package project.service.Build_of_Materials;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dao.Build_of_Materials.Build_of_Materials_DAO;
import project.dto.Bom_DTO;
import project.dto.Materials_DTO;
import project.dto.Products_DTO;

@Repository
public class Build_of_Materials_serviceimpl implements Build_of_Materials_service {
	

	@Autowired 
	Build_of_Materials_DAO dao;

	@Override
	public List<Products_DTO> Product_All(String prosessname) {
		List list = null;
		try {
			list = dao.Product_All(prosessname);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Materials_DTO> BuildOfMaterials_materialSelect(int productid) {
		List list = null;
		try {
			list = dao.BuildOfMaterials_materialSelect(productid);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Materials_DTO> BuildOfMaterials_materialList() {
		List list = null;
		try {
			list = dao.BuildOfMaterials_materialList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int BuildOfMaterials_materialListInsert(Bom_DTO dto) {
		int result = 0;
		try {
			result = dao.BuildOfMaterials_materialListInsert(dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int BuildOfMaterials_materialListDelete(Bom_DTO dto) {
		int result = 0;
		try {
			result = dao.BuildOfMaterials_materialListDelete(dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Materials_DTO> BuildOfMaterials_materialOneList(int bomid) {
		List list = null;
		try {
			list = dao.BuildOfMaterials_materialOneList(bomid);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int BuildOfMaterials_materialUpdate(Bom_DTO dto) {
		int result = 0;
		try {
			result = dao.BuildOfMaterials_materialUpdate(dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	

	



}
