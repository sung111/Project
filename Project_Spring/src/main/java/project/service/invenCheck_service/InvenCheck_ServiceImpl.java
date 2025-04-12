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
		
		System.out.println("dto : " + dto);
		
		list = dao.page(dto);
		
		return list;
	}

	@Override
	public int totalCount() {
		
		int result = dao.invenTotalCount();
		
		return result;
	}

	@Override
	public int invenDelete(InvenCheck_DTO dto) {

		System.out.println("서비스!!!!!!에서 인벤아이디 받아와라고" + dto);
		int result = dao.invenDelete(dto);
		System.out.println("서비스가 DAO 다녀왔다고 쌰발 " + result);
		return result;
	}

}
