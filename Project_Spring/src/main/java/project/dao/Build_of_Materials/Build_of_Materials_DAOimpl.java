package project.dao.Build_of_Materials;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dto.Materials_DTO;
import project.dto.Products_DTO;

@Repository
public class Build_of_Materials_DAOimpl implements Build_of_Materials_DAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<Products_DTO> Product_All(String prosessname) {
		List list = null;
		try {
			list = sqlSession.selectList("mapper.bom.product_SelectALL",prosessname);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Materials_DTO> BuildOfMaterials_materialSelect(int productid) {
		List list = null;
		try {
			list = sqlSession.selectList("mapper.bom.BuildOfMaterials_materialSelect",productid);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Materials_DTO> BuildOfMaterials_materialList() {
		List list = null;
		try {
			list = sqlSession.selectList("mapper.bom.BuildOfMaterials_materialList");
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	

	
	
	





}
