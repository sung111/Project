package project.dao.Standard_total_dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.dto.Products_DTO;

@Repository
public class Products_DAOImpl implements Products_DAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Products_DTO> selectProducts() {
		List<Products_DTO> list = null;
		try {
			list = sqlSession.selectList("mapper.emp.selectProducts");
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
			
		return list;
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

}
