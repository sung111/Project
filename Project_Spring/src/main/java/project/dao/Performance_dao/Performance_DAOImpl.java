package project.dao.Performance_dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dto.Performance_DTO;

@Repository
public class Performance_DAOImpl implements Performance_DAO{

	@Autowired
	SqlSession sqlsession;
	
	// 페이지네이션
	@Override
	public List pageList(Performance_DTO dto) {
		List list = sqlsession.selectList("project.mapper.Performance.performFristList",dto);
		return list;
	}
	@Override
	public int pageTotalCaount() {
		int result = sqlsession.selectOne("project.mapper.Performance.performTotalCount");
		return result;
	}
	
	
	//삭제
	@Override
	public int performanceDelete(Performance_DTO dto) {
		int result = sqlsession.delete("project.mapper.Performance.performanceDelete", dto);
		return result;
	}
	
	
	// 검색
	@Override
	public List performanceSearchList(Performance_DTO dto) {
		List result = sqlsession.selectList("project.mapper.Performance.performanceSearch", dto);
		return result;
	}
	// 검색카운트
	@Override
	public int performanceSearchCount(Performance_DTO dto) {
		int result = sqlsession.selectOne("project.mapper.Performance.performanceSearchCount", dto);
		return result;
	}
	
	//업데이트
	@Override
	public int performanceUpdate(Performance_DTO dto) {
		int result = sqlsession.update("project.mapper.Performance.performanceUpdate", dto);
		return result;
	}
	
	
	
}
