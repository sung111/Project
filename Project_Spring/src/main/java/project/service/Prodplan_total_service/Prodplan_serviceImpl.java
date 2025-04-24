package project.service.Prodplan_total_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.dao.Prodplan_total_dao.Prodplan_DAO;
import project.dto.ProductionPlan_DTO;

@Service
public class Prodplan_serviceImpl implements Prodplan_service {

    @Autowired
    private Prodplan_DAO planDAO;

    // 생산 계획 전체 조회
    @Override
    public List<ProductionPlan_DTO> getAllPlans() {
        return planDAO.getAllPlans();
    }

    // 생산 계획 추가
    @Override
    public void insertPlan(ProductionPlan_DTO plan) {
        if (plan == null) {
            throw new IllegalArgumentException("생산 계획 정보가 비어 있습니다.");
        }
        planDAO.insertPlan(plan); 
    }

    // 생산 계획 수정
    @Override
    public void updatePlan(ProductionPlan_DTO plan) {
        if (plan == null || plan.getProductId() <= 0) {
            throw new IllegalArgumentException("수정할 계획 정보 또는 제품 ID가 비어 있거나 잘못되었습니다.");
        }
        planDAO.updatePlan(plan);
    }
    @Override
    public List<ProductionPlan_DTO> getProducts(String searchTerm) {
        return planDAO.getProducts(searchTerm);
    }

}
