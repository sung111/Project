package project.service.Build_of_Materials;

import java.util.List;

import project.dto.Materials_DTO;
import project.dto.ProductionProcessDescription_DTO;
import project.dto.Products_DTO;

public interface Build_of_Materials_service {

	
//사용
	public List<Products_DTO> Product_All(String prosessname);
	public List<Materials_DTO> BuildOfMaterials_materialSelect(int productid);
	public List<Materials_DTO> BuildOfMaterials_materialList();
////사용
	
	
	
}
