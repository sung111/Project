package project.dao.qualityControl_DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dto.QualityControl_DTO;

@Repository
public class QualityControl_DAOImpl implements QualityControl_DAO{

	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List pageList(QualityControl_DTO dto) {
		List list = sqlsession.selectList("project.mapper.Performance.performFristList",dto);
		return list;
	}
	@Override
	public int pageTotalCaount() {
		int result = sqlsession.selectOne("project.mapper.Performance.performTotalCount");
		return result;
	}
	
//	품질관리 리스트
	@Override
	public List QualityList(QualityControl_DTO dto) {
		List list = sqlsession.selectList("project.mapper.Quality.QualityView",dto);
		return list;
	}
	@Override
	public int QualityTotalCount() {
		int result = sqlsession.selectOne("project.mapper.Quality.QualityTotalCount");
		return result;
	}
	
//	삽입
	@Override
	public int QualityInsert(QualityControl_DTO dto) {
		int result = sqlsession.insert("project.mapper.Quality.QualityInsert", dto);
		return result;
	}
	
//	검색리스트
	@Override
	public List searchQualList(QualityControl_DTO dto) {
		List list = sqlsession.selectList("project.mapper.Quality.searchQualList",dto);
		return list;
	}
	@Override
	public int searchQualTotalCount(QualityControl_DTO dto) {
		int result = sqlsession.selectOne("project.mapper.Quality.searchQualTotalCount", dto);
		return result;
	}
	
//	업뎃
	@Override
	public int QualUpdate(QualityControl_DTO dto) {
		int result = sqlsession.update("project.mapper.Quality.QualUpdate", dto);
		return result;
	}
	
//	삭제
	@Override
	public int QaulDelete(QualityControl_DTO dto) {
		int result = sqlsession.delete("project.mapper.Quality.QaulDelete", dto);
		return result;
	}

	
}
