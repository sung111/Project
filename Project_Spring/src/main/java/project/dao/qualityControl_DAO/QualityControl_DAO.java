package project.dao.qualityControl_DAO;

import java.util.List;

import project.dto.QualityControl_DTO;

public interface QualityControl_DAO {
//	실적등록 리스트
	public List pageList(QualityControl_DTO dto);
	public int pageTotalCaount();
	
//	품질관리 리스트
	public List QualityList(QualityControl_DTO dto);
	public int QualityTotalCount();
	
//	삽입
	public int QualityInsert(QualityControl_DTO dto);
	
//	검색리스트
	public List searchQualList(QualityControl_DTO dto);
	public int searchQualTotalCount(QualityControl_DTO dto);
	
//	업뎃
	public int QualUpdate(QualityControl_DTO dto);
	
//	삭제
	public int QaulDelete(QualityControl_DTO dto);
	
//	모달창구현
	public QualityControl_DTO QaulModalSelect(int productid);
	
}
