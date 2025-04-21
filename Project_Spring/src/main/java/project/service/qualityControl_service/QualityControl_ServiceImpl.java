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

	@Override
	public List pageList(QualityControl_DTO dto) {
		List list = new ArrayList();

		int page = dto.getPage();
		int viewCount = dto.getViewCount();
		System.out.println("여잇다 ::::::::::" + dto.getViewCount());

		if (viewCount == 0) { // 기본값 세팅
			viewCount = 3;
			dto.setViewCount(viewCount);
		}

		int indexStart = (viewCount * (page - 1)) + 1;
		int indexEnd = page * viewCount;
		dto.setIndexStart(indexStart);
		dto.setIndexEnd(indexEnd);

		list = dao.pageList(dto);

		return list;
	}

	@Override
	public int pageTotalCaount() {
		int result = dao.pageTotalCaount();
		return result;
	}

}
