package project.service.Standard_total_service;

import java.util.List;
import java.util.Map;

import project.dto.Materials_DTO;
import project.dto.Products_DTO;

public interface Products_service {

	List<Products_DTO> insertProducts();
	List<Products_DTO> selectProductserch();
	List<Products_DTO> selectProductname();
	List<Products_DTO> updateProducts();
	List<Products_DTO> updateProductsInspection();
	List<Products_DTO> deleteProducts();
	List<Products_DTO> selectProductnameserch();
	//사용하는거
	public Map<String,Object> selectProducts(Products_DTO dto);
	public int insertProducts(Products_DTO dto);
	public int updateProducts(Products_DTO dto);
	public int deleteProducts(Products_DTO dto);
	
	
}
