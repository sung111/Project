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
}
