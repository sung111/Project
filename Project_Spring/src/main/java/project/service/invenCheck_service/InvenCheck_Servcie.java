package project.service.invenCheck_service;

import java.util.List;

import project.dto.InvenCheck_DTO;

public interface InvenCheck_Servcie {

	public List page(InvenCheck_DTO invenDTO);
	public int totalCount();
	public int invenDelete(InvenCheck_DTO dto);
	
}
