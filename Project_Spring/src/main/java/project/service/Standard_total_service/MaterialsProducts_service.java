package project.service.Standard_total_service;

import java.util.List;
import java.util.Map;

import project.dto.Materials_DTO;

public interface MaterialsProducts_service {

	public Map<String,Object> selectMaterialsProducts(Materials_DTO dto);
	
	
	List<Materials_DTO> deleteMaterialsProducts();

	List<Materials_DTO> updateMaterialsProducts();

	List<Materials_DTO> updateMaterials();
	
	List<Materials_DTO> deleteMaterials();
	
	
	
}
