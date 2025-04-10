package project.dao.invenCheck_DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dto.InvenCheck_DTO;

@Repository
public class InvenCheck_DAOImpl implements InvenCheck_DAO{
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List page(InvenCheck_DTO dto) {

		System.out.println("db들어가기전에 dao에서 받은 dto 출력하기"+dto);
		List list = sqlSession.selectList("project.mapper.InvenCheck.InvenCheckPage", dto);
		System.out.println("DB 갔따온 list :::" + list);
		
		return list;
	}

	@Override
	public int invenTotalCount() {
		int result = sqlSession.selectOne("project.mapper.InvenCheck.invenCount");
		System.out.println("totalcount 35나와야댐" + result);
		return result;
	}
	
	
	
	
	

}
