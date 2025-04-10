package project.dao.Standard_total_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dto.Materials_DTO;
import project.dto.Products_DTO;

@Repository
public class MaterialsProducts_DAOImpl implements MaterialsProducts_DAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<Materials_DTO> selectMaterialsProducts() {
		List<Materials_DTO> list = null;
		
		try {
			list = sqlSession.selectList("mapper.emp.selectMaterialsProducts");

		} catch (Exception e) {
			e.printStackTrace();

		}
		return list;
	}

	@Override
	public List<Materials_DTO> deleteMaterialsProducts() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Materials_DTO> updateMaterialsProducts() {
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
