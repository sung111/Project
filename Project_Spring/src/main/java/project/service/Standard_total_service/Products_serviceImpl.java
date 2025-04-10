package project.service.Standard_total_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.Standard_total_dao.Products_DAO;
import project.dto.Products_DTO;

@Service
public class Products_serviceImpl implements Products_service {

	@Autowired
	Products_DAO products_DAO;
	
	@Override
	public List<Products_DTO> selectProducts() {
		List<Products_DTO> list = null;
		try {
		list = products_DAO.selectProducts();
			
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
