package project.dao.Standard_total_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dto.Materials_DTO;
import project.dto.Products_DTO;

@Repository
public class Products_DAOImpl implements Products_DAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Products_DTO> selectProducts(Products_DTO dto){
		List<Products_DTO> list = null;
		try {
			
			int page = dto.getPage();
			int viewCount = dto.getViewCount();
			
			int indexStart = (viewCount * (page-1)) +1; //이전페이지 마지막에서 +1
			int indexEnd = page * viewCount; // 비번페이지 마지막 
			
			dto.setIndexStart(indexStart);
			dto.setIndexEnd(indexEnd);
			
			list = sqlSession.selectList("mapper.bom.selectPageProducts",dto);
			System.out.println("selectProducts 실행");
			System.out.println("list 값="+ list);
			
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
			
		return list;
	}
	
	@Override
	public int countProducts() {
		int result = sqlSession.selectOne("mapper.bom.totalProducts");
		System.out.println("countEmp실행");
		System.out.println("result 값="+result);
		
		return result;
	}

	@Override
	public List<Products_DTO> insertProducts() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Products_DTO> selectProductserch() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Products_DTO> selectProductname() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Products_DTO> updateProducts() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Products_DTO> updateProductsInspection() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Products_DTO> deleteProducts() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Products_DTO> selectProductnameserch() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Materials_DTO> deleteMaterials() {
		// TODO Auto-generated method stub
		return null;
	}

	

	
}
