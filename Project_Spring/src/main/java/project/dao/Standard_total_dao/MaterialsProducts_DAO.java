package project.dao.Standard_total_dao;

import java.util.List;

import project.dto.Materials_DTO;

public interface MaterialsProducts_DAO {

	List<Materials_DTO> selectMaterialsProducts();
	
	List<Materials_DTO> deleteMaterialsProducts();

	List<Materials_DTO> updateMaterialsProducts();

	List<Materials_DTO> updateMaterials();
	
	List<Materials_DTO> deleteMaterials();
	
	
	
}
