package project.dao.Performance_dao;

import java.util.List;

import project.dto.Performance_DTO;

public interface Performance_DAO {

	// 페이지네이션
	public List pageList(Performance_DTO dto);
	public int pageTotalCaount();
	
	//삭제
	public int performanceDelete(Performance_DTO dto);

	//검색
	public List performanceSearchList(Performance_DTO dto);
	public int performanceSearchCount(Performance_DTO dto);
	
	//업뎃
	public int performanceUpdate(Performance_DTO dto);
	
//	삽입
	public int performInsert(Performance_DTO dto);
}
