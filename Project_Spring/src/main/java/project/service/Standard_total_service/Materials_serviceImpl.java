package project.service.Standard_total_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.Standard_total_dao.Materials_DAO;
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
		int result = materials_DAO.insertMaterials(dto);
		
		return result;
	}
	//원재료수정
	@Override
	public int updateMaterials(Materials_DTO dto) {
		int result = materials_DAO.updateMaterials(dto);
		return result;
	}

	@Override
	public int deleteMaterials(Materials_DTO dto) {
		int result = materials_DAO.deleteMaterials(dto);
		return result;
	}



}
