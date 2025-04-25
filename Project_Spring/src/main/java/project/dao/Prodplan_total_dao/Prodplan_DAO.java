package project.dao.Prodplan_total_dao;

import java.util.List;

import project.dto.ProductionPlan_DTO;

public interface Prodplan_DAO {
    List<ProductionPlan_DTO> getAllPlans();       
    void updatePlan(ProductionPlan_DTO plan);     
    void insertPlan(ProductionPlan_DTO plan);    
    List<ProductionPlan_DTO> getProducts(String searchTerm);
    //삭제
    void deletePlan(int planId);

}
