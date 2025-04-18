package project.dao.production_process_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dto.ProductionProcessDescription_DTO;
import project.dto.Products_DTO;

@Repository
public class Production_process_DAOimpl implements Production_process_DAO {
	
	@Autowired
	SqlSession sqlSession;

	//프러덕트 이름과 id조회
	@Override
	public List<Products_DTO> SelectProductPnamePid() {
		List list = null;
		try {
			list = sqlSession.selectList("mapper.bom.SelectProductPnamePid");	
			
		}catch (Exception e) {
		e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ProductionProcessDescription_DTO> SelectProcessDescription(int productid) {
		List list = null;
		try {
			
			list = sqlSession.selectList("mapper.bom.SelectProductPid_All",productid);	
			
		}catch (Exception e) {
		e.printStackTrace();
		}
		return list;
	}

	@Override
	public int ProductionProcessInsert(ProductionProcessDescription_DTO dto) {
		int result = 0;
		try {
			
			result = sqlSession.insert("mapper.bom.ProductionProcessInsert",dto);	
			
		}catch (Exception e) {
		e.printStackTrace();
		}
		return result;
	}
	
	//프러덕트 id를 통해 같은 생상공정 id파트 셀렉트
	
	

	





}
