package project.service.Prodplan_total_service;

import java.util.List;
import project.dto.ProductionPlan_DTO;

public interface Prodplan_service {
	//��ȸ
    List<ProductionPlan_DTO> getAllPlans();  
    //����
    void insertPlan(ProductionPlan_DTO plan);    
    //����
    void updatePlan(ProductionPlan_DTO plan);    
    List<ProductionPlan_DTO> getProducts(String searchTerm);

}
