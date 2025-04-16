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
	public List<Materials_DTO> selectMaterialsProducts(Materials_DTO dto) {
		
		List<Materials_DTO> list = null;
		try {
			
			int page = dto.getPage();
			int viewCount = dto.getViewCount();
			
			int indexStart = (viewCount * (page-1)) +1; //이전페이지 마지막에서 +1
			int indexEnd = page * viewCount; // 비번페이지 마지막 
			
			dto.setIndexStart(indexStart);
			dto.setIndexEnd(indexEnd);
			
			list = sqlSession.selectList("mapper.bom.selectPageMaterialsProducts",dto);
			System.out.println("selectMaterialsProducts 실행");
			System.out.println("list 값="+ list);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
		
		
	}

	@Override
	public int countProducts() {
		int result = sqlSession.selectOne("mapper.bom.totalMaPr");
		System.out.println("countEmp실행");
		System.out.println("result 값="+result);
		
		return result;
	}
	@Override
	public int updateMaterialsProducts_products(Materials_DTO dto) {
		int result = 0;
		try {
			result = sqlSession.update("mapper.bom.updateMaterialsProducts_products",dto);
			System.out.println("result 값="+result);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	
		
		return result;
	}
	
	@Override
	public int deleteMaterialsProducts_products(Materials_DTO dto) {
		
		int result = 0;
		try {
			result = sqlSession.update("mapper.bom.deleteMaterialsProducts_products",dto);
			System.out.println("result 값="+result);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	
		
		return result;
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
