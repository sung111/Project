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
	
	
	
	
}
