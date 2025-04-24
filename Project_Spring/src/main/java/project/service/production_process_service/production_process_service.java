package project.service.production_process_service;

import java.util.List;

import project.dto.ProductionProcessDescription_DTO;
import project.dto.Products_DTO;

public interface production_process_service {

	
//사용
	public List<Products_DTO> SelectProductPnamePid();
	public List<ProductionProcessDescription_DTO> SelectProcessDescription(int productid);
	public int ProductionProcessInsert(ProductionProcessDescription_DTO dto);
	public int ProductionProcessUpdate(ProductionProcessDescription_DTO dto);
	public int ProductionProcessDelete(ProductionProcessDescription_DTO dto);
	public List<ProductionProcessDescription_DTO> ProductionProcess_select_one_line(int processid);
////사용
	
	
	
}
