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
//사용
	
	
	
}
