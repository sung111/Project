package project.service.Standard_total_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.Standard_total_dao.MaterialsProducts_DAO;
import project.dao.Standard_total_dao.Materials_DAO;
import project.dto.Materials_DTO;

@Service
public class Materials_serviceImpl implements Materials_service {
	
	@Autowired
	Materials_DAO materials_DAO;
	
	@Autowired
	MaterialsProducts_DAO materialsProducts_DAO;
	
	@Override
	public List<Materials_DTO> SelectList() {

		return null;
	}

	@Override
	public Map<String,Object> selectMaterials(Materials_DTO dto){
		
		Map <String,Object> map = new HashMap();
		try {
		

			
			System.out.println("dto ="+ dto);
			//한페이지의 내용만 있는 리스트
			List list = materials_DAO.selectMaterials(dto);
			//전체 글 개수 
			int count = materials_DAO.countmaterials();
			
			map.put("list1", list);
			map.put("count", count);
			
			//그대로주고 DB에서 바꾸자 
				
			}catch (Exception e) {
				e.printStackTrace();
				
			}

		return map;
	
	}

	@Override
	public List<Materials_DTO> selectFM() {
		// TODO Auto-generated method stub
		return null;
	}

	//원재료생성
	@Override
	public int insertMaterials(Materials_DTO dto) {
		int result = 0;
		try {
			result = materials_DAO.insertMaterials(dto);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	//원재료수정 , 전체조회 완제품수정
	@Override
	public int updateMaterials(Materials_DTO dto) {
		int result = 0;
		try {
			if(dto.getType().equals("m") || dto.getType().equals("")) {
				System.out.println("원재료서비스 -원재료 수정실행");
				result = materials_DAO.updateMaterials(dto);
			}else if(dto.getType().equals("p")) {
				System.out.println("원재료서비스 -완재품 수정실행");
				result = materialsProducts_DAO.updateMaterialsProducts_products(dto);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	// 원재료삭제 , 전체조회 완제품삭제
	@Override
	public int deleteMaterials(Materials_DTO dto) {
		
		int result = 0;
		try {
			if(dto.getType().equals("m") || dto.getType().equals("")) {
				System.out.println("원재료서비스 -원재료 삭제실행");
				result = materials_DAO.deleteMaterials(dto);
			}else if(dto.getType().equals("p")) {
				System.out.println("원재료서비스 -완제품 삭제실행");
				result = materialsProducts_DAO.deleteMaterialsProducts_products(dto);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	
		return result;
	}



}
