package project.service.Prodplan_total_service;

import java.util.List;

import project.dto.ProductionPlan_DTO;

public interface Prodplan_service {
    List<ProductionPlan_DTO> getAllPlans();
    void updatePlan(ProductionPlan_DTO plan);
    void insertPlan(ProductionPlan_DTO plan);
}
