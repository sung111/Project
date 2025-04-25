package project.service.Prodplan_total_service;

import java.util.List;
import project.dto.ProductionPlan_DTO;

public interface Prodplan_service {
	//��ȸ
    List<ProductionPlan_DTO> getAllPlans();  
    //추가
    void insertPlan(ProductionPlan_DTO plan);    
    //수정
	/* void updatePlan(ProductionPlan_DTO dto); */
    //삭제
    void deletePlan(int planId);
    List<ProductionPlan_DTO> getProducts(String searchTerm);
    

}
