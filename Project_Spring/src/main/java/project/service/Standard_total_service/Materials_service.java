package project.service.Standard_total_service;

import java.util.List;
import java.util.Map;


import project.dto.Materials_DTO;

public interface Materials_service {

	List<Materials_DTO> SelectList();
	
	public Map<String,Object> selectMaterials(Materials_DTO dto);

	List<Materials_DTO> selectFM();

	List<Materials_DTO> updateMaterials();
	
	List<Materials_DTO> deleteMaterials();
}
