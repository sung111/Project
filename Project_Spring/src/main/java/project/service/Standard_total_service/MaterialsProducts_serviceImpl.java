package project.service.Standard_total_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.Standard_total_dao.MaterialsProducts_DAO;
import project.dto.Materials_DTO;

@Service
public class MaterialsProducts_serviceImpl implements MaterialsProducts_service {

	@Autowired
	MaterialsProducts_DAO materialsProducts_DAO;
	
	@Override
	public Map<String,Object> selectMaterialsProducts(Materials_DTO dto){
		
		
		Map <String,Object> map = new HashMap();
		try {
		

			
			System.out.println("dto ="+ dto);
			//한페이지의 내용만 있는 리스트
			List list = materialsProducts_DAO.selectMaterialsProducts(dto);
			//전체 글 개수 
			int count = materialsProducts_DAO.countProducts();
			
			map.put("list1", list);
			map.put("count", count);
			
			//그대로주고 DB에서 바꾸자 
				
			}catch (Exception e) {
				e.printStackTrace();
				
			}

		return map;
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
