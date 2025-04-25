package project.service.Build_of_Materials;

import java.util.List;
import java.util.Map;

import project.dto.Bom_DTO;
import project.dto.Materials_DTO;
import project.dto.ProductionProcessDescription_DTO;
import project.dto.Products_DTO;

public interface Build_of_Materials_service {

	
//사용
	public  Map<String,Object> Product_All(Products_DTO dto);
	
	public List<Materials_DTO> BuildOfMaterials_materialSelect(int productid);
	public List<Materials_DTO> BuildOfMaterials_materialList();
	public int BuildOfMaterials_materialUpdate(Bom_DTO dto);
	public int BuildOfMaterials_materialListInsert(Bom_DTO dto);
	public int BuildOfMaterials_materialListDelete(Bom_DTO dto);
	public List<Materials_DTO> BuildOfMaterials_materialOneList(int bomid);
////사용
	
	
	
}
