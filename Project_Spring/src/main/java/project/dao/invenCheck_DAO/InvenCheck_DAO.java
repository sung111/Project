package project.dao.invenCheck_DAO;

import java.util.List;

import project.dto.InvenCheck_DTO;

public interface InvenCheck_DAO {
	
	public List page(InvenCheck_DTO dto);
	public int invenTotalCount();
	public int matInvenDelete(InvenCheck_DTO dto);
	public int productInvenDelete(InvenCheck_DTO dto);
	public List searchInven(InvenCheck_DTO dto);
	public int searchInvenCount(InvenCheck_DTO dto);
	
	
	
}
