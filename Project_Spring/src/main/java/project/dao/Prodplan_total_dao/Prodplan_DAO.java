package project.dao.Prodplan_total_dao;

import java.util.List;
import project.dto.ProductionPlan_DTO;

public interface Prodplan_DAO {
    List<ProductionPlan_DTO> getAllPlans();       

    // 수정
    void updatePlan(ProductionPlan_DTO plan);
    
    // 추가
    void insertPlan(ProductionPlan_DTO plan);    
    
    List<ProductionPlan_DTO> getProducts(String searchTerm);

    // 삭제
    void deletePlan(int planId);
    
    // 생산 계획 세부 정보 조회
    ProductionPlan_DTO getPlanDetails(int planId);  // 추가
    
    int getTotalCount();
    List<ProductionPlan_DTO> getProdPlanList(int pageNo, int viewCount);
    
}
