package project.dao.Build_of_Materials;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dto.Bom_DTO;
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

	@Override
	public int BuildOfMaterials_materialListInsert(Bom_DTO dto) {
		int result = 0;
		try {
			result = sqlSession.insert("mapper.bom.BuildOfMaterials_materialListInsert",dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int BuildOfMaterials_materialListDelete(Bom_DTO dto) {
		int result = 0;
		try {
			result = sqlSession.update("mapper.bom.BuildOfMaterials_materialListDelete",dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Materials_DTO> BuildOfMaterials_materialOneList(int bomid) {
		List list = null;
		try {
			list = sqlSession.selectList("mapper.bom.BuildOfMaterials_materialOneList",bomid);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int BuildOfMaterials_materialUpdate(Bom_DTO dto) {
		int result = 0;
		try {
			result = sqlSession.update("mapper.bom.BuildOfMaterials_materialListUpdate",dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	

	
	
	





}
