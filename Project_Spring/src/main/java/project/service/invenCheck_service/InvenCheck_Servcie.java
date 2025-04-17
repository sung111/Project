package project.service.invenCheck_service;

import java.util.List;

import project.dto.InvenCheck_DTO;

public interface InvenCheck_Servcie {

	public List page(InvenCheck_DTO invenDTO);
	public int totalCount();
	
	public void deleteCheck(InvenCheck_DTO dto);
	public int matInvenDelete(InvenCheck_DTO dto);
	public int productInvenDelete(InvenCheck_DTO dto);
	
	public List searchInven(InvenCheck_DTO dto);
	public int searchInvenCount(InvenCheck_DTO dto);
	
	public int matInsertInven(InvenCheck_DTO dto);
	public int prodInsertInven(InvenCheck_DTO dto);
	
	public List prodDB(InvenCheck_DTO dto);
	public List matDB(InvenCheck_DTO dto);
	
	public int invenUpdateCheck(InvenCheck_DTO dto);
	public int prodInvenUpdate(InvenCheck_DTO dto);
	public int matInvenUpdate(InvenCheck_DTO dto);
	
	
}
