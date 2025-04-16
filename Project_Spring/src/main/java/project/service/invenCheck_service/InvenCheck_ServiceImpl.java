package project.service.invenCheck_service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.invenCheck_DAO.InvenCheck_DAO;
import project.dto.InvenCheck_DTO;

@Service
public class InvenCheck_ServiceImpl implements InvenCheck_Servcie{
	
	@Autowired
	InvenCheck_DAO dao;

	@Override
	public List page(InvenCheck_DTO dto) {
		List list = new ArrayList();
		
		int page = dto.getPage();
		int viewCount = dto.getViewCount();
		
		int indexStart = ( viewCount * ( page - 1 ) ) + 1 ;
		int indexEnd = page * viewCount;
		dto.setIndexStart(indexStart);
		dto.setIndexEnd(indexEnd);
		
		list = dao.page(dto);
		
		return list;
	}

	@Override
	public int totalCount() {
		int result = dao.invenTotalCount();
		return result;
	}

	@Override
	public int matInvenDelete(InvenCheck_DTO dto) {
		int result = dao.matInvenDelete(dto);
		return result;
	}
	@Override
	public int productInvenDelete(InvenCheck_DTO dto) {
		int result = dao.productInvenDelete(dto);
		return result;
	}
	
	public void deleteCheck(InvenCheck_DTO dto) {
		String str = dto.getLotnumber();
		str = str.substring(0,3);
		System.out.println(str);
		if("WPD".equals(str)) {
			int result = productInvenDelete(dto);
		} else {
			int result = matInvenDelete(dto);
		}
		
	}
	
//	검색
	@Override
	public List searchInven(InvenCheck_DTO dto) {
		
		int page = dto.getPage();
		int viewCount = dto.getViewCount();
		
		int indexStart = ( viewCount * ( page - 1 ) ) + 1 ;
		int indexEnd = page * viewCount;
		dto.setIndexStart(indexStart);
		dto.setIndexEnd(indexEnd);
		
		List list = dao.searchInven(dto);
		
		return list;
	}
	@Override
	public int searchInvenCount(InvenCheck_DTO dto) {
		int result = dao.searchInvenCount(dto);
		return result;
	}
	
//	등록
	@Override
	public int matInsertInven(InvenCheck_DTO dto) {
		int result = dao.matInsertInven(dto);
		return result;
	}
	@Override
	public int prodInsertInven(InvenCheck_DTO dto) {
		int result = dao.prodInsertInven(dto);
		return result;
	}
	
//	등록폼 option
	@Override
	public List matDB(InvenCheck_DTO dto) {
		List result = dao.matDB(dto);
		return result;
	}
	@Override
	public List prodDB(InvenCheck_DTO dto) {
		List result = dao.prodDB(dto);
		return result;
	}

	

}
