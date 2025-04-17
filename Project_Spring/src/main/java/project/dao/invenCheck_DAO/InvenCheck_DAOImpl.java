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
	
//	페이지네이션
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
	
//	삭제
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
	
//	검색 
	@Override
	public List searchInven(InvenCheck_DTO dto) {
		List list = sqlSession.selectList("project.mapper.InvenCheck.searchInven", dto);
		return list;
	}
	@Override
	public int searchInvenCount(InvenCheck_DTO dto) {
		int result = sqlSession.selectOne("project.mapper.InvenCheck.searchInvenCount",dto);
		return result;
	}
	
//	등록
	@Override
	public int matInsertInven(InvenCheck_DTO dto) {
		int result = sqlSession.insert("project.mapper.InvenCheck.matInsertInven",dto);
		return result;
	}
	@Override
	public int prodInsertInven(InvenCheck_DTO dto) {
		int result = sqlSession.insert("project.mapper.InvenCheck.prodInsertInven",dto);
		return result;
	}
	
//	등록폼 option 보여주기위함
	@Override
	public List matDB(InvenCheck_DTO dto) {
		List result = sqlSession.selectList("project.mapper.InvenCheck.matDB",dto);
		return result;
	}
	@Override
	public List prodDB(InvenCheck_DTO dto) {
		List result = sqlSession.selectList("project.mapper.InvenCheck.prodDB",dto);
		return result;
	}
	
//	수정
//	완제품
	@Override
	public int prodInvenUpdate(InvenCheck_DTO dto) {
		int result = sqlSession.update("project.mapper.InvenCheck.prodInvenUpdate",dto);
		return result;
	}
//	원자재
	@Override
	public int matInvenUpdate(InvenCheck_DTO dto) {
		int result = sqlSession.update("project.mapper.InvenCheck.matInvenUpdate",dto);
		return result;
	}
	
	
	
	

}
