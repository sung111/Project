package project.service.invenCheck_service;

import java.util.List;

import project.dto.InvenCheck_DTO;

public interface InvenCheck_Servcie {

	public List page(InvenCheck_DTO invenDTO);
	public int totalCount();
	public int matInvenDelete(InvenCheck_DTO dto);
	public int productInvenDelete(InvenCheck_DTO dto);
	public void deleteCheck(InvenCheck_DTO dto);
	public List searchInven(InvenCheck_DTO dto);
	public int searchInvenCount(InvenCheck_DTO dto);
	
	public int matInsertInven(InvenCheck_DTO dto);
	
	
}
