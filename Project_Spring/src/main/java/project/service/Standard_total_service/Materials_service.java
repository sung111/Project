package project.service.Standard_total_service;

import java.util.List;
import java.util.Map;


import project.dto.Materials_DTO;

public interface Materials_service {

	public List<Materials_DTO> SelectList();
	

	public List<Materials_DTO> selectFM();
//사용하는거
	public Map<String,Object> selectMaterials(Materials_DTO dto);
	public int insertMaterials(Materials_DTO dto);
	public int updateMaterials(Materials_DTO dto);
	public int deleteMaterials(Materials_DTO dto);
	
}
