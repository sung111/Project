package project.service.Standard_total_service;

import java.util.List;

import project.dto.Materials_DTO;

public interface MaterialsProducts_service {

	List<Materials_DTO> selectMaterialsProducts();
	
	List<Materials_DTO> deleteMaterialsProducts();

	List<Materials_DTO> updateMaterialsProducts();

	List<Materials_DTO> updateMaterials();
	
	List<Materials_DTO> deleteMaterials();
	
	
	
}
