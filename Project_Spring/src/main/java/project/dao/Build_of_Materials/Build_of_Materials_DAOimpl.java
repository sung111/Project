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
	public List<Products_DTO> Product_All(Products_DTO dto) {
		List list = null;
		try {
		
			int page = dto.getPage(); //현재 페이지 
			int viewCount = dto.getFourViewCount(); //한페이지당 보여줄 컨텐츠 계수 
			
			int indexStart = (viewCount * (page-1)) +1; //이전페이지 마지막에서 +1
			int indexEnd = page * viewCount; // 비번페이지 마지막 
			
			dto.setIndexStart(indexStart);
			dto.setIndexEnd(indexEnd);
			
			list = sqlSession.selectList("mapper.bom.product_SelectALL",dto);
			System.out.println("selectProducts 실행");
			System.out.println("list 값="+ list);
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Materials_DTO> BuildOfMaterials_materialSelect(Materials_DTO dto) {
		List list = null;
		try {
			System.out.println("BuildOfMaterials_materialSelect 실행");
			int page = dto.getPage();
			int viewCount = dto.getBuildOfMaterialsviewCount();
			
			int indexStart = (viewCount * (page-1)) +1; //이전페이지 마지막에서 +1
			int indexEnd = page * viewCount; // 비번페이지 마지막 
			
			dto.setIndexStart(indexStart);
			dto.setIndexEnd(indexEnd);
			
			list = sqlSession.selectList("mapper.bom.BuildOfMaterials_materialSelect",dto);
			System.out.println("list 값="+ list);
			
			
			
			
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

	@Override
	public int BuildOfMaterials_materialCount(Materials_DTO dto) {
		int result = 0;
		try {
			result = sqlSession.selectOne("mapper.bom.BuildOfMaterials_materialCount",dto);
			System.out.println("BuildOfMaterials_materialCount실행");
			System.out.println("result 값="+result);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	

	
	
	





}
