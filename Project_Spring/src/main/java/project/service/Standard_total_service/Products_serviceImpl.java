package project.service.Standard_total_service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.Standard_total_dao.Products_DAO;
import project.dto.Products_DTO;

@Service
public class Products_serviceImpl implements Products_service {

	@Autowired
	Products_DAO products_DAO;
	
	@Override
	public Map<String,Object> selectProducts(Products_DTO dto) {
		Map <String,Object> map = new HashMap();
		try {
			
		//한페이지의 내용만 있는 리스트
		List list = products_DAO.selectProducts(dto);
		//전체 글 개수 
		int count = products_DAO.countProducts();
		
		map.put("list2", list);
		map.put("count", count);
		
		System.out.println("selectProducts 실행");
		System.out.println("list :"+list+""+"count :"+count);
		//그대로주고 DB에서 바꾸자 
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return map;
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
