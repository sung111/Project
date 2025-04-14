package project.dao.invenCheck_DAO;

import java.util.List;

import org.apache.ibatis.jdbc.SQL;
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
		List list = sqlSession.selectList("project.mapper.InvenCheck.InvenCheckPage", dto);
		return list;
	}

	@Override
	public int invenTotalCount() {
		int result = sqlSession.selectOne("project.mapper.InvenCheck.invenCount");
		return result;
	}

	@Override
	public int matInvenDelete(InvenCheck_DTO dto) {
		int result = sqlSession.delete("project.mapper.InvenCheck.matInvenDelete", dto);
		return result;
	}
	@Override
	public int productInvenDelete(InvenCheck_DTO dto) {
		int result = sqlSession.delete("project.mapper.InvenCheck.productInvenDelete", dto);
		return result;
	}
	@Override
	public List searchInven(InvenCheck_DTO dto) {
		List list = sqlSession.selectList("project.mapper.InvenCheck.searchInven", dto);
		return list;
	}
	@Override
	public int searchInvenCount(InvenCheck_DTO dto) {
		int result = sqlSession.selectOne("project.mapper.InvenCheck.searchInvenCount",dto);
		System.out.println("dao검색개수인데요?"+result);
		return result;
	}
	
	
	
	
	
	

}
