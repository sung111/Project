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
    public void updatePlan(ProductionPlan_DTO dto) {
        planDAO.updatePlan(dto);
    }



    // 상품 검색 자동완성용
    @Override
    public List<ProductionPlan_DTO> getProducts(String searchTerm) {
        return planDAO.getProducts(searchTerm);
    }
    
    //생산 계획 삭제
    @Override
    public void deletePlan(int planId) {
        if (planId <= 0) {
            throw new IllegalArgumentException("유효하지 않은 생산계획 명령입니다.");
        }
        planDAO.deletePlan(planId);
    }

}
