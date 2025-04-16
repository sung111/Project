package project.dao.Standard_total_dao;

import java.util.List;

import project.dto.Materials_DTO;

public interface Materials_DAO {

	public List<Materials_DTO> SelectList();
	

	public List<Materials_DTO> selectFM();
//사용
	public List<Materials_DTO> selectMaterials(Materials_DTO dto);
	public int insertMaterials(Materials_DTO dto);
	public int updateMaterials(Materials_DTO dto);
	public int deleteMaterials(Materials_DTO dto);
	public int countmaterials ();
//	public int updateMaterialsProducts_materials(Materials_DTO dto);
//	public int updateMaterialsProducts_products(Materials_DTO dto);
//	public int deleteMaterialsProducts_materials(Materials_DTO dto);
//	public int deleteMaterialsProducts_products(Materials_DTO dto);
////사용
	
	
	
}
