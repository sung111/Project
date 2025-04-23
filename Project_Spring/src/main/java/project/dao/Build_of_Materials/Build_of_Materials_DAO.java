package project.dao.Build_of_Materials;

import java.util.List;

import project.dto.Bom_DTO;
import project.dto.Materials_DTO;
import project.dto.Products_DTO;

public interface Build_of_Materials_DAO {


//사용
	public List<Products_DTO> Product_All(String prosessname);
	public List<Materials_DTO> BuildOfMaterials_materialSelect(int productid);
	public List<Materials_DTO> BuildOfMaterials_materialOneList(int bomid);
	public int BuildOfMaterials_materialUpdate(Bom_DTO dto);
	public List<Materials_DTO> BuildOfMaterials_materialList();
	public int BuildOfMaterials_materialListInsert(Bom_DTO dto);
	public int BuildOfMaterials_materialListDelete(Bom_DTO dto);

	//사용안하지만 혹시몰라서  남겨둠 
//	public List<ProductionProcessDescription_DTO> SelectProcessDescription(int productid);
//	public int ProductionProcessInsert(ProductionProcessDescription_DTO dto);
//	public int ProductionProcessUpdate(ProductionProcessDescription_DTO dto);
//	public int ProductionProcessDelete(ProductionProcessDescription_DTO dto);
//	public List<ProductionProcessDescription_DTO> ProductionProcess_select_one_line(int processid);
////사용
	
	
	
}
