package project.dao.Standard_total_dao;

import java.util.List;

import project.dto.Materials_DTO;
import project.dto.Products_DTO;

public interface MaterialsProducts_DAO {

	
	List<Materials_DTO> deleteMaterialsProducts();

	List<Materials_DTO> updateMaterialsProducts();

	List<Materials_DTO> updateMaterials();
	
	List<Materials_DTO> deleteMaterials();
	
// 사용하는거 
	public int updateMaterialsProducts_products(Materials_DTO dto);
	public int deleteMaterialsProducts_products(Materials_DTO dto);
	List<Materials_DTO> selectMaterialsProducts(Materials_DTO dto);
	public int countProducts ();
}
