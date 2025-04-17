package project.dao.Standard_total_dao;

import java.util.List;

import project.dto.Materials_DTO;
import project.dto.Products_DTO;

public interface Products_DAO {
	
	List<Products_DTO> insertProducts();
	List<Products_DTO> selectProductserch();
	List<Products_DTO> updateProducts();
	List<Products_DTO> updateProductsInspection();
	List<Products_DTO> deleteProducts();

	List<Materials_DTO> deleteMaterials();
//사용
	public List<Products_DTO> selectProductnameserch(String name);
	public List<Products_DTO> selectProducidserch(int pid);
	public List<Products_DTO> selectProductname();
	public List<Products_DTO> selectProducts(Products_DTO dto);
	public List<Products_DTO> selectFinishedProduct(Products_DTO dto);
	public int insertProducts(Products_DTO dto);
	public int updateProducts(Products_DTO dto);
	public int updateProductsFhinish(Products_DTO dto);
	public int deleteProducts(Products_DTO dto);
	public int countProducts ();
//사용
}
