package project.service.Build_of_Materials;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dao.Build_of_Materials.Build_of_Materials_DAO;
import project.dao.Standard_total_dao.Products_DAO;
import project.dto.Bom_DTO;
import project.dto.Materials_DTO;
import project.dto.Products_DTO;

@Repository
public class Build_of_Materials_serviceimpl implements Build_of_Materials_service {
	

	@Autowired 
	Build_of_Materials_DAO dao;
	@Autowired 
	Products_DAO products_DAO;
	
	@Override
	public Map<String,Object> Product_All(Products_DTO dto) {
		Map <String,Object> map = new HashMap();
		
		try {
			
			//한페이지의 내용만 있는 리스트
			List list = dao.Product_All(dto);
			//전체 글 개수 
			int count = products_DAO.countProducts(dto);
			
			map.put("list", list);
			map.put("count", count);
			
			System.out.println("selectProducts 실행");
			System.out.println("list :"+list+""+"count :"+count);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return map;
	}

	@Override
	public Map<String,Object> BuildOfMaterials_materialSelect(Materials_DTO dto) {
		List list = null;
		Map <String,Object> map = new HashMap();
		try {
			//한페이지의 내용만 있는 리스트
			list = dao.BuildOfMaterials_materialSelect(dto);
			//전체 글 개수 
			int count = dao.BuildOfMaterials_materialCount(dto);
			map.put("list", list);
			map.put("count", count);
			System.out.println("BuildOfMaterials_materialSelect 실행");
			System.out.println("list :"+list+""+"count :"+count);
		
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return map;
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
