package project.dao;

import java.util.List;

import project.dto.Materials_DTO;

public interface Materials_DAO {

	List<Materials_DTO> SelectList();
	
	List<Materials_DTO> selectMaterials();

	List<Materials_DTO> selectFM();

	List<Materials_DTO> updateMaterials();
	
	List<Materials_DTO> deleteMaterials();
	
	
	
}
