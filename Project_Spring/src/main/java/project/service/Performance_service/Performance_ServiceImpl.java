package project.service.Performance_service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.Performance_dao.Performance_DAOImpl;
import project.dto.Performance_DTO;

@Service
public class Performance_ServiceImpl implements Performance_Service{

	@Autowired
	Performance_DAOImpl dao;
	
	@Override
	public int pageTotalCaount() {
		int result = dao.pageTotalCaount();
		return result;
	}
	@Override
	public List pageList(Performance_DTO dto) {
		List list = new ArrayList();
		
		int page = dto.getPage();
		int viewCount = dto.getViewCount();
		
		int indexStart = ( viewCount * ( page - 1 ) ) + 1 ;
		int indexEnd = page * viewCount;
		dto.setIndexStart(indexStart);
		dto.setIndexEnd(indexEnd);
		
		list =  dao.pageList(dto);
		
		return list;
	}
	
	//삭제
	@Override
	public int performanceDelete(Performance_DTO dto) {
		int result = dao.performanceDelete(dto);
		return result;
	}
	
	// 검색
	@Override
	public List performanceSearchList(Performance_DTO dto) {
		List list = new ArrayList();
		
		int page = dto.getPage();
		int viewCount = dto.getViewCount();
		
		int indexStart = ( viewCount * ( page - 1 ) ) + 1 ;
		int indexEnd = page * viewCount;
		dto.setIndexStart(indexStart);
		dto.setIndexEnd(indexEnd);
		
		list =  dao.performanceSearchList(dto);
		return list;
	}
	//검색카운트
	@Override
	public int performanceSearchCount(Performance_DTO dto) {
		int result = dao.performanceSearchCount(dto);
		return result;
	}
	
	//업뎃
	@Override
	public int performanceUpdate(Performance_DTO dto) {
		int result = dao.performanceUpdate(dto);
		return result;
	}
	
	//삽입
	@Override
	public int performInsert(Performance_DTO dto) {
		int result = dao.performInsert(dto);
		return result;
	}
	
	
	
	
	
	
}
