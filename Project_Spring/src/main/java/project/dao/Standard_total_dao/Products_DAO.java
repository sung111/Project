package project.dao.Standard_total_dao;

import java.util.List;

import project.dto.Materials_DTO;
import project.dto.Products_DTO;

public interface Products_DAO {
	
	List<Products_DTO> selectProducts(Products_DTO dto);
	List<Products_DTO> insertProducts();
	List<Products_DTO> selectProductserch();
	List<Products_DTO> selectProductname();
	List<Products_DTO> updateProducts();
	List<Products_DTO> updateProductsInspection();
	List<Products_DTO> deleteProducts();
	List<Products_DTO> selectProductnameserch();

	List<Materials_DTO> deleteMaterials();
	public int countProducts ();
}
