package project.service.qualityControl_service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.qualityControl_DAO.QualityControl_DAO;
import project.dto.QualityControl_DTO;

@Service
public class QualityControl_ServiceImpl implements QualityControl_Service {

	@Autowired
	QualityControl_DAO dao;

	// 실적등록 리스트
	@Override
	public List pageList(QualityControl_DTO dto) {
		List list = new ArrayList();

		int page = dto.getPage();
		int viewCount = dto.getViewCount();

		if (viewCount == 0) { // 기본값 세팅
			viewCount = 7;
			dto.setViewCount(viewCount);
		}

		int indexStart = (viewCount * (page - 1)) + 1;
		int indexEnd = page * viewCount;
		dto.setIndexStart(indexStart);
		dto.setIndexEnd(indexEnd);

		list = dao.pageList(dto);

		return list;
	}
	// 실적등록 카운트
	@Override
	public int pageTotalCaount() {
		int result = dao.pageTotalCaount();
		return result;
	}
	
	//품질등록 리스트
	@Override
	public List QualityList(QualityControl_DTO dto) {
		List list = new ArrayList();

		int page = dto.getPage();
		int viewCount = dto.getViewCount();

		int indexStart = (viewCount * (page - 1)) + 1;
		int indexEnd = page * viewCount;
		dto.setIndexStart(indexStart);
		dto.setIndexEnd(indexEnd);

		list = dao.QualityList(dto);

		return list;
	}
//	품질등록 카운트
	@Override
	public int QualityTotalCount() {
		int result = dao.QualityTotalCount();
		return result;
	}
	
//	삽입
	@Override
	public int QualityInsert(QualityControl_DTO dto) {
		int result = dao.QualityInsert(dto);
		return result;
	}
	
//	검색리스트
	@Override
	public List searchQualList(QualityControl_DTO dto) {
		List list = new ArrayList();

		int page = dto.getPage();
		int viewCount = dto.getViewCount();

		int indexStart = (viewCount * (page - 1)) + 1;
		int indexEnd = page * viewCount;
		dto.setIndexStart(indexStart);
		dto.setIndexEnd(indexEnd);
		System.out.println("end ::::::"+dto.getIndexEnd() + ",,,start :::: "+dto.getIndexStart());
		

		list = dao.searchQualList(dto);

		return list;
	}
//	검색 카운트
	@Override
	public int searchQualTotalCount(QualityControl_DTO dto) {
		int result = dao.searchQualTotalCount(dto);
		return result;
	}
//	업뎃
	@Override
	public int QualUpdate(QualityControl_DTO dto) {
		int result = dao.QualUpdate(dto);
		return result;
	}
//	삭제
	@Override
	public int QaulDelete(QualityControl_DTO dto) {
		int result = dao.QaulDelete(dto);
		return result;
	}
//	모달창 구현
	@Override
	public QualityControl_DTO QaulModalSelect(int productid) {
		QualityControl_DTO result = dao.QaulModalSelect(productid);
		return result;
	}
	
	
}
