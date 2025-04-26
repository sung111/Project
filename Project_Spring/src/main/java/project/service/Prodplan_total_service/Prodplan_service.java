package project.service.Prodplan_total_service;

import java.util.List;
import project.dto.ProductionPlan_DTO;

public interface Prodplan_service {
    // 전체 조회
    List<ProductionPlan_DTO> getAllPlans();  

    // 추가
    void insertPlan(ProductionPlan_DTO plan);    

    // 수정
    void updatePlan(ProductionPlan_DTO dto); 

    // 삭제
    void deletePlan(int planId);

    // 제품 검색
    List<ProductionPlan_DTO> getProducts(String searchTerm);

    // 생산 계획 세부 정보 조회
    ProductionPlan_DTO getPlanDetails(int planId);  // 추가
}
