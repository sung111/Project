package project.service.Standard_total_service;

import java.util.List;

import project.dto.Products_DTO;

public interface Products_service {

	List<Products_DTO> selectProducts();
	List<Products_DTO> insertProducts();
	List<Products_DTO> selectProductserch();
	List<Products_DTO> selectProductname();
	List<Products_DTO> updateProducts();
	List<Products_DTO> updateProductsInspection();
	List<Products_DTO> deleteProducts();
	List<Products_DTO> selectProductnameserch();
}
