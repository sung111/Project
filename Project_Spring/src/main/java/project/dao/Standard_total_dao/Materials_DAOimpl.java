package project.dao.Standard_total_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dto.Materials_DTO;

@Repository
public class Materials_DAOimpl implements Materials_DAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Materials_DTO> SelectList() {
		

		
		return null;
	}

	@Override
	public List<Materials_DTO> selectMaterials() {
		List<Materials_DTO> result = sqlSession.selectList("mapper.emp.selectMaterials");
		System.out.println("SelectList 의 값 ="+result);
		return result;
	}

	@Override
	public List<Materials_DTO> selectFM() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Materials_DTO> updateMaterials() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Materials_DTO> deleteMaterials() {
		// TODO Auto-generated method stub
		return null;
	}

}
