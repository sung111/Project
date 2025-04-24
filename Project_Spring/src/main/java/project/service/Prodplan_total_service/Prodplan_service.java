package project.service.Prodplan_total_service;

import java.util.List;
import project.dto.ProductionPlan_DTO;

public interface Prodplan_service {
	//조회
    List<ProductionPlan_DTO> getAllPlans();  
    //생성
    void insertPlan(ProductionPlan_DTO plan);    
    //수정
    void updatePlan(ProductionPlan_DTO plan);    
    List<ProductionPlan_DTO> getProducts(String searchTerm);

}
