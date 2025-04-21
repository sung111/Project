package project.service.Build_of_Materials;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dao.Build_of_Materials.Build_of_Materials_DAO;
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
	
	

	



}
