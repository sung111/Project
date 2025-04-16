package project.dao.invenCheck_DAO;

import java.util.List;

import project.dto.InvenCheck_DTO;

public interface InvenCheck_DAO {
	
//	페이징
	public List page(InvenCheck_DTO dto);
	public int invenTotalCount();
	
//	삭제
	public int matInvenDelete(InvenCheck_DTO dto);
	public int productInvenDelete(InvenCheck_DTO dto);
	
//	검색
	public List searchInven(InvenCheck_DTO dto);
	public int searchInvenCount(InvenCheck_DTO dto);
	
//	등록
	public int matInsertInven(InvenCheck_DTO dto);
	public int prodInsertInven(InvenCheck_DTO dto);
	
//	옵션 리스트
	public List matDB(InvenCheck_DTO dto);
	public List prodDB(InvenCheck_DTO dto);
	
	
	
}
